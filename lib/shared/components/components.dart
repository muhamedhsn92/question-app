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
      decoration: InputDecoration(
        prefixIcon: Icon(prefix),
        suffixIcon: IconButton(icon: Icon(suffix != null ? suffix : null), onPressed: suffixPress),
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
