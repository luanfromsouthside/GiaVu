// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Branch _$$_BranchFromJson(Map<String, dynamic> json) => _$_Branch(
      id: json['Id'] as int,
      name: json['p0'] as String,
      address: json['p1'] as String,
      phone: json['p2'] as String,
      mail: json['p3'] as String,
      manager: json['p4'] as String,
      isPublish: json['p5'] as String,
      description: json['p6'] as String,
    );

Map<String, dynamic> _$$_BranchToJson(_$_Branch instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'phone': instance.phone,
      'mail': instance.mail,
      'manager': instance.manager,
      'isPublish': instance.isPublish,
      'description': instance.description,
    };
