part of 'validator_bloc.dart';

@immutable
abstract class ValidatorEvent {}

class AuthEvent extends ValidatorEvent {
  final String login;
  final String pass;
  final BuildContext context;

  AuthEvent(this.login, this.pass, this.context);
}
