import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/modules/archive_tasks/archive_tasks_screen.dart';
import 'package:question_app/modules/done_tasks/done_tasks_screen.dart';
import 'package:question_app/modules/new_tasks/new_tasks_screen.dart';
import 'package:question_app/shared/components/components.dart';
import 'package:question_app/shared/components/constants.dart';
import 'package:question_app/shared/cubit/cubit.dart';
import 'package:question_app/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {
  // void initState() {
  //   super.initState();
  //   createDatabase();
  // }

  // int currentIndex = 0;
  // List<Widget> screens = [
  //   NewTasksScreen(),
  //   DoneTasksScreen(),
  //   ArchiveTasksScreen()
  // ];
  // List<String> titles = [
  //   'New Tasks',
  //   'Done Tasks',
  //   'Archive Tasks',
  // ];
  Database database;
  var scafoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  bool isButtonSheetOpened = false;
  IconData fabIcon = Icons.edit;
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var statusController = TextEditingController();

//  List<Map> tasks = []; // move this list to constants file
//  form data

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scafoldKey,
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
//      conditional builder to make condition with widget
            body: tasks.length == 0
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : cubit.screens[cubit.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (isButtonSheetOpened) {
                  if (formKey.currentState.validate()) {
                    insertToDatabase(
                      date: dateController.text,
                      time: timeController.text,
                      title: titleController.text,
                    ).then((value) {
                      getDataFromDatabase(database).then((value) {
                        Navigator.pop(context);
                        // setState(() {
                        //   tasks = value;
                        //   fabIcon = Icons.edit;
                        //   isButtonSheetOpened = false;
                        // });
                      });
                    });
                  }
                } else {
                  scafoldKey.currentState
                      .showBottomSheet(
                          (context) => Container(
                                color: Colors.grey[200],
                                padding: EdgeInsets.all(20.0),
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      defaultFormField(
                                          controller: titleController,
                                          type: TextInputType.text,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'title must not be empty ';
                                            }
                                            return null;
                                          },
                                          label: 'title input',
                                          prefix: Icons.title),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      defaultFormField(
                                          controller: timeController,
                                          type: TextInputType.datetime,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'time must not be empty ';
                                            }
                                            return null;
                                          },
                                          onTab: () {
                                            showTimePicker(
                                              context: context,
                                              initialTime: TimeOfDay.now(),
                                            ).then(
                                              (value) => timeController.text =
                                                  value.format(context),
                                            );
                                          },
                                          label: 'time input',
                                          prefix: Icons.watch_later),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      defaultFormField(
                                          controller: dateController,
                                          type: TextInputType.datetime,
                                          validate: (String value) {
                                            if (value.isEmpty) {
                                              return 'date must not be empty ';
                                            }
                                            return null;
                                          },
                                          onTab: () {
                                            showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime.now(),
                                              lastDate:
                                                  DateTime.parse('2021-08-01'),
                                            ).then(
                                              (value) => dateController.text =
                                                  value.toString(),
                                            );
                                          },
                                          label: 'date input',
                                          prefix: Icons.calendar_today),
                                    ],
                                  ),
                                ),
                              ),
                          clipBehavior: Clip.hardEdge)
                      .closed
                      .then((value) {
                    isButtonSheetOpened = false;
                    // setState(() {
                    //   fabIcon = Icons.edit;
                    // });
                  });
                  isButtonSheetOpened = true;
                  // setState(() {
                  //   fabIcon = Icons.add;
                  // });
                }
//          this method is yyo insert new row in database
//          insertToDatabase();
//          var name = await getName();
//          print(name);

//          using try{
//          do some thing
//          }catch(error){
//          handle error inside catch
//          }

