import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant/app/auth/bloc/auth_bloc.dart';
import 'package:plant/app/auth/bloc/auth_event.dart';
import 'package:plant/app/auth/bloc/auth_state.dart';
import 'package:plant/core/di/di.dart';
import 'package:plant/core/extensions/theme_extension.dart';
import 'package:plant/core/themes/app_colors.dart';
import 'package:plant/core/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final AuthBloc bloc;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    bloc = getIt<AuthBloc>();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    bloc.close();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void login() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      bloc.add(AuthLoginEvent(email, password));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocListener<AuthBloc, AuthState>(
        bloc: bloc,
        listener: (context, state) {
          if (state is AuthLoading) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Carregando...')),
            );
          } else if (state is AuthAuthenticated) {
            Navigator.pushReplacementNamed(context, '/home');
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.only(right: 20, left: 20),
            child: Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 50),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Welcome Back",
                              style: context.titleLarge,
                            ),
                          ),
                          const Text(
                            "Login to your account",
                            style: TextStyle(
                              fontSize: 16,
                              color: AppColors.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                    CustomTextField(
                      controller: _emailController,
                      labelText: "Email",
                      icon: Icons.email,
                    ),
                    const SizedBox(height: 20),
                    CustomTextField(
                      controller: _passwordController,
                      labelText: "Password",
                      icon: Icons.lock,
                      obscureText: true,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: login,
                      style: ButtonStyle(
                        backgroundColor:
                            WidgetStateProperty.all(AppColors.green),
                        minimumSize:
                            WidgetStateProperty.all(const Size(400, 50)),
                      ),
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    RichText(
                      text: TextSpan(
                        text: "Don't have an account? ",
                        style:
                            const TextStyle(color: Colors.grey, fontSize: 14),
                        children: [
                          TextSpan(
                            text: "Sign up",
                            style: const TextStyle(
                                color: AppColors.green,
                                fontWeight: FontWeight.bold),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushNamed(context, '/register');
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
