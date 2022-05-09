import 'package:flutter_giavu/model/branch.model.dart';

class Argument {
  bool isUpdate;
  Branch? branch;

  Argument({
    this.isUpdate = false,
    this.branch
  });
}