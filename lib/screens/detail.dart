import 'package:flutter/material.dart';
import 'package:flutter_giavu/model/student.model.dart';
import 'package:flutter_giavu/utils.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({ Key? key }) : super(key: key); 

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late Student student;

  makeCall() async {
    await launch('tel:${student.phone}');
  }

  mailTo() async {
    await launch('mailto:${student.mail}?subject=Subject mail&body=Body mail');
  }

  getMap() async {
    await launch('https://www.google.com/maps/place/${student.address}');
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    student = ModalRoute.of(context)?.settings.arguments as Student;
  }

  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Student #${student.id}',
          style: PrimaryFont.medium(20).copyWith(
            color: kDarkColor
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: kDarkColor,
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: false,
      body: Align(
        alignment: Alignment.topCenter,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Image(
                  image: const AssetImage('assets/images/avt_man.png'),
                  fit: BoxFit.fitWidth,
                  height: size.height * 0.2,
                ),
                const SizedBox(height: 10,),
                DetailItem(
                  title: 'Student name: ${student.name}', 
                  icon: Icons.store
                ),
                DetailItem(
                  title: 'Gender: ${student.gender == 'Male' ? 'Male':'Female'}', 
                  icon: student.gender == 'Male' ? Icons.man : Icons.woman
                ),
                DetailItem(
                  title: student.birth, 
                  icon: Icons.cake
                ),
                DetailItem(
                  title: student.phone, 
                  icon: Icons.phone,
                  onTap: makeCall,
                ),
                DetailItem(
                  title: student.mail, 
                  icon: Icons.mail,
                  onTap: mailTo,
                ),
                DetailItem(
                  title: 'School year: ${student.schoolYear}', 
                  icon: Icons.school,
                ),
                DetailItem(
                  title: student.address, 
                  icon: Icons.pin_drop,
                  onTap: getMap,
                ),
                
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
      padding: const EdgeInsets.all(8),
      child: TextButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(const Color(0xFFf8fdff)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          )),
          elevation: MaterialStateProperty.all(4)
        ),
        child: Row(
          children: [
            const SizedBox(width: 10,),
            Icon(
              icon, 
              size: 30,
              color: kDarkColor
            ),
            const SizedBox(width: 20,),
            Expanded(
              child: Text(title,
                style: PrimaryFont.medium(16).copyWith(
                  color: kDarkColor
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}