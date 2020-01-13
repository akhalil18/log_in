import 'package:flutter/material.dart';
import '../mixins/validator.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with ValidationMixin {
  String _userEmail;
  String _userPassword;
  final _formKey = GlobalKey<FormState>();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    passwordFocusNode.dispose();
    super.dispose();
  }

  void _onSubmitPass(String value) {
    setState(() {
      _userPassword = value;
    });
    print(_userPassword);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          children: <Widget>[
            Image.asset(
              'assets/images/log.png',
              width: 200,
            ),
            SizedBox(
              height: 10.0,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'example@email.com',
                        hintStyle: TextStyle(color: Colors.white),
                        labelText: 'Email',
                      ),
                      validator: emailValidator,
                      onFieldSubmitted: (_) => FocusScope.of(context)
                          .requestFocus(passwordFocusNode),
                      onSaved: (value) {
                        setState(() {
                          _userEmail = value;
                        });
                        print(_userEmail);
                      }),
                  SizedBox(
                    height: 15.0,
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintStyle: TextStyle(color: Colors.white),
                      labelText: 'Password',
                    ),
                    validator: passwordValidator,
                    focusNode: passwordFocusNode,
                    onSaved: _onSubmitPass,
                    onFieldSubmitted: _onSubmitPass,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  RaisedButton(
                    child: Text('Submit'),
                    onPressed: () {
                      if (_formKey.currentState.validate()) {
                        _formKey.currentState.save();
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text('You logged in'),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
