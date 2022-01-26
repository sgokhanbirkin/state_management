import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_managment_progress/feature/login/viewModel/login_view_model.dart';
import 'package:state_managment_progress/feature/product/constant/image_enum.dart';
import 'package:kartal/kartal.dart';
import 'package:state_managment_progress/feature/product/padding/page_padding.dart';
import 'package:state_managment_progress/feature/product/utility/input_decoration.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final String nameText = 'Name';
  final String loginText = 'Login';
  final String rememberText = 'Remember me';

  late final LoginViewModel _loginViewModel;

  @override
  void initState() {
    super.initState();
    _loginViewModel = LoginViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _loginViewModel,
      builder: (context, child) {
        return _bodyView();
      },
    );
  }

  Scaffold _bodyView() {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const PagePadding.allLow(),
        child: Column(
          children: [
            AnimatedContainer(
              duration: context.durationLow,
              height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.2),
              width: context.dynamicWidth(0.3),
              child: ImageEnums.door.toImage,
            ),
            Text(
              loginText,
              style: context.textTheme.headline3,
            ),
            TextField(
              decoration: ProjectInputs(nameText),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Center(
                child: Text(loginText),
              ),
            ),
            CheckboxListTile(
              //value: _loginViewModel.isCheckBoxOkay,
              value: context.watch<LoginViewModel>().isCheckBoxOkay,
              onChanged: (value) {
                context.read<LoginViewModel>().checkboxChange(value ?? false);
                //_loginViewModel.checkboxChange(value ?? false);
              },
              title: Text(rememberText),
            )
          ],
        ),
      ),
    );
  }
}
