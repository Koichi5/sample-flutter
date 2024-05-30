import 'package:flutter/material.dart';
import 'package:sample_flutter/freezed/model/freezed_user.dart';

class FreezedHomeScreen extends StatelessWidget {
  const FreezedHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final freezedUser = FreezedUser(
    //   email: 'freezed@user.com',
    //   name: 'Bob',
    // );
    return Scaffold(
      appBar: AppBar(
        title: const Text('Freezed Sample'),
      ),
      body: Center(
        child: Text('Hello World'),
        // child: Text(
        //   'freezed user email: ${freezedUser.email}'
        // ),
      ),
    );
  }
}
