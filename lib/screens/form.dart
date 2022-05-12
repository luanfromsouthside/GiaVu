import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_giavu/model/argument.dart';
import 'package:flutter_giavu/model/student.model.dart';
import 'package:flutter_giavu/screens/list.student.dart';
import 'package:flutter_giavu/utils.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({ Key? key }) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late Student student;
  late String formName = 'ADD NEW STUDENT';
  late Argument args = Argument();
  final formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _gender = TextEditingController(text: 'Female');
  final TextEditingController _birth = TextEditingController();
  final TextEditingController _schoolYear = TextEditingController();

  setValueField(String value, TextEditingController controller) {
    controller.value = TextEditingValue(
      text: value,
      selection: TextSelection.fromPosition(TextPosition(offset: value.length))
    );
  }

  initValue(Student student) {
    setValueField(student.name, _name);
    setValueField(student.phone, _phone);
    setValueField(student.mail, _mail);
    setValueField(student.address, _address);
    setValueField(student.birth, _birth);
    setValueField(student.schoolYear, _schoolYear);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      args = ModalRoute.of(context)?.settings.arguments as Argument;
      if(args.isUpdate) {
        student = args.student!;
        initValue(student);
        if(student.gender != 'Female' && student.gender == 'Male') {
          _gender.text = 'Male';
        }
        formName = 'UPDATE STUDENT #${student.id}';
      }
      setState(() {});
    });
  }

  submit() {
    if(formKey.currentState!.validate()) {
      args.isUpdate ? update() : add();
    }
  }

  Future<void> add() async {
    var res = await http.get(Uri.parse('http://api.phanmemquocbao.com/api/Doituong/InsertObjects?p0=${_name.text}&id=1&p1=${_gender.text}&p2=${_birth.text}&p3=${_phone.text}&p4=${_mail.text}&p5=${_address.text}&p6=${_schoolYear.text}&tokenin=lethibaotran'));
    if(res.statusCode == 200) {
      Navigator.of(context).popAndPushNamed('$ListAllScreen');
    }
    else {
      CustomDialog.makeDialog(
        context: context,
        title: 'Error',
        content: 'Can not add!',
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: const Text('OK')
          )
        ]
      );
    }
  }

  Future<void> update() async {
    var res = await http.get(Uri.parse('http://api.phanmemquocbao.com/api/Doituong/updateObjects?id=${student.id}&p0=${_name.text}&p1=${_gender.text}&p2=${_birth.text}&p3=${_phone.text}&p4=${_mail.text}&p5=${_address.text}&p6=${_schoolYear.text}&tokenup=lethibaotran'));
    if(res.statusCode == 200) {
      Navigator.of(context).pop();
    }
    else {
      CustomDialog.makeDialog(
        context: context,
        title: 'Error',
        content: 'Can not update!',
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(), 
            child: const Text('OK')
          )
        ]
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(formName,
          style: const TextStyle(color: kDarkColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kDarkColor,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: submit, 
            icon: const Icon(Icons.download, color: kDarkColor,)
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        minimum: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            children: [
              Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    customInputField(
                      label: 'Name', 
                      hint: 'Name of branch',
                      controller: _name,
                      validator: (value) =>
                        (value!.isEmpty || value.length > 100) ?
                        'Please enter valid name' : null,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Gender',
                          style: PrimaryFont.regular(16),
                        ),
                        Expanded(
                          flex: 1,
                          child: ListTile(
                            title: const Text('Female'),
                            leading: Radio(
                              groupValue: _gender.text,
                              value: 'Female',
                              onChanged: (value) {
                                setState(() {
                                  _gender.text = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ListTile(
                            title: const Text('Male'),
                            leading: Radio(
                              groupValue: _gender.text,
                              value: 'Male',
                              onChanged: (value) {
                                setState(() {
                                  _gender.text = value.toString();
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10,),
                    customInputField(
                      label: 'Birth', 
                      hint: 'Birth of student',
                      controller: _birth,
                      enable: false,
                      validator: (value) => value!.isEmpty ? 'Birth is not empty' : null,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context, 
                          initialDate: DateTime(2000), 
                          firstDate: DateTime(1900), 
                          lastDate: DateTime.now()
                        );
                        if(date != null) {
                          _birth.text = DateFormat('dd/MM/yyyy').format(date);
                        }
                      }
                    ),
                    const SizedBox(height: 10),
                    customInputField(
                      label: 'Phone', 
                      hint: 'Phone number of student',
                      controller: _phone,
                      validator: (value) {
                        RegExp regex = RegExp(r'(84|0[3|5|7|8|9])+([0-9]{8})\b');
                        if(!regex.hasMatch(value.toString())) {
                          return "Please enter valid phone number";
                        }
                        else {
                          return null;
                        }
                      },
                      type: TextInputType.number
                    ),
                    const SizedBox(height: 10),
                    customInputField(
                      label: 'Mail', 
                      hint: 'Mail of student',
                      controller: _mail,
                      validator: (value) {
                        if(!EmailValidator.validate(value.toString()) || value!.length > 100) {
                          return "Please enter valid mail";
                        }
                        else {
                          return null;
                        }
                      },
                      type: TextInputType.emailAddress
                    ),
                    const SizedBox(height: 10),
                    customInputField(
                      label: 'School year', 
                      hint: 'Enter school year',
                      controller: _schoolYear,
                      validator: (value) {
                        if(value!.isEmpty || value.length > 100) {
                          return "Please enter valid school year";
                        }
                        else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                    customInputField(
                      label: 'Address', 
                      hint: 'Address of student',
                      controller: _address,
                      validator: (value) =>
                        (value!.isEmpty || value.length > 100) ?
                        'Please enter valid address' : null,
                    ),
                  ],
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom))
            ],
          ),
        ),
      ),
    );
  }

  TextFormField customInputField({
    required String label,
    required String hint,
    FormFieldValidator<String>? validator,
    TextEditingController? controller,
    String? initValue,
    TextInputType? type,
    Function()? onTap,
    bool enable = true
  })
  => TextFormField(
    controller: controller,
    initialValue: initValue,
    decoration: InputDecoration(
      labelText: label,
      hintText: hint,
      border: const OutlineInputBorder()
    ),
    keyboardType: type,
    validator: validator,
    onTap: onTap,
    readOnly: !enable,
  );
}