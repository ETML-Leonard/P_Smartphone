<div class="container">
	<div>
		<?php
		include_once(".\model\database.php");
		if (isset($_GET["idPhone"]) && is_numeric($_GET["idPhone"])) {
			$id = $_GET["idPhone"];
			$database = new Database();
			$phone = $database->getOnePhone($id);
			$title = $phone["phoName"];
			echo "<h1 class =\"border\">$title</h1>";
		}
		?>
	</div>
	<div class="d-flex justify-content-center">
		<div class="d-flex flex-wrap w-75 ">
		</div>
	</div>
	<div>
		<p>
			<?php
			echo "<div class=\" w-100\"><img class =\"img-rounded w-50\" src=\"resources/image/phones/$id/1.jpg\" alt=\"Car Image 1\"></div>";

			$phoneInfo = array("Model" => $phone["phoName"], "Marque" => $phone["phoBrand"], "Size" => $phone["phoSize"], "Cpu" => $phone["phoCpu"], "Storage" => $phone["phoStorage"], "Price MSRP" => $phone["phoPriceMSRP"], "Price" => $phone["phoPrice"], "Definition" => $phone["phoDefinition"], "Screen Size" => $phone["phoScreenSize"], "Cores" => $phone["phoCores"], "Autonomy" => $phone["phoAutonomy"], "Ram" => $phone["phoRam"], "Screen Technology" => $phone["phoScreenTechnology"], "Connectivity" => $phone["phoConnectivity"]);
			echo "<table class=\"table\" >";
			echo "<tr>";
			echo "<th scope=\"col\">Information</th>";
			echo "<th scope=\"col\">" . $phone["phoName"] . "</th>";
			echo "</tr>";

			foreach ($phoneInfo as $key => $value) {
				echo "<tr>";
				echo "<td>" . $key . "</td>";
				echo "<td>" . $value . "</td>";
				echo "</tr>";
			}
			?>
		</p>
	</div>
	<div>
	</div>
</div>