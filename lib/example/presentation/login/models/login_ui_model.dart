class LoginUIModel{
  String username;
  String password;

  LoginUIModel({this.username = "",this.password = ""});

  @override
  bool operator == (Object other) =>
      other is LoginUIModel 
      && username == other.username 
      && password == other.password;

  @override
  int get hashCode => Object.hash(username, password);
}