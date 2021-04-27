import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/layout/news_layout/cubit/cubit.dart';
import 'package:question_app/layout/news_layout/cubit/states.dart';
import 'package:question_app/modules/search/search_screen.dart';
import 'package:question_app/shared/components/components.dart';
import 'package:question_app/shared/cubit/cubit.dart';
import 'package:question_app/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text('News App'),
            actions: [
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 35,
                ),
                onPressed: () {
                  navigateTo(context, SearchScreen());
                },
              ),
              IconButton(
                  icon: Icon(Icons.brightness_6_outlined),
                  onPressed: () {
                    AppCubit.get(context).changeTheme();
                  }),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     DioHelper.getData(
          //       url: 'inv-colors/list',
          //       query: {
          //         'page': 0,
          //         'size': 10,
          //       },
          //     )
          //         .then((value) => print(value.data['resultData']['resultData']))
          //         .catchError((error) {
          //       print(error);
          //     });
          //   },
          //   child: Icon(
          //     Icons.add,
          //   ),
          // ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItems,
          ),
          body: cubit.screens[cubit.currentIndex],
        );
      },
    );
  }
}
