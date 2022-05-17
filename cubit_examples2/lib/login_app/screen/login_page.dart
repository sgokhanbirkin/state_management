import 'package:cubit_examples2/login_app/screen/homepage.dart';
import 'package:cubit_examples2/login_app/service/login_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kartal/kartal.dart';

import '../../states_state_management_app/widgets/button_widget.dart';
import '../cubit/login_cubit.dart';
import '../widgets/custom_text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String title = 'Login Page';
  final String title2 = 'Login User';

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  final String baseUrl = 'https://reqres.in/api';
  @override
  void initState() {
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(
        emaillerController: _emailController,
        paswordController: _passwordController,
        formkey: _formKey,
        service: LoginService(
          Dio(
            BaseOptions(baseUrl: baseUrl),
          ),
        ),
      ),
      // ignore: prefer_const_constructors
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginCompleted) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: BlocBuilder<LoginCubit, LoginState>(
                builder: (context, state) {
                  if (state is LoginInitial) {
                    return buildInitialLayout(context);
                  }
                  if (state is LoginLoading) {
                    return buildLoading();
                  }
                  if (state is LoginValidate) {
                    return const Center(
                      child: Text('ERORR VALİDATE'),
                    );
                  }
                  return buildErrorLayout();
                },
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildInitialLayout(BuildContext context) => SingleChildScrollView(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Text(title2, style: context.textTheme.headline3),
                context.emptySizedHeightBoxLow3x,
                CustomTextField2(
                  textEditingController: _emailController,
                  hintText: 'Mail',
                  prefixIcon: Icons.person,
                  validator: (value) => (value ?? '').contains('@') ? null : 'Invalid mail',
                ),
                context.emptySizedHeightBoxLow3x,
                CustomTextField2(
                  textEditingController: _passwordController,
                  hintText: 'Password',
                  prefixIcon: Icons.lock,
                  validator: (value) => (value ?? '').length > 6 ? null : '6 ten kucuk',
                ),
                context.emptySizedHeightBoxLow3x,
                CustomButton(
                  txtData: 'Login',
                  myFunction: () {
                    context.read<LoginCubit>().postUserData();
                  },
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildLoading() => const CircularProgressIndicator();

  Widget buildErrorLayout() => const Text('Error');
}
