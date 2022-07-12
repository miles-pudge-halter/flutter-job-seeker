import 'package:equatable/equatable.dart';

class ApplyJobState extends Equatable {
  @override
  List<Object> get props => [];
}

class ApplyJobLoading extends ApplyJobState {}

class ApplyJobSuccess extends ApplyJobState {}

class ApplyJobFailure extends ApplyJobState {
  final String error;

  ApplyJobFailure({required this.error});

  @override
  List<Object> get props => [error];
}