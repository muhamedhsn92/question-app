import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/shared/components/components.dart';
import 'package:question_app/shared/components/constants.dart';
import 'package:question_app/shared/cubit/cubit.dart';
import 'package:question_app/shared/cubit/states.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {
  Database database;
  var scafoldKey = GlobalKey<ScaffoldState>();
  var formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();
  var statusController = TextEditingController();

//  List<Map> tasks = []; // move this list to constants file
//  form data

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit()..createDatabase(),
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {
          if (state is AppInsertDataBaseState) {
            Navigator.pop(context);
          }
        },
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            key: scafoldKey,
            appBar: AppBar(
              backgroundColor: Colors.lightBlueAccent,
              title: Text(cubit.titles[cubit.currentIndex]),
            ),
//      conditional builder to make condition with widget
            body: state is AppFetchDataBaseLoadingState
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : cubit.screens[cubit.currentIndex],
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                if (cubit.isButtonSheetOpened) {
                  if (formKey.currentState.validate()) {
                    cubit.insertToDatabase(
                      title: titleController.text,
                      date: dateController.text,
                      time: timeController.text,
                    );

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
                    cubit.changeBottomSheetState(
                      isShow: false,
                      icon: Icons.edit,
                    );
                  });
                  cubit.changeBottomSheetState(
                    isShow: true,
                    icon: Icons.add,
                  );
                }
              },
              child: Icon(cubit.fabIcon),
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  title: Text('New tasks'),
                  icon: Icon(Icons.menu),
                ),
                BottomNavigationBarItem(
                  title: Text('Done tasks'),
                  icon: Icon(Icons.check_circle_outline),
                ),
                BottomNavigationBarItem(
                  title: Text('Archived'),
                  icon: Icon(Icons.archive),
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
}
