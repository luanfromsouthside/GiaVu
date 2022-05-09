import 'package:flutter/material.dart';
import 'package:flutter_giavu/model/branch.model.dart';
import 'package:flutter_giavu/utils.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({ Key? key }) : super(key: key); 

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Branch branch;

  makeCall() async {
    await launch('tel:${branch.phone}');
  }

  mailTo() async {
    await launch('mailto:${branch.mail}?subject=Subject mail&body=Body mail');
  }

  getMap() async {
    await launch('https://www.google.com/maps/place/${branch.address}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    branch = ModalRoute.of(context)?.settings.arguments as Branch;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Branch #${branch.id}',
        ),
        centerTitle: true,
        backgroundColor: kPrimaryColor,
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: const Text('Make call'),
                onTap: makeCall
              ),
              PopupMenuItem(
                child: const Text('Mail to'),
                onTap: mailTo
              ),
              PopupMenuItem(
                child: const Text('Location'),
                onTap: getMap
              ),
            ],
          )
        ],
      ),
      resizeToAvoidBottomInset: false,
      body: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                const Image(
                  image: AssetImage('assets/images/detail_bg.png'),
                  fit: BoxFit.fitWidth,
                ),
                const SizedBox(height: 10,),
                DetailItem(
                  title: 'Branch name: ${branch.name}', 
                  icon: Icons.store
                ),
                DetailItem(
                  title: branch.phone, 
                  icon: Icons.phone,
                  onTap: makeCall,
                ),
                DetailItem(
                  title: branch.mail, 
                  icon: Icons.mail,
                  onTap: mailTo,
                ),
                DetailItem(
                  title: branch.address, 
                  icon: Icons.map,
                  onTap: getMap,
                ),
                DetailItem(
                  title: 'Branch manager: ${branch.manager}', 
                  icon: Icons.contacts
                ),
                DetailItem(
                  title: 'Status: ${branch.isPublish == 'True' ? 'Open':'Close'}', 
                  icon: branch.isPublish == 'True' ? Icons.event_available : Icons.event_busy
                ),
                DetailItem(
                  title: 'Description:', 
                  sub: branch.description,
                  icon: Icons.description)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DetailItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String? sub;
  final Function()? onTap;
  const DetailItem({ 
    Key? key,
    required this.title,
    required this.icon,
    this.sub,
    this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Card(
        elevation: 0.8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30)
        ),
        color: const Color(0xFFF3E5F5),
        child: ListTile(
          title: Text(
            title,
            style: PrimaryFont.medium(18),
          ),
          subtitle: sub == null ? null : Text(sub!),
          leading: Icon(icon),
          onTap: onTap,
        ),
      ),
    );
  }
}