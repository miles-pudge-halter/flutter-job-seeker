import 'package:equatable/equatable.dart';

class LoginEntryState extends Equatable {
  @override
  List<Object> get props => [];
}

class LoginEntryLoading extends LoginEntryState {}

class LoginEntryFailure extends LoginEntryState {
  final String error;

  LoginEntryFailure({required this.error});

  @override
  List<Object> get props => [error];
}

class LoginSuccess extends LoginEntryState {}
