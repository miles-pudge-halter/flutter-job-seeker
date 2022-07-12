import 'package:equatable/equatable.dart';
import 'package:job_seeker/data/models/job_model.dart';

class AppliedJobsState extends Equatable {
  @override
  List<Object> get props => [];
}

class AppliedJobsLoading extends AppliedJobsState {}

class AppliedJobsLoaded extends AppliedJobsState {
  final List<JobModel> jobs;

  AppliedJobsLoaded({required this.jobs});

  @override
  List<Object> get props => [jobs];
}

class AppliedJobsFailure extends AppliedJobsState {
  final String error;

  AppliedJobsFailure({required this.error});

  @override
  List<Object> get props => [error];
}
