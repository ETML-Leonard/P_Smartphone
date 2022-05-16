<nav class="d-flex justify-content-center navbar navbar-expand-lg navbar-light bg-light">
    <ul class="nav nav-justified">
        <li><a class="navbar-brand" href="index.php?controller=home&action=index">Accueil</a></li>
        <li><a class="navbar-brand" href="index.php?controller=car&action=list&carIndex=1">Voitures</a></li>
        <?php
        if (isset($_SESSION['user'])) {
                echo "<li><a class=\"btn btn-dark\">Logout</a></li>";
        }
        else{
            echo "<li><a class=\"btn btn-primary\" href=\"index.php?controller=account&action=login\">Login</a></li>
            <li><a class=\"btn btn-success\" href=\"index.php?controller=account&action=register\">Register</a></li>";
        }
        ?>
    </ul>
</nav>
</div>