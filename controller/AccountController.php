<?php
/**
 * ETML
 * Auteur : Dale Jonathan
 * Date: 04.04.2022
 * Controler pour gérer les clients
 */

class AccountController extends Controller {

    /**
     * Permet de choisir l'action à effectuer
     *
     * @return mixed
     */
    public function display() {

        $action = $_GET['action'] . "Action";

        // Appelle une méthode dans cette classe (ici, ce sera le nom + action (ex: listAction, detailAction, ...))
        return call_user_func(array($this, $action));
    }

    private function loginAction() {

        $view = file_get_contents(dirname(__FILE__) .'\..\view\page\account\login.php');

        ob_start();
        eval('?>' . $view);
        $content = ob_get_clean();

        return $content;
    }

    private function registerAction() {

        $view = file_get_contents(dirname(__FILE__) .'\..\view\page\account\register.php');

        ob_start();
        eval('?>' . $view);
        $content = ob_get_clean();

        return $content;
    }

    private function registerCheckAction() {

        $view = file_get_contents(dirname(__FILE__) .'\..\view\page\account\registerCheck.php');

        ob_start();
        eval('?>' . $view);
        $content = ob_get_clean();

        return $content;
    }

    private function loginCheckAction() {

        $view = file_get_contents(dirname(__FILE__) .'\..\view\page\account\loginCheck.php');

        ob_start();
        eval('?>' . $view);
        $content = ob_get_clean();

        return $content;
    }

}