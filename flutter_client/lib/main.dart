import 'package:flutter/material.dart';
import 'package:flutter_client/user_repo.dart';

final userRepo = UserRepo();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String userName = '';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('gRPC Client')),
        body: Center(
            child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  userRepo.getUser('1').then((value) {
                    setState(() {
                      userName = value.username;
                    });
                  });
                },
                child: const Text('GetUser')),
            const SizedBox(
              height: 20,
            ),
            Text(userName),
          ],
        )),
      ),
    );
  }
}
