// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Student _$$_StudentFromJson(Map<String, dynamic> json) => _$_Student(
      id: json['Id'] as int,
      name: json['p0'] as String,
      gender: json['p1'] as String,
      birth: json['p2'] as String,
      phone: json['p3'] as String,
      mail: json['p4'] as String,
      address: json['p5'] as String,
      schoolYear: json['p6'] as String,
    );

Map<String, dynamic> _$$_StudentToJson(_$_Student instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'gender': instance.gender,
      'birth': instance.birth,
      'phone': instance.phone,
      'mail': instance.mail,
      'address': instance.address,
      'schoolYear': instance.schoolYear,
    };
