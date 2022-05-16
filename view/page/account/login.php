<form action="./index.php?controller=account&action=loginCheck" method="POST">
  <div class="form-group">
    <label for="email"><b>Email</b></label>
    <input class="form-control" type="email" placeholder="Enter Email" name="email" required>

    <label for="psw"><b>Password</b></label>
    <input class="form-control" type="password" placeholder="Enter Password" name="psw" required>

<hr>

    <button type="submit" class="btn btn-primary">Login</button>
  </div>
  
  <div>
    <p class="border m-2 p-1">Don't have an account? <a href="./index.php?controller=account&action=register">Register</a>.</p>
  </div>
</form>