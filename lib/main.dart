import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toast/toast.dart';

import 'bloc/validator_bloc.dart';

void main() {
  runApp(MaterialApp(home: MyApp()));
}

TextEditingController loginController = TextEditingController();
TextEditingController passController = TextEditingController();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login page"),
      ),
      body: BlocProvider(
        create: (context) => ValidatorBloc(),
        child: BlocConsumer<ValidatorBloc, ValidatorState>(
            builder: (context, state) => _body(context),
            listener: (context, state) {
              if (state is ErrorState) {
                Toast.show("incorrect login or pass", context, gravity: 1);
              }
            }),
      ),
    );
  }
}

Widget _body(BuildContext context) {
  return Center(
    child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(hintText: "Login"),
              controller: loginController,
              maxLength: 8,
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: InputDecoration(hintText: "Password"),
              controller: passController,
              keyboardType: TextInputType.number,
              maxLength: 8,
            )
          ],
        ),
      ),
      Text("admin/12345 - Admin Screen \n user/54321 - User Screen"),
      RaisedButton(
          child: Text("authtorization"),
          onPressed: () => BlocProvider.of<ValidatorBloc>(context).add(
              AuthEvent(loginController.text, passController.text, context)))
    ]),
  );
}
