<div class="container">
	<div>
		<?php
		include_once(".\model\database.php");
		if (isset($_GET["idCar"]) && is_numeric($_GET["idCar"])) {
			$id = $_GET["idCar"];
			$database = new Database();
			$car = $database->getOneCar($id);
			var_dump($car);
			$title = $car["carModel"];
			echo "<h1 class =\"border\">$title</h1>";
		}
		?>
	</div>
	<div class="d-flex justify-content-center">
		<div class="d-flex flex-wrap w-75 ">
			<?php
			if (isset($id)) {
				echo "<div class=\" w-100\"><img class =\"img-rounded w-100\" src=\"resources/image/cars/$id/0.jpg\" alt=\"Car Image 1\"></div>";
				echo "<div class=\" w-50\"><img class =\"img-rounded w-100\" src=\"resources/image/cars/$id/1.jpg\" alt=\"Car Image 2\"></div>";
				echo "<div class=\" w-50\"><img class =\"img-rounded w-100\" src=\"resources/image/cars/$id/2.jpg\" alt=\"Car Image 3\"></div>";
			}
			?>
		</div>
	</div>
	<div>
		<p>
			<?php
			if (isset($id)) {
				echo $car["carDescription"];
			}
			?>
		</p>
	</div>
	<div>
		<h1 class="p-2 border">Commentaires</h1>
		<div class="p-1 border">
			<?php
			if (isset($id)) {
				$comments = $database->GetCommentsForCar($id);
				foreach ($comments as $comment) {
					$username = $database->GetUsernameFromId($id);
					echo "<div class=\"m-1\"><h2>" . $username . "</h2>";
					echo "<p>" . $comment["comCommentText"] . "</p></div>";
				}
			}
			?>
		</div>
	</div>
</div>