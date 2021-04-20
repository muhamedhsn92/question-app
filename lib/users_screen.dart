import 'package:flutter/material.dart';

class UserModel {
  final int id;
  final String name;
  final String phone;

  UserModel({@required this.id, @required this.name, @required this.phone});
}

class UsersScreen extends StatelessWidget {
  List<UserModel> users = [
    UserModel(id: 1, name: 'ali salem', phone: '+201016784171'),
    UserModel(id: 2, name: 'osama', phone: '+201016784171'),
    UserModel(id: 3, name: 'ahmed', phone: '+201016784171'),
    UserModel(id: 4, name: 'wael', phone: '+201016784171'),
    UserModel(id: 5, name: 'faried', phone: '+201016784171'),
    UserModel(id: 6, name: 'ahmed', phone: '+201016784171'),
    UserModel(id: 7, name: 'wael', phone: '+201016784171'),
    UserModel(id: 8, name: 'faried', phone: '+201016784171'),
    UserModel(id: 9, name: 'ahmed', phone: '+201016784171'),
    UserModel(id: 10, name: 'wael', phone: '+201016784171'),
    UserModel(id: 11, name: 'faried', phone: '+201016784171'),
    UserModel(id: 12, name: 'ahmed', phone: '+201016784171'),
    UserModel(id: 13, name: 'wael', phone: '+201016784171'),
    UserModel(id: 14, name: 'faried', phone: '+201016784171'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Users',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        body: ListView.separated(
            itemBuilder: (context, index) => buildUserItem(users[index]),
            separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsetsDirectional.only(start: 20),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      width: double.infinity,
                      height: 2,

                      decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius:
                              BorderRadius.all(Radius.circular(8.2))),
                    ),
                  ),
                ),
            itemCount: users.length));
  }

  Widget buildUserItem(UserModel user) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 25,
            backgroundColor: Colors.blue,
            child: Text(
              '${user.id}',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                '${user.name}',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                '${user.phone}',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
