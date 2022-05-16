<div class="container">

	<h2>Liste des voiture</h2>
	<div class="row">
		<?php
		include_once(".\model\database.php");
		if (isset($_GET["carIndex"]) && is_numeric($_GET["carIndex"])) {
			$carIndex = $_GET["carIndex"];
			$database = new Database();
			$cars = $database->getCarsFromIndex($carIndex);
			foreach ($cars as $car) {
				if ($car) {
					foreach ($car as $carData) {
						$id = $carData["idCar"];
						$name = $carData["carModel"];
						$price = $carData["carPrice"];
						$hp = $carData["carEngineHorsePower"];
						$max = $carData["carMaxSpeed"];
						$zeroToHundred = $carData["carZeroToHundredKM"];
						$imagePath = "resources/image/cars/$id/0.jpg";
						echo "<div class=\"col-md-4\">
						<div class=\"card mb-4 box-shadow\">
							<div class=\"card-body d-flex justify-content-center\">
								<h5 class=\"card-title\">$name</h5>
							</div>
						  <img class=\"card-img-top\" src=\"$imagePath\">
						  <div class=\"card-body\">
							<p class=\"card-text\">Price is $price CHF, it has $hp horse power with a max speed of $max, and goes from 0 to 100km in $zeroToHundred seconds</p>
							<div class=\"d-flex justify-content-between align-items-center\">
							  <div class=\"btn-group\">
								<a href=\"index.php?controller=car&action=detail&idCar=$id\" class=\"btn btn-sm btn-outline-secondary\">Details</a>
							  </div>
							</div>
						  </div>
						</div>
					  </div>";
					}//foreach ($car as $carData)
				}//if ($car)
			}//foreach ($cars as $car)
		}
		?>
	</div>
</div>