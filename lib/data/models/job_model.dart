import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'job_model.g.dart';

@JsonSerializable()
class JobModel extends Equatable {
  final String id;
  final String role;
  @JsonKey(name: 'company_name')
  final String companyName;
  @JsonKey(name: 'company_num_employees')
  final String? numberOfEmployees;
  @JsonKey(name: 'employment_type')
  final String? employmentType;
  final bool remote;
  final String? logo;
  final String? url;
  final String? text;
  @JsonKey(name: 'date_posted')
  final String datePosted;
  final List<String> keywords;
  final String? source;

  JobModel({
    required this.id,
    required this.role,
    required this.companyName,
    required this.datePosted,
    required this.keywords,
    required this.remote,
    this.numberOfEmployees,
    this.employmentType,
    this.logo,
    this.url,
    this.text,
    this.source,
  });

  @override
  List<Object> get props => [id];

  factory JobModel.fromJson(Map<String, dynamic> json) =>
      _$JobModelFromJson(json);

  Map<String, dynamic> toJson() => _$JobModelToJson(this);
}

@JsonSerializable()
class JobListResponse extends Equatable {
  final int count;
  final String? next;
  final String? previous;
  final List<JobModel> results;

  JobListResponse({
    required this.count,
    required this.results,
    this.next,
    this.previous,
  });

  @override
  List<Object> get props => [];

  factory JobListResponse.fromJson(Map<String, dynamic> json) =>
      _$JobListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$JobListResponseToJson(this);
}
