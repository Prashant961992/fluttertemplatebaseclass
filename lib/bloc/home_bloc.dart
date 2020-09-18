import '../index.dart';

class Users {
  String name;
  String age;
  String url;

  Users({
    this.name,
    this.age,
    this.url
  });
}

class HomeBloc extends BaseBloc {
  List<Users> users = [
    Users(name: "Rosamond", age: "25",url: "https://s3.amazonaws.com/uifaces/faces/twitter/thehacker/128.jpg"),
    Users(name: "Gina", age: "25",url: "https://s3.amazonaws.com/uifaces/faces/twitter/arishi_/128.jpg"),
    Users(name: "Rosamond", age: "25",url: "https://s3.amazonaws.com/uifaces/faces/twitter/thehacker/128.jpg"),
    Users(name: "Gina", age: "25",url: "https://s3.amazonaws.com/uifaces/faces/twitter/arishi_/128.jpg"),
    Users(name: "Rosamond", age: "25",url: "https://s3.amazonaws.com/uifaces/faces/twitter/thehacker/128.jpg"),
    Users(name: "Gina", age: "25",url: "https://s3.amazonaws.com/uifaces/faces/twitter/arishi_/128.jpg"),
    Users(name: "Gina", age: "25",url: "https://s3.amazonaws.com/uifaces/faces/twitter/arishi_/128.jpg"),
    Users(name: "Rosamond", age: "25",url: "https://s3.amazonaws.com/uifaces/faces/twitter/thehacker/128.jpg"),
    Users(name: "Gina", age: "25",url: "https://s3.amazonaws.com/uifaces/faces/twitter/arishi_/128.jpg"),
    Users(name: "Rosamond", age: "25",url: "https://s3.amazonaws.com/uifaces/faces/twitter/thehacker/128.jpg"),
    Users(name: "Gina", age: "25",url: "https://s3.amazonaws.com/uifaces/faces/twitter/arishi_/128.jpg"),
  ];
  // AuthenticationRepository _authenticationRepository =
  //     AuthenticationRepository();
  // BehaviorSubject behaviorSubject = BehaviorSubject<ApiState>();

  dispose() {
    users.clear();
  }
  
}