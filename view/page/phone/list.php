<div class="container">

	<h2>Liste des telephones</h2>
	<div class="row">
		<?php
		include_once(".\model\database.php");
		if (isset($_GET["phoneIndex"]) && is_numeric($_GET["phoneIndex"])) {
			$phoneIndex = $_GET["phoneIndex"];
			$database = new Database();
			$phones = $database->getPhonesFromIndex($phoneIndex);
			foreach ($phones as $phone) {
				if ($phone) {
					foreach ($phone as $phoneData) {
						$id = $phoneData["idPhone"];
						$name = $phoneData["phoName"];
						$price = $phoneData["phoPriceMSRP"];
						$tech = $phoneData["phoScreenTechnology"];
						$OS = $phoneData["phoOs"];
						$imagePath = "resources/image/phones/$id/1.jpg";
						echo "<div class=\"col-md-4\">
						<div class=\"card mb-4 box-shadow\">
							<div class=\"card-body d-flex justify-content-center\">
								<h5 class=\"card-title\">$name</h5>
							</div>
						  <img class=\"card-img-top\" src=\"$imagePath\">
						  <div class=\"card-body\">
							<p class=\"card-text\">$name acuellement à $price CHF</p>
							<div class=\"d-flex justify-content-between align-items-center\">
							  <div class=\"btn-group\">
								<a href=\"index.php?controller=phone&action=detail&idPhone=$id\" class=\"btn btn-sm btn-outline-secondary\">Details</a>
							  </div>
							</div>
						  </div>
						</div>
					  </div>";
					}
				}
			}
		}
		?>
	</div>
</div>