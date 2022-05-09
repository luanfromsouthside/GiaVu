import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'branch.model.freezed.dart';
part 'branch.model.g.dart';

@freezed
class Branch with _$Branch{
    const factory Branch({
        required int id,
        required String name,
        required String address,
        required String phone,
        required String mail,
        required String manager,
        required String isPublish,
        required String description,
    }) = _Branch;
    
      factory Branch.fromJson(Map<String, dynamic> json)
        => _$BranchFromJson(json);
}