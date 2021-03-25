import 'dart:async';

import 'package:bks/main.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';

import '../adminScreen.dart';
import '../userScreen.dart';

part 'validator_event.dart';
part 'validator_state.dart';

class ValidatorBloc extends Bloc<ValidatorEvent, ValidatorState> {
  ValidatorBloc() : super(ValidatorInitial());

  @override
  Stream<ValidatorState> mapEventToState(
    ValidatorEvent event,
  ) async* {
    if (event is AuthEvent) {
      yield* _validator(event.login, event.pass, event.context);
    }
  }

  Stream<ValidatorState> _validator(
      String login, String pass, BuildContext context) async* {
    if (login == 'admin' && pass == '12345') {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => AdminScrenn()));
    }
    if (login == 'user' && pass == '54321') {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => UserScreen()));
    } else
      yield ErrorState();
  }
}
