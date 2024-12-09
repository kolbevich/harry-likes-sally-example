import 'package:flutter/material.dart';
import 'keys.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
        actions: [
          IconButton(
            key: AppKeys.loginButton,
            icon: Icon(
              Icons.login,
              size: 30,
            ),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => _LoginPopup(),
              );
            },
          ),
        ],
      ),
      body: Center(child: Text('Welcome to MeetCute!')),
    );
  }
}

class _LoginPopup extends StatefulWidget {
  @override
  State<_LoginPopup> createState() => _LoginPopupState();
}

class _LoginPopupState extends State<_LoginPopup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Log In'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
          ),
          TextField(
            controller: _passwordController,
            decoration: InputDecoration(labelText: 'Password'),
            obscureText: true,
          ),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Log In'),
        ),
      ],
    );
  }
}
