class HomeUIModel{
  String username = "";

  HomeUIModel({this.username = ""});

  @override
  bool operator == (Object other) =>
      other is HomeUIModel 
      && username == other.username; 

  @override
  int get hashCode => Object.hash(17,username);

}