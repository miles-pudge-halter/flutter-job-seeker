import 'package:equatable/equatable.dart';

import '../../data/models/job_model.dart';

class JobListState extends Equatable {
  const JobListState();

  @override
  List<Object> get props => [];
}

class JobListLoading extends JobListState {}

class JobListEmpty extends JobListState {}

class JobListSuccess extends JobListState {
  final List<JobModel> jobs;

  JobListSuccess({required this.jobs});

  @override
  List<Object> get props => [];
}

class JobListFailure extends JobListState {
  final String error;

  JobListFailure({required this.error});

  @override
  List<Object> get props => [error];
}
