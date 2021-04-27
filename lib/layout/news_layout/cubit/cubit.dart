import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/layout/news_layout/cubit/states.dart';
import 'package:question_app/modules/buisness/buisness_screen.dart';
import 'package:question_app/modules/science/science_screen.dart';
import 'package:question_app/modules/settings_screens/settings_screen.dart';
import 'package:question_app/modules/sports/sports_screen.dart';
import 'package:question_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'Buisness'),
    BottomNavigationBarItem(
        icon: Icon(Icons.add_business_sharp), label: 'Sports'),
    BottomNavigationBarItem(
        icon: Icon(Icons.add_business_rounded), label: 'Science'),
    // BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
  ];
  List<Widget> screens = [
    BuisnessScreen(),
    SportsScreen(),
    ScienceScreen(),
    // SettingsScreen(),
  ];

  void changeBottomNavBar(int index) {
    currentIndex = index;
    if (index == 1) {
      getSports();
    } else if (index == 2) {
      getScience();
    }
    emit(NewsBottomNavBarChangeState());
  }

  List<dynamic> business = [];
  List<dynamic> science = [];
  List<dynamic> sports = [];
  List<dynamic> search = [];

  void getBusiness() {
    if (business.length == 0) {
      emit(NewsGetBusinessLoadingState());
      DioHelper.getData(
        url: 'inv-colors/list',
        query: {'page': 0, 'size': 10},
      ).then((value) {
        // print(value.data.toString());
        business = value.data['resultData']['resultData'];
        print(business);
        print(business.length);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error);
        emit(NewsGetBusinessErrorState(error.toString()));
      });
    } else {
      emit(NewsGetBusinessSuccessState());
    }
  }

  void getSports() {
    if (sports.length == 0) {
      emit(NewsGetSportsLoadingState());
      DioHelper.getData(
        url: 'inv-item-price/list',
        query: {'page': 0, 'size': 10},
      ).then((value) {
        // print(value.data.toString());
        sports = value.data['resultData']['resultData'];
        print(business);
        print(business.length);
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error);
        emit(NewsGetSportsErrorState(error.toString()));
      });
    } else {
      emit(NewsGetSportsSuccessState());
    }
  }

  void getScience() {
    if (science.length == 0) {
      emit(NewsGetScienceLoadingState());
      DioHelper.getData(
        url: 'inv-store-group-master/list',
        query: {'page': 0, 'size': 10},
      ).then((value) {
        // print(value.data.toString());
        science = value.data['resultData']['resultData'];
        print(business);
        print(business.length);
        emit(NewsGetScienceSuccessState());
      }).catchError((error) {
        print(error);
        emit(NewsGetScienceErrorState(error.toString()));
      });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  void getSearch(String value) {
    emit(NewsGetSearchLoadingState());
    search = [];
    DioHelper.getData(
      url: 'inv-stores/find-all-inv-store-by-code-or-desc-lov',
      query: {'searchKey': value},
    ).then((value) {
      print('search value >>> ${value.data.toString()}');
      search = value.data['resultData']['resultData'];
      emit(NewsGetSearchSuccessState());
    }).catchError((error) {
      print(error);
      emit(NewsGetSearchErrorState(error.toString()));
    });
  }
}
