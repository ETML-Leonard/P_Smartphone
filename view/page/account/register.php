<form action="./index.php?controller=account&action=registerCheck" method="POST">
  <div class="form-group">

  <label for="username"><b>Username</b></label>
    <input class="form-control" type="text" placeholder="Enter Username" name="username" required>

    <label for="name"><b>Name</b></label>
    <input class="form-control" type="text" placeholder="Enter Name" name="name" required>

    <label for="surname"><b>Surname</b></label>
    <input class="form-control" type="text" placeholder="Enter Surname" name="surname" required>

    <label for="email"><b>Email</b></label>
    <input class="form-control" type="email" placeholder="Enter Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input class="form-control" type="password" placeholder="Enter Password" name="psw" required>

    <label for="psw-repeat"><b>Repeat Password</b></label>
    <input class="form-control" type="password" placeholder="Repeat Password" name="psw-repeat" required>
    <hr>

    <button type="submit" class="btn btn-primary">Register</button>
  </div>
  
  <div>
    <p class="border m-2 p-1">Already have an account? <a href="./index.php?controller=account&action=login">Sign in</a>.</p>
  </div>
</form>