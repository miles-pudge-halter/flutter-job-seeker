import 'package:equatable/equatable.dart';
import 'package:job_seeker/data/models/job_model.dart';

class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {}

class HomeEmpty extends HomeState {}

class HomeSuccess extends HomeState {
  final List<JobModel> jobs;

  HomeSuccess({required this.jobs});

  @override
  List<Object> get props => [];
}

class HomeFailure extends HomeState {
  final String error;

  HomeFailure({required this.error});

  @override
  List<Object> get props => [error];
}
