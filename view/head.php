<?php //session_start();?>
<!DOCTYPE html>
    <!--
	Auteur		:	Jonathan Dale
	Date		:	04.04.2022
	Description	:	Header du site 
	-->
<html lang="fr">
<head>
    <meta charset="utf-8">
    <title>DigiFlex<?php if(isset( $_GET["action"])) echo " :: " . $_GET["action"] ?></title>

    <!-- Bootstrap core CSS -->
    <link href="resources/css/bootstrap.min.css" rel="stylesheet">
    <script src="resources/js/bootstrap.bundle.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
</head>

<body>