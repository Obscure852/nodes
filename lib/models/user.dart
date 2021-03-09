class User{

  final String id;
  final String username;
  final String password;
  final String email;
  final String time;

  User({this.id, this.username, this.password, this.email, this.time});

  Map<String,dynamic> toMap(){
    var map = Map<String,dynamic>();
    if(id != null){
      map['id'] = id;
    }

    map['username'] = username;
    map['email'] = email;
    map['password'] = password;
    map['time'] = time;
    return map;
  }
}