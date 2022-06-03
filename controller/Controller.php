<?php
/**
 * Auteur : Frauchiger Léonard
 * Date: 04.04.2022
 * Contrôleur principal
 */

abstract class Controller {

    /**
     * Méthode permettant d'appeler l'action 
     *
     * @return mixed
     */
    public function display() {

        $page = $_GET['action'] . "Display";

        $this->$page();
    }
}