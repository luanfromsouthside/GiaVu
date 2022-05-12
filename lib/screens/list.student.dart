import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_giavu/model/argument.dart';
import 'package:flutter_giavu/screens/detail.dart';
import 'package:http/http.dart' as http;
import '../model/student.model.dart';
import '../utils.dart';

class ListAllScreen extends StatefulWidget {
  const ListAllScreen({ Key? key }) : super(key: key);

  @override
  State<ListAllScreen> createState() => _ListAllScreenState();
}

class _ListAllScreenState extends State<ListAllScreen> {
  late Future<List<Student>> list = fetchList();
  final controller = ScrollController();

  Future<List<Student>> fetchList() async {
    final res = await http.get(Uri.parse('http://api.phanmemquocbao.com/api/Doituong/getobjectsall?tokenget=lethibaotran'));
    if(res.statusCode == 200) {
      List<dynamic> json = jsonDecode(res.body);
      return json.map((e) => Student.fromJson(e)).toList();
    }
    else {
      return [];
    }
  }

  Future<http.Response> delete(Student student) async {
    final res = await http.get(Uri.parse('http://api.phanmemquocbao.com/api/Doituong/deleteObject?id=${student.id}&tokende=lethibaotran'));
    return res;
  }

  handleDelete(Student student) {
    CustomDialog.makeDialog(
      context: context, 
      title: 'Warning', 
      content: 'Do you want to delete?',
      actions: [
        TextButton(
          onPressed: () {
            delete(student).whenComplete(() {
              setState(() {
                list = fetchList();
                Navigator.of(context).pop();
              });
            }).catchError((error) {
              CustomDialog.makeDialog(
                context: context, 
                title: 'Error', 
                content: 'Can not delete!'
              );
            });
          }, 
          child: const Text('OK')
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(), 
          child: const Text('Cancel')
        )
      ]
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomAppBar(),
          SliverToBoxAdapter(
            child: FutureBuilder<List<Student>>(
              future: list,
              builder: (context, AsyncSnapshot snapshot) {
                if(snapshot.hasData) {
                  return GridView.builder(
                    shrinkWrap: true,
                    primary: false,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.9
                    ), 
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      Student st = snapshot.data[index];
                      return ListItem(
                        student: st,
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            '$DetailScreen',
                            arguments: st
                          ).then((value) {
                            setState(() {
                              list = fetchList();
                            });
                          });
                        },
                        onEdit: () {
                          Navigator.of(context).pushNamed(
                            '/update',
                            arguments: Argument(
                              isUpdate: true,
                              student: st
                            )
                          ).then((value) {
                            setState(() {
                              list = fetchList();
                            });
                          });
                        },
                        onDelete: () {
                          handleDelete(st);
                        },
                      );
                    }
                  );
                } else {
                  return const Center(
                    child: Text('Loading...')
                  );
                }
              },
            )
          )
        ],
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Student student;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;
  final VoidCallback? onTap;
  const ListItem({
    Key? key,
    required this.student, 
    this.onEdit, 
    this.onDelete, 
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: InkWell(
          onTap: onTap,
          child: Column(
            children: [
              const SizedBox(height: 10,),
              CircleAvatar(
                backgroundImage: AssetImage('assets/images/ic_${student.gender == 'Male' ? 'man' : 'woman'}.png'),
                radius: 40,
              ),
              const SizedBox(height: 10,),
              Text(student.name ?? 'Student name',
                style: PrimaryFont.medium(18),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Text('ID: #${student.id}',
                style: PrimaryFont.regular(14),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                    onPressed: onEdit, 
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.greenAccent,
                    )
                  ),
                  IconButton(
                    onPressed: onDelete, 
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.redAccent,
                    )
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      expandedHeight: 200,
      title: Text('List Students',
        style: PrimaryFont.medium(30).copyWith(
          color: Colors.white
        ),
      ),
      backgroundColor: kPrimaryColor,
      floating: true,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        stretchModes: const [
          StretchMode.blurBackground,
          StretchMode.fadeTitle
        ],
        background: Stack(
          fit: StackFit.expand,
          children: [
             Image.asset('assets/images/appbar_bg_list.png', fit: BoxFit.contain,),
          ],
        ),
      ),
    );
  }
}