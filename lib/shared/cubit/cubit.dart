import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/modules/archive_tasks/archive_tasks_screen.dart';
import 'package:question_app/modules/done_tasks/done_tasks_screen.dart';
import 'package:question_app/modules/new_tasks/new_tasks_screen.dart';
import 'package:question_app/shared/cubit/states.dart';
import 'package:question_app/shared/network/local/cache_herlper.dart';
import 'package:sqflite/sqflite.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitial());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> screens = [
    NewTasksScreen(),
    DoneTasksScreen(),
    ArchiveTasksScreen()
  ];
  List<String> titles = [
    'New Tasks',
    'Done Tasks',
    'Archive Tasks',
  ];

  void changeIndex(index) {
    currentIndex = index;
    emit(AppChangeBottomNavBarState());
  }

  List<Map> newTasks = [];
  List<Map> doneTasks = [];
  List<Map> archiveTasks = [];
  Database database;

  void createDatabase() {
    openDatabase(
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
        getDataFromDatabase(database);
        print('database opened ');
      },
    ).then((value) {
      database = value;
      emit(AppCreateDataBaseState());
    });
  }

  insertToDatabase({
    @required String title,
    @required String date,
    @required String time,
  }) async {
    await database.transaction((txn) {
      txn
          .rawInsert(
              'INSERT INTO tasks (title,date,time,status) VALUES("$title","$date","$time","new")')
          .then((value) {
        print('inserted successfully $value');
        emit(AppInsertDataBaseState());
        getDataFromDatabase(database);
      }).catchError((error) {
        print('error in insert $error');
      });
      return null;
    });
  }

  void getDataFromDatabase(database) {
    newTasks = [];
    doneTasks = [];
    archiveTasks = [];
    emit(AppFetchDataBaseLoadingState());
    database.rawQuery('SELECT * FROM tasks').then((value) {
      value.forEach((element) {
        if (element['status'] == 'new') {
          newTasks.add(element);
        } else if (element['status'] == 'done') {
          doneTasks.add(element);
        } else
          archiveTasks.add(element);
      });
      emit(AppFetchDataBaseState());
    });
  }

  bool isButtonSheetOpened = false;
  IconData fabIcon = Icons.edit;

  void changeBottomSheetState(
      {@required bool isShow, @required IconData icon}) {
    isButtonSheetOpened = isShow;
    fabIcon = icon;
    emit(AppChangeBottomSheetState());
  }

  void updateDate({@required String status, @required int id}) async {
    database.rawUpdate('UPDATE tasks SET status = ? WHERE id = ?',
        ['$status', id]).then((value) {});
    emit(AppUpdateDataBaseState());
    getDataFromDatabase(database);
  }

  void deleteDate({@required int id}) async {
    database.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {});
    emit(AppDeleteDataBaseState());
    getDataFromDatabase(database);
  }

  bool isDarkMode = false;

  void changeTheme() {
    isDarkMode = !isDarkMode;
    // to use cacheHelper you will need to add await before init method in main method in main file and add this
    //  WidgetsFlutterBinding.ensureInitialized();  in the first of main mthod before any init method
    CacheHelper.putData(key: 'isDarkMode', value: isDarkMode);
    print(isDarkMode);
    emit(AppChangeModeState());
  }
}
