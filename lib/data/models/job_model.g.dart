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

Map<String, dynamic> _$JobModelToJson(JobModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'role': instance.role,
    'company_name': instance.companyName,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('company_num_employees', instance.numberOfEmployees);
  writeNotNull('employment_type', instance.employmentType);
  val['remote'] = instance.remote;
  writeNotNull('logo', instance.logo);
  writeNotNull('url', instance.url);
  writeNotNull('text', instance.text);
  val['date_posted'] = instance.datePosted;
  val['keywords'] = instance.keywords;
  writeNotNull('source', instance.source);
  return val;
}

JobListResponse _$JobListResponseFromJson(Map<String, dynamic> json) =>
    JobListResponse(
      count: json['count'] as int,
      results: (json['results'] as List<dynamic>)
          .map((e) => JobModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      next: json['next'] as String?,
      previous: json['previous'] as String?,
    );

Map<String, dynamic> _$JobListResponseToJson(JobListResponse instance) {
  final val = <String, dynamic>{
    'count': instance.count,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('next', instance.next);
  writeNotNull('previous', instance.previous);
  val['results'] = instance.results;
  return val;
}
