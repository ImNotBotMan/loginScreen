part of 'validator_bloc.dart';

@immutable
abstract class ValidatorState {}

class ValidatorInitial extends ValidatorState {}

class AdminState extends ValidatorState {}

class UserState extends ValidatorState {}

class ErrorState extends ValidatorState {}