//           Future methods provide you with .then().cathchError() methods
                // and you can use .then((value){
                // do some thing with value
                // }).catchError((){
                // handle error inside this catchError
                // })
              },
              child: Icon(fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                // setState(() {
                //   currentIndex = index;
                // });
              },
              items: [
                BottomNavigationBarItem(
                  title: Text('title'),
                  icon: Icon(Icons.email),
                ),
                BottomNavigationBarItem(
                  title: Text('title'),
                  icon: Icon(Icons.email),
                ),
                BottomNavigationBarItem(
                  title: Text('title'),
                  icon: Icon(Icons.email),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<String> getName() async {
    return ' Muhamed hassan';
  }

  void createDatabase() async {
    database = await openDatabase(
      'todo.db',
      version: 2,
      onCreate: (database, version) {
        print('database create');
        database
            .execute(
                'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
            .then((value) => {print('table created')})
            .catchError((error) {
          print('error in create table $error');
        });
      },
      onOpen: (database) {
        getDataFromDatabase(database).then((value) {
          // setState(() {
          //   tasks = value;
          // });
        });
        print('database opened ');
      },
    );
  }

  Future insertToDatabase({
    @required String title,
    @required String date,
    @required String time,
  }) async {
    return await database.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO tasks (title,date,time,status) VALUES("$title","$date","$time","new")')
          .then((value) => {print('inserted successfully $value')})
          .catchError((error) {
        print('error in insert $error');
      });
      return null;
    });
  }

  Future<List<Map>> getDataFromDatabase(database) async {
    return await database.rawQuery('SELECT * FROM tasks');
  }
// class HomeLayout extends StatefulWidget {
// @override
// _HomeLayoutState createState() => _HomeLayoutState();
}

