import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_giavu/model/argument.dart';
import 'package:flutter_giavu/screens/detail.dart';
import 'package:flutter_giavu/utils.dart';
import 'package:http/http.dart' as http;
import '../model/branch.model.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({ Key? key }) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  late Future<List<Branch>> list = fetchList();
  final controller = ScrollController();

  Future<List<Branch>> fetchList() async {
    final res = await http.get(Uri.parse('http://api.phanmemquocbao.com/api/Doituong/getobjectsall?tokenget=lethibaotran'));
    if(res.statusCode == 200) {
      List<dynamic> json = jsonDecode(res.body);
      return json.map((e) => Branch.fromJson(e)).toList();
    }
    else {
      return [];
    }
  }

  Future<http.Response> delete(Branch branch) async {
    final res = await http.get(Uri.parse('http://api.phanmemquocbao.com/api/Doituong/deleteObject?id=${branch.id}&tokende=lethibaotran'));
    return res;
  }

  handleDelete(Branch branch) {
    CustomDialog.makeDialog(
      context: context, 
      title: 'Warning', 
      content: 'Do you want to delete?',
      actions: [
        TextButton(
          onPressed: () {
            delete(branch).whenComplete(() {
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        toolbarHeight: 120,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30), 
              bottomRight: Radius.circular(30)
            ),
            gradient: LinearGradient(
              colors: [kPrimaryColor, kLightColor],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/appbar_bg_list.png'),
              fit: BoxFit.fill
            )
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFFEDE7F6),
      body: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Expanded(
                child: FutureBuilder(
                  future: list,
                  builder: (context, AsyncSnapshot snapshot) {
                    if(snapshot.hasData) {
                      return ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return ListItem(
                            item: snapshot.data[index],
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                '$DetailScreen',
                                arguments: snapshot.data[index]
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
                                  branch: snapshot.data[index]
                                )
                              ).then((value) {
                                setState(() {
                                  list = fetchList();
                                });
                              });
                            },
                            onDelete:() {
                              handleDelete(snapshot.data[index]);
                            }
                          );
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator(),);
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  final Branch item;
  final Function()? onEdit;
  final Function()? onDelete;
  final Function()? onTap;
  const ListItem({
    Key? key ,
    required this.item,
    this.onEdit,
    this.onDelete,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        leading: const CircleAvatar(
          backgroundImage: AssetImage('assets/images/ic_item.png'),
          radius: 25,
        ),
        title: Text(item.name == null ? 'Branch name' : item.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: PrimaryFont.medium(24).copyWith(color: kPrimaryColor),
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text('ID: #${item.id}',
            style: PrimaryFont.medium(16).copyWith(color: kLightColor),
          ),
        ),
        onTap: onTap,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            IconButton(
              onPressed: onEdit,
              icon: const Icon(Icons.edit)
            ),
            IconButton(
              onPressed: onDelete,
              icon: const Icon(Icons.delete)
            ),
          ],
        ),
      )
    );
  }
}