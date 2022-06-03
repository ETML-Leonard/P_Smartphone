<?php

/**
 * Auteur : Léonard Frauchiger
 * Date : 07.03.2022
 * Description : File to handle database queries
 */

class Database
{
	private $connector;

	// Connect to the database using PDO. Returns a PDO object
	public function __construct()
	{
		try {
			$this->connector = new PDO('mysql:host=localhost;dbname=db_Smartphones;charset=utf8', 'dbUser_Smartphones', '.Etml-');
		} catch (PDOException $e) {
			die('Erreur : ' . $e->getMessage());
		}
	}

	//This is used to format data correctly from data received after a query
	private function formatData($req)
	{
		return $req->fetchALL(PDO::FETCH_ASSOC);
	}

	//Deallocate memory for a request. Saves resources
	private function unsetData($req)
	{
		$req->closeCursor();
	}

	//Send a request, get the response and deallocate the request object
	private function querySimpleExecute(string $query)
	{
		$req = $this->connector->query($query);
		$req->execute();
		$result = $this->formatData($req);
		$this->unsetData($req);
		return $result;
	}

	//Function to prepare a query. Mostly used to prevent SQL injections
	private function queryPrepareExecute($query, $binds)
	{
		$req = $this->connector->prepare($query);
		foreach ($binds as $bind) {
			$req->bindValue($bind[0], $bind[1], $bind[2]);
		}
		$req->execute();
		$result = $this->formatData($req);
		$this->unsetData($req);
		return $result;
	}

	//Deallocate the PDO object which is used for the connection to the MySQL database
	public function closeConnection()
	{
		$this->connector = null;
		unset($this->connector);
	}

	//Get the number of cars contained in the database
	public function getTotalNumOfPhones()
	{
		return ($this->querySimpleExecute("SELECT COUNT(*) FROM db_Smartphones.t_phone;"))[0]["COUNT(*)"];
	}

	//Function to get a specific number of cars starting from an index
	public function getPhonesFromIndex($idStart)
	{
		if (is_numeric($idStart)) {
			$phoneData = [];
			for ($i = $idStart; $i < $idStart + 12; $i++) {
				$car = $this->queryPrepareExecute("SELECT idPhone, phoName, phoPriceMSRP, phoBrand, phoAutonomy,
				phoScreenTechnology, phoOs FROM db_Smartphones.t_phone WHERE idPhone = :id", array(array(":id", $i, PDO::PARAM_INT)));
				$phoneData[$i] = $car;
			}
			return $phoneData;
		}
	}

	//Function to retrieve all information about a specific car
	public function getOnePhone($idPhone)
	{
		$phone = $this->queryPrepareExecute(
			"SELECT idPhone, phoName, phoBrand, phoColor, phoOs,
		phoSize, phoCpu, phoStorage, phoPriceMSRP, phoPrice,
		phoDefinition, phoScreenSize, phoCores, phoAutonomy, phoRam, phoScreenTechnology, phoConnectivity,phoCameraQuality FROM db_Smartphones.t_phone WHERE idPhone = :id",
			array(array(":id", $idPhone, PDO::PARAM_INT))
		);
		return $phone[0];
	}
}
