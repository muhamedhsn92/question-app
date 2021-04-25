import 'package:flutter/material.dart';

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

Widget buildTaskItem() => Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        color: Colors.grey[100],
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              radius: 40.0,
              child: Text(
                '02:10 PM',
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'task title',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  '02 apr 2021',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
