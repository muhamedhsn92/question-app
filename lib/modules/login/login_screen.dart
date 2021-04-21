import 'package:flutter/material.dart';
import 'package:question_app/shared/components/components.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var passwordController = TextEditingController();

  bool isPassword = true;

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
//                  TextFormField(
//                    controller: emailController,
//                    keyboardType: TextInputType.emailAddress,
//                    validator: (value) {
//                      if(value.isEmpty){
//                        return 'email must not be empty';
//                      }
//                      return null;
//                    },
////              onFieldSubmitted: (value) {
////                print(value);
////              },
////              onChanged: (value) {
////                print(value);
////              },
//                    decoration: InputDecoration(
//                      prefixIcon: Icon(Icons.email),
//                      labelText: 'Email address',
//                      border: OutlineInputBorder(),
//                    ),
//                  ),
                  defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value) {
                        if (value.isEmpty) {
                          return 'email must not be empty';
                        }
                        return null;
                      },
                      prefix: Icons.email,
                      label: 'Email'),
                  SizedBox(
                    height: 15,
                  ),
//                  TextFormField(
//                    controller: passwordController,
//                    validator: (value) {
//                      if (value.isEmpty) {
//                        return 'password must not be empty';
//                      }
//                      return null;
//                    },
//                    keyboardType: TextInputType.visiblePassword,
//                    obscureText: true,
//                    // for show or hide password
//                    decoration: InputDecoration(
//                      prefixIcon: Icon(Icons.lock),
//                      suffixIcon: Icon(Icons.remove_red_eye),
//                      labelText: 'Password',
//                      border: OutlineInputBorder(),
//                    ),
//                  ),
                  defaultFormField(
                    controller: passwordController,
                    type: TextInputType.visiblePassword,
                    isPassword: isPassword,
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'password must not be empty';
                      }
                      return null;
                    },
                    prefix: Icons.lock,
                    suffix:
                        isPassword ? Icons.visibility : Icons.visibility_off,
                    label: 'Password',
                    suffixPress: () {
                      setState(() {
                        isPassword = !isPassword;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  defaultButton(
                      text: 'login',
                      function: () {
                        if (formKey.currentState.validate()) {
                          print(emailController.text);
                          print(passwordController.text);
                        }
                      }),
//                Container(
//                  width: double.infinity,
//                  color: Colors.blue,
//                  child: MaterialButton(
//                    onPressed: () {
//                      print(emailController.text);
//                      print(passwordController.text);
//                    },
//                    child: Text(
//                      'Login',
//                      style: TextStyle(color: Colors.white),
//                    ),
//                  ),
//                ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Don\'t have an account?',
                      ),
                      MaterialButton(
                        onPressed: () {},
                        child: Text(
                          'Register',
                          style: TextStyle(color: Colors.blue),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
