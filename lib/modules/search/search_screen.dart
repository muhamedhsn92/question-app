import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/layout/news_layout/cubit/cubit.dart';
import 'package:question_app/layout/news_layout/cubit/states.dart';
import 'package:question_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        // var list = NewsCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultFormField(
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (String value) {
                      if (value.isEmpty) {
                        return 'search cannot be empty';
                      }
                      return null;
                    },
                    onChange: (String value) {
                      NewsCubit.get(context).getSearch(value);
                      print(value);
                    },
                    label: 'search',
                    prefix: Icons.search),
              ),
              Expanded(child:  ConditionalBuilder(
                condition: state is! NewsGetSearchLoadingState,
                builder: (context) => ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index,{isSearch =  false}) {
                      return buildArticleItem(NewsCubit.get(context).search[index],context);
                    },
                    separatorBuilder: (context, state) => myDivider(),
                    itemCount: NewsCubit.get(context).search.length),
                fallback: (context) =>  Center(child: CircularProgressIndicator()),
              )),
            ],
          ),
        );
      },
    );
  }
}