// class _HomeLayoutState extends State<HomeLayout> {
//
//   // void initState() {
//   //   super.initState();
//   //   createDatabase();
//   // }
//
//   int currentIndex = 0;
//   List<Widget> screens = [
//     NewTasksScreen(),
//     DoneTasksScreen(),
//     ArchiveTasksScreen()
//   ];
//   List<String> titles = [
//     'New Tasks',
//     'Done Tasks',
//     'Archive Tasks',
//   ];
//   Database database;
//   var scafoldKey = GlobalKey<ScaffoldState>();
//   var formKey = GlobalKey<FormState>();
//   bool isButtonSheetOpened = false;
//   IconData fabIcon = Icons.edit;
//   var titleController = TextEditingController();
//   var timeController = TextEditingController();
//   var dateController = TextEditingController();
//   var statusController = TextEditingController();
//
// //  List<Map> tasks = []; // move this list to constants file
// //  form data
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: scafoldKey,
//       appBar: AppBar(
//         title: Text(titles[currentIndex]),
//       ),
// //      conditional builder to make condition with widget
//       body: tasks.length == 0
//           ? Center(
//               child: CircularProgressIndicator(),
//             )
//           : screens[currentIndex],
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           if (isButtonSheetOpened) {
//             if (formKey.currentState.validate()) {
//               insertToDatabase(
//                 date: dateController.text,
//                 time: timeController.text,
//                 title: titleController.text,
//               ).then((value) {
//                 getDataFromDatabase(database).then((value) {
//                   Navigator.pop(context);
//                   setState(() {
//                     tasks = value;
//                     fabIcon = Icons.edit;
//                     isButtonSheetOpened = false;
//                   });
//                 });
//
//               });
//             }
//           } else {
//             scafoldKey.currentState
//                 .showBottomSheet(
//                     (context) => Container(
//                           color: Colors.grey[200],
//                           padding: EdgeInsets.all(20.0),
//                           child: Form(
//                             key: formKey,
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               children: <Widget>[
//                                 defaultFormField(
//                                     controller: titleController,
//                                     type: TextInputType.text,
//                                     validate: (String value) {
//                                       if (value.isEmpty) {
//                                         return 'title must not be empty ';
//                                       }
//                                       return null;
//                                     },
//                                     label: 'title input',
//                                     prefix: Icons.title),
//                                 SizedBox(
//                                   height: 15.0,
//                                 ),
//                                 defaultFormField(
//                                     controller: timeController,
//                                     type: TextInputType.datetime,
//                                     validate: (String value) {
//                                       if (value.isEmpty) {
//                                         return 'time must not be empty ';
//                                       }
//                                       return null;
//                                     },
//                                     onTab: () {
//                                       showTimePicker(
//                                         context: context,
//                                         initialTime: TimeOfDay.now(),
//                                       ).then(
//                                         (value) => timeController.text =
//                                             value.format(context),
//                                       );
//                                     },
//                                     label: 'time input',
//                                     prefix: Icons.watch_later),
//                                 SizedBox(
//                                   height: 15.0,
//                                 ),
//                                 defaultFormField(
//                                     controller: dateController,
//                                     type: TextInputType.datetime,
//                                     validate: (String value) {
//                                       if (value.isEmpty) {
//                                         return 'date must not be empty ';
//                                       }
//                                       return null;
//                                     },
//                                     onTab: () {
//                                       showDatePicker(
//                                         context: context,
//                                         initialDate: DateTime.now(),
//                                         firstDate: DateTime.now(),
//                                         lastDate: DateTime.parse('2021-08-01'),
//                                       ).then(
//                                         (value) => dateController.text =
//                                             value.toString(),
//                                       );
//                                     },
//                                     label: 'date input',
//                                     prefix: Icons.calendar_today),
//                               ],
//                             ),
//                           ),
//                         ),
//                     clipBehavior: Clip.hardEdge)
//                 .closed
//                 .then((value) {
//               isButtonSheetOpened = false;
//               setState(() {
//                 fabIcon = Icons.edit;
//               });
//             });
//             isButtonSheetOpened = true;
//             setState(() {
//               fabIcon = Icons.add;
//             });
//           }
// //          this method is yyo insert new row in database
// //          insertToDatabase();
// //          var name = await getName();
// //          print(name);
//
// //          using try{
// //          do some thing
// //          }catch(error){
// //          handle error inside catch
// //          }
//
// //           Future methods provide you with .then().cathchError() methods
//           // and you can use .then((value){
//           // do some thing with value
//           // }).catchError((){
//           // handle error inside this catchError
//           // })
//         },
//         child: Icon(fabIcon),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: currentIndex,
//         type: BottomNavigationBarType.fixed,
//         onTap: (index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             title: Text('title'),
//             icon: Icon(Icons.email),
//           ),
//           BottomNavigationBarItem(
//             title: Text('title'),
//             icon: Icon(Icons.email),
//           ),
//           BottomNavigationBarItem(
//             title: Text('title'),
//             icon: Icon(Icons.email),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<String> getName() async {
//     return ' Muhamed hassan';
//   }
//
//   void createDatabase() async {
//     database = await openDatabase(
//       'todo.db',
//       version: 2,
//       onCreate: (database, version) {
//         print('database create');
//         database
//             .execute(
//                 'CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT)')
//             .then((value) => {print('table created')})
//             .catchError((error) {
//           print('error in create table $error');
//         });
//       },
//       onOpen: (database) {
//         getDataFromDatabase(database).then((value) {
//           setState(() {
//             tasks = value;
//           });
//         });
//         print('database opened ');
//       },
//     );
//   }
//
//   Future insertToDatabase({
//     @required String title,
//     @required String date,
//     @required String time,
//   }) async {
//     return await database.transaction((txn) {
//       txn
//           .rawInsert(
//               'INSERT INTO tasks (title,date,time,status) VALUES("$title","$date","$time","new")')
//           .then((value) => {print('inserted successfully $value')})
//           .catchError((error) {
//         print('error in insert $error');
//       });
//       return null;
//     });
//   }
//
//   Future<List<Map>> getDataFromDatabase(database) async {
//     return await database.rawQuery('SELECT * FROM tasks');
//   }
// }
