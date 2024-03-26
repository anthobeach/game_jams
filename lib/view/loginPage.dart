import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import "package:crypt/crypt.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
    return const _LoginForm();
  }
}

class _LoginForm extends StatefulWidget {
  const _LoginForm({Key? key}) : super(key: key);

  @override
  State<_LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<_LoginForm> {
  bool _loading = false;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double wHeight = MediaQuery.of(context).size.height;
    double wWidth = MediaQuery.of(context).size.width;
    return Center(
        child: Container(
            height: wHeight * 0.8,
            width: wWidth * 0.5,
            child: _loading
                ? const Scaffold(
                        body: Center(
                             child: Text("Profil infos"),
                        ),
                          )
                : ListView(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 20),
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: const InputDecoration(label: Text('Email')),
                      ),
                      const SizedBox(height: 16),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        decoration:
                            const InputDecoration(label: Text('Password')),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: () async {
                          try {
                            final email = _emailController.text;
                            final password = Crypt.sha256(_passwordController.text).toString();
                            final user = await Supabase.instance.client
                                .from('user')
                                .select()
                                .match({'email': email,'password' : password}).maybeSingle();
                            if (user==null){
                              final userP = await Supabase.instance.client
                                .from('user')
                                .select()
                                .eq('password',password);
                              final userE = await Supabase.instance.client
                                .from('user')
                                .select()
                                .eq('email',email);
                              if (userE.isEmpty && userP.isEmpty){
                                ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('wrong password and email'),
                              backgroundColor: Colors.red,
                            ));
                              }
                              else if (userP.isEmpty){
                                ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('wrong password'),
                              backgroundColor: Colors.red,
                            ));

                              }
                              else if(userE.isEmpty){
                                ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('wrong email'),
                              backgroundColor: Colors.red,
                            ));
                              }
                              ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Login failed'),
                              backgroundColor: Colors.red,
                            ));
                            setState(() {
                              _loading = false;
                            });
                            }
                            else{
                              setState(() {
                            _loading = true;
                            });
                            }
                            }
                           catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Login failed'),
                              backgroundColor: Colors.red,
                            ));
                            setState(() {
                              _loading = false;
                            });
                          }
                        },
                        child: const Text('Login'),
                      ),
                      const SizedBox(height: 16),
                      TextButton(
                        onPressed: () async {
                          setState(() {
                            _loading = true;
                          });
                          try {
                            final email = _emailController.text;
                            final password = Crypt.sha256(_passwordController.text).toString();
                            await Supabase.instance.client
                                .from('user').insert(
                                  {"password" : password,
                                  "email": email}
                                );
                          } catch (e) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Signup failed'),
                              backgroundColor: Colors.red,
                            ));
                            setState(() {
                              _loading = false;
                            });
                          }
                        },
                        child: const Text('Signup'),
                      ),
                    ],
                  )));
  }
}