import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plant/app/auth/bloc/auth_bloc.dart';
import 'package:plant/app/auth/bloc/auth_event.dart';
import 'package:plant/app/auth/bloc/auth_state.dart';
import 'package:plant/core/di/di.dart';
import 'package:plant/core/themes/app_colors.dart';
import 'package:plant/core/widgets/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final AuthBloc bloc;
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  late TextEditingController _confirmPasswordController;

  @override
  void initState() {
    super.initState();
    bloc = getIt<AuthBloc>();
    _nameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    bloc.close();
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void register() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final password = _passwordController.text.trim();
      final confirmPassword = _confirmPasswordController.text.trim();

      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("As senhas não coincidem.")),
        );
        return;
      }

      bloc.add(AuthRegisterEvent(email, password));
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
          } else if (state is AuthRegistered) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cadastro realizado com sucesso!')),
            );
            final email = _emailController.text;
            final password = _passwordController.text;
            bloc.add(AuthLoginEvent(email, password));
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
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 50),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Registrar",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.w600,
                            color: AppColors.green,
                          ),
                        ),
                      ),
                      Text(
                        "Criar uma nova conta",
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.gray,
                        ),
                      ),
                    ],
                  ),
                ),
                CustomTextField(
                  controller: _nameController,
                  labelText: "Nome Completo",
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _emailController,
                  labelText: "Email",
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _passwordController,
                  labelText: "Senha",
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: _confirmPasswordController,
                  labelText: "Confirmar Senha",
                  icon: Icons.lock,
                  obscureText: true,
                ),
                const SizedBox(height: 40),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      final email = _emailController.text;
                      final password = _passwordController.text;
                      bloc.add(AuthRegisterEvent(email, password));
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColors.green),
                    minimumSize: WidgetStateProperty.all(const Size(400, 50)),
                  ),
                  child: const Text(
                    "Cadastrar",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
