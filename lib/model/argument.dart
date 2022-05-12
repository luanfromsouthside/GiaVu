import 'package:flutter_giavu/model/student.model.dart';

class Argument {
  bool isUpdate;
  Student? student;

  Argument({
    this.isUpdate = false,
    this.student
  });
}