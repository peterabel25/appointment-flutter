import 'package:auntie_rafiki_appointments/providers/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:provider/provider.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<LogInPage> {
  bool isVisible = true;
  final form = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // validating the datas

  changeVisibility() {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
            key: form,
            child: Column(
              children: [
                Image.asset("assets/images/udsm.jpg"),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "email is required";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    filled: true,
                    // fillColor: Colors.amber //
                    hintText: "Email address",
                    labelText: "Email address",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "password is required";
                    }
                    if (value.length < 8) {
                      return "the password should contain at least eight characters long";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.text,
                  obscureText: isVisible,
                  decoration: InputDecoration(
                    filled: true,
                    suffixIcon: InkWell(
                      onTap: changeVisibility,
                      child: isVisible
                          ? Icon(Icons.remove_red_eye)
                          : Icon(Icons.remove_red_eye_outlined),
                    ),
                    // fillColor: Colors.amber //
                    hintText: "password",
                    labelText: "password",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 5,
                        child: ElevatedButton(
                            onPressed: () {
                              if (form.currentState!.validate()) {
                                print(emailController.text);
                                print(passwordController.text);
                                //validating email
                                if (!EmailValidator.validate(
                                    emailController.text)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content:
                                              Text("invalid email address")));
                                  return;
                                }
                                //validation of the email
                                authProvider
                                    .login(
                                        email: emailController.text,
                                        password: passwordController.text)
                                    .then((value) {
                                  if (value) {
                                    Navigator.of(context)
                                        .pushNamed("home_page");
                                  } else {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(
                                            content:
                                                Text("invalid credentials")));
                                  }
                                });
                              }
                            },
                            child: Text("login"))),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
