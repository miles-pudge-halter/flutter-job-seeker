// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JobModel _$JobModelFromJson(Map<String, dynamic> json) => JobModel(
      id: json['id'] as String,
      role: json['role'] as String,
      companyName: json['company_name'] as String,
      datePosted: json['date_posted'] as String,
      keywords:
          (json['keywords'] as List<dynamic>).map((e) => e as String).toList(),
      remote: json['remote'] as bool,
      numberOfEmployees: json['company_num_employees'] as String?,
      employmentType: json['employment_type'] as String?,
      logo: json['logo'] as String?,
      url: json['url'] as String?,
      text: json['text'] as String?,
      source: json['source'] as String?,
    );

Map<String, dynamic> _$JobModelToJson(JobModel instance) => <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'company_name': instance.companyName,
      'company_num_employees': instance.numberOfEmployees,
      'employment_type': instance.employmentType,
      'remote': instance.remote,
      'logo': instance.logo,
      'url': instance.url,
      'text': instance.text,
      'date_posted': instance.datePosted,
      'keywords': instance.keywords,
      'source': instance.source,
    };

JobListResponse _$JobListResponseFromJson(Map<String, dynamic> json) =>
    JobListResponse(
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => JobModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
    );

Map<String, dynamic> _$JobListResponseToJson(JobListResponse instance) =>
    <String, dynamic>{
      'count': instance.count,
      'next': instance.next,
      'previous': instance.previous,
      'results': instance.results,
    };
