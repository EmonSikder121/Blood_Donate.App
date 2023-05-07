import 'package:flutter/material.dart';

class Developer extends StatelessWidget {
  static const String routeName = '/developer';
  const Developer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:  [

            // Image.asset('assets/images/Developers.jpg', width:double.infinity),
            Container(
              height: 400,
              width: 300,
              color: Colors.grey,
              child: Column(
                children: [
                  Image.asset('assets/images/Developers.jpg', width:double.infinity),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
