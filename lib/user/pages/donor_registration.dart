import 'package:flutter/material.dart';

class DonarRegister extends StatefulWidget {
  static const String routeName = '/Donorregister';
  const DonarRegister({Key? key}) : super(key: key);

  @override
  State<DonarRegister> createState() => _DonarRegisterState();
}

class _DonarRegisterState extends State<DonarRegister> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
    );
  }
}
