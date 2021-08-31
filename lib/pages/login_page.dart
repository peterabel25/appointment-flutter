import 'package:auntie_rafiki_appointments/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = true;
  final form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    authProvider.userEmail;
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: form,
        child: Column(
          children: [
            Image.asset("assets/images/udsm.jpg"),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                filled: true,
                hintText: "email address",
              ),
            ),
            TextFormField(
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  filled: true,
                  hintText: "enter password",
                  suffixIcon: InkWell(
                    onTap: changeVisibility,
                    child: isVisible
                        ? Icon(Icons.remove_red_eye)
                        : Icon(Icons.panorama_fish_eye),
                  )),
              obscureText: isVisible,
            ),
            Row(
              children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: () {
                          if (!EmailValidator.validate(emailController.text)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("invalid email")));
                            return;
                          }

                          authProvider
                              .login(
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) {
                            if (value) {
                              Navigator.of(context).pushNamed("home_page");
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("invalid credentials")));
                            }
                          });
                        },
                        child: Text('login'))),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
