class CheckLogin {
  final String username;
  final String password;

  CheckLogin({
    required this.username,
    required this.password,
  });

  bool checkLoginData() {
    if (username == 'admin' && password == 'admin123') {
      return true;
    }
    return false;
  }
}
