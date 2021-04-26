import 'package:conditional_builder/conditional_builder.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:question_app/shared/cubit/cubit.dart';

Widget defaultButton({
  Color background = Colors.blue,
  double width = double.infinity,
  @required Function function,
  @required String text,
  bool isUpperCase = true,
}) =>
    Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget defaultFormField({
  @required TextEditingController controller,
  @required TextInputType type,
  @required Function validate,
  @required String label,
  @required IconData prefix,
  IconData suffix,
  Function onSubmit,
  Function onChange,
  Function onTab,
  Function suffixPress,
  bool isPassword = false,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      validator: validate,
      onFieldSubmitted: onSubmit,
      obscureText: isPassword,
      onChanged: onChange,
      onTap: onTab,
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(
            icon: Icon(suffix != null ? suffix : null), onPressed: suffixPress),
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );

Widget taskBuilder({
  @required List<Map> tasks,
}) =>
    ConditionalBuilder(
        condition: tasks.length > 0,
        builder: (context) {
          return ListView.separated(
              itemBuilder: (context, index) =>
                  buildTaskItem(tasks[index], context),
              separatorBuilder: (context, index) => myDivider(),
              itemCount: tasks.length);
        },
        fallback: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.menu,
                  size: 100.0,
                  color: Colors.grey,
                ),
                Text(
                  'No Tasks Yet  Please Add Some Tasks ',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                )
              ],
            ),
          );
        });

Widget myDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[200],
    );

Widget buildTaskItem(Map model, context) => Dismissible(
      key: Key(model['id'].toString()),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                radius: 40.0,
                backgroundColor: Colors.lightBlueAccent,
                child: Text(
                  '${model['time']}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      '${model['title']}',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '${model['date']}',
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 15,
              ),
              IconButton(
                  icon: Icon(Icons.check_box),
                  color: Colors.green,
                  onPressed: () {
                    AppCubit.get(context).updateDate(
                      status: 'done',
                      id: model['id'],
                    );
                    print('${model['id']}');
                  }),
              IconButton(
                  icon: Icon(Icons.archive),
                  onPressed: () {
                    AppCubit.get(context).updateDate(
                      status: 'archive',
                      id: model['id'],
                    );
                  }),
            ],
          ),
        ),
      ),
      onDismissed: (direction) {
        AppCubit.get(context).deleteDate(id: model['id']);
      },
    );

Widget buildArticleItem(articles,context) => Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
            width: 120.0,
            height: 120.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                image: DecorationImage(
                    image: NetworkImage(
                        'https://i2.wp.com/alghad.com/wp-content/uploads/2020/04/Apple_new-iphone-se-white_04152020_big.jpg.large_.jpg?fit=980%2C1120&ssl=1'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 20,
          ),
          Container(
            height: 120.0,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    '${articles['desc']}',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
                Text(
                  '${articles['id']}',
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          )
        ],
      ),
    );
