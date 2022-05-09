import 'package:flutter/material.dart';
import 'package:flutter_giavu/model/argument.dart';
import 'package:flutter_giavu/screens/list.dart';

import '../utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = context.screenSize;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            const HomeBackground(),
            const HomeTitle(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ButtonNav(
                    fixedSize: MaterialStateProperty.all(
                      Size(size.width * 0.9, size.height * 0.065)
                    ),
                    textStyle: MaterialStateProperty.all(
                      PrimaryFont.medium(size.height * 0.03)
                    ),
                    content: 'CREATE NEW',
                    route: '/add',
                    args: Argument(),
                  ),
                  const SizedBox(height: 20,),
                  ButtonNav(
                    fixedSize: MaterialStateProperty.all(
                      Size(size.width * 0.9, size.height * 0.065)
                    ),
                    textStyle: MaterialStateProperty.all(
                      PrimaryFont.medium(size.height * 0.03)
                    ),
                    content: 'VIEW ALL',
                    route: '$ListScreen',
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class HomeBackground extends StatelessWidget {
  const HomeBackground({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: FractionallySizedBox(
        heightFactor: 0.4,
        widthFactor: 1,
        child: FittedBox(
          fit: BoxFit.contain,
          alignment: Alignment.topCenter,
          clipBehavior: Clip.antiAlias,
          child: Image.asset('assets/images/home_bg.png'),
        ),
      ),
    );
  }
}

class HomeTitle extends StatelessWidget {
  const HomeTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.35,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Spacer(flex: 1,),
            Flexible(
              fit: FlexFit.tight,
              flex: 3,
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                    text: 'Branches management',
                    style: PrimaryFont.medium(35).copyWith(
                      color: kPrimaryColor,
                      height: 1.5
                    ),
                    children: [
                      TextSpan(
                        text: '\nDev by: Dang Le Gia Vu',
                        style: PrimaryFont.regular(20).copyWith(
                        color: kPrimaryColor
                      )
                    )
                  ]
                )
              ),
            ),
          ]
        ),
      ),
    );
  }
}

class ButtonNav extends StatelessWidget {
  final MaterialStateProperty<Size?> fixedSize;
  final MaterialStateProperty<TextStyle> textStyle;
  final String content;
  final String route;
  final Object? args;
  const ButtonNav({ 
    Key? key,
    required this.fixedSize, 
    required this.textStyle,
    required this.content,
    required this.route, 
    this.args 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(route, arguments: args);
      },
      child: Text(content),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          kPrimaryColor
        ),
        fixedSize: fixedSize,
        textStyle: textStyle,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          )
        ),
        elevation: MaterialStateProperty.all(0)
      ),
    );
  }
}