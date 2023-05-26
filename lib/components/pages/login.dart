import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/auth.dart';

class LoginPage extends GetView<Auth> {
  final String title;

  const LoginPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<Auth>(builder: (c) {
      return Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Text(title),
          elevation: 21,
        ),
        body: Center(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            child: Card(
              margin: const EdgeInsets.all(20),
              color: Colors.amber,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    Card(
                        child: TextField(
                      controller: c.username,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your username',
                      ),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    Card(
                        child: TextField(
                      controller: c.password,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Enter your password',
                      ),
                    )),
                    const SizedBox(
                      height: 20,
                    ),
                    CheckboxListTile(
                        title: const Text('Remember me'),
                        value: c.rememberMe,
                        onChanged: (val) {
                          c.toggleRememberMe();
                        }),
                    MaterialButton(
                      onPressed: () {},
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                      height: 50,
                      minWidth: 200,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text('Login'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
