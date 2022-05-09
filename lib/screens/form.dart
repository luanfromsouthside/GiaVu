import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_giavu/model/argument.dart';
import 'package:flutter_giavu/model/branch.model.dart';
import 'package:flutter_giavu/screens/list.dart';
import 'package:flutter_giavu/utils.dart';
import 'package:http/http.dart' as http;

class FormScreen extends StatefulWidget {
  const FormScreen({ Key? key }) : super(key: key);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  late Branch branch;
  late String formName = 'ADD NEW BRANCH';
  late Argument args = Argument();
  final formKey = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _phone = TextEditingController();
  final TextEditingController _mail = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _manager = TextEditingController();
  final TextEditingController _isPublish = TextEditingController(text: 'True');
  final TextEditingController _description = TextEditingController();

  setValueField(String value, TextEditingController controller) {
    controller.value = TextEditingValue(
      text: value,
      selection: TextSelection.fromPosition(TextPosition(offset: value.length))
    );
  }

  initValue(Branch branch) {
    setValueField(branch.name, _name);
    setValueField(branch.phone, _phone);
    setValueField(branch.mail, _mail);
    setValueField(branch.address, _address);
    setValueField(branch.manager, _manager);
    setValueField(branch.description, _description);
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      args = ModalRoute.of(context)?.settings.arguments as Argument;
      if(args.isUpdate) {
        branch = args.branch!;
        initValue(branch);
        if(branch.isPublish != 'True' && branch.isPublish == 'False') {
          _isPublish.text = 'False';
        }
        formName = 'UPDATE BRANCH';
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
    var res = await http.get(Uri.parse('http://api.phanmemquocbao.com/api/Doituong/InsertObjects?p0=${_name.text}&id=1&p1=${_address.text}&p2=${_phone.text}&p3=${_mail.text}&p4=${_manager.text}&p5=${_isPublish.text}&p6=${_description.text}&tokenin=lethibaotran'));
    if(res.statusCode == 200) {
      Navigator.of(context).popAndPushNamed('$ListScreen');
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
    var res = await http.get(Uri.parse('http://api.phanmemquocbao.com/api/Doituong/updateObjects?id=${branch.id}&p0=${_name.text}&p1=${_address.text}&p2=${_phone.text}&p3=${_mail.text}&p4=${_manager.text}&p5=${_isPublish.text}&p6=${_description.text}&tokenup=lethibaotran'));
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
          style: const TextStyle(color: kPrimaryColor),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kPrimaryColor,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: submit, 
            icon: const Icon(Icons.save, color: kPrimaryColor,)
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
                    customInputField(
                      label: 'Address', 
                      hint: 'Location of branch',
                      controller: _address,
                      validator: (value) =>
                        (value!.isEmpty || value.length > 100) ?
                        'Please enter valid address' : null,
                    ),
                    const SizedBox(height: 10),
                    customInputField(
                      label: 'Phone', 
                      hint: 'Phone number of branch',
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
                      hint: 'Mail of branch',
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
                      label: 'Manager', 
                      hint: 'Manager name of branch',
                      controller: _manager,
                      validator: (value) =>
                        (value!.isEmpty || value.length > 100) ?
                        'Please enter valid name' : null,
                    ),
                    const SizedBox(height: 10),
                    customInputField(
                      label: 'Description', 
                      hint: 'Description of branch',
                      controller: _description,
                      validator: (value) =>
                        (value!.length > 100) ?
                        'Please enter valid description' : null,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Text('Is Publish',
                          style: PrimaryFont.regular(16),
                        ),
                        Expanded(
                          flex: 1,
                          child: ListTile(
                            title: const Text('True'),
                            leading: Radio(
                              groupValue: _isPublish.text,
                              value: 'True',
                              onChanged: (value) {
                                setState(() {
                                  _isPublish.text = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: ListTile(
                            title: const Text('False'),
                            leading: Radio(
                              groupValue: _isPublish.text,
                              value: 'False',
                              onChanged: (value) {
                                setState(() {
                                  _isPublish.text = value.toString();
                                });
                              },
                            ),
                          ),
                        )
                      ],
                    )
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
    ),
    keyboardType: type,
    validator: validator,
    onTap: onTap,
    readOnly: !enable,
  );
}