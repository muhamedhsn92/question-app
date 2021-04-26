import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:question_app/layout/news_layout/cubit/cubit.dart';
import 'package:question_app/layout/news_layout/cubit/states.dart';
import 'package:question_app/shared/components/components.dart';

class ScienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context).science;
        return ConditionalBuilder(
          condition: state is! NewsGetScienceLoadingState,
          builder: (context) => ListView.separated(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return buildArticleItem(list[index],context);
              },
              separatorBuilder: (context, state) => myDivider(),
              itemCount: list.length),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
