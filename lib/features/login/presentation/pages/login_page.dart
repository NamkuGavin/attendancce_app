import 'package:attendance_app/core/theme/text_style.dart';
import 'package:attendance_app/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/route/navigate.dart';
import '../../../../core/util/validator/input_validator.dart';
import '../../../../core/widget/loading/loading_widget.dart';
import '../../../../core/widget/snackbar/snackbar_item.dart';
import '../../../../core/widget/text_form_field/custom_text_form_field.dart';
import '../bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _nikController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            Navigate.navigatorPushAndRemove(
              context,
              const HomePage(),
            );
          } else if (state is LoginFailure) {
            showSnackBar(
              context,
              title: state.message,
            );
          }
        },
        child: SafeArea(
          child: Stack(
            children: [
              _body(),
              _loading(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _body() {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 50.h),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/icons/logo.png',
                width: 150.w,
                height: 150.h,
              ),
              SizedBox(height: 25.h),
              Text(
                'Welcome',
                style: TextThemeData.getTextTheme(
                    Colors.black, 25.sp, FontWeight.w900),
              ),
              SizedBox(height: 8.h),
              Text(
                'Please login using your registered employee number',
                style: TextThemeData.getTextTheme(
                    Colors.black, 16.sp, FontWeight.w300),
              ),
              SizedBox(height: 50.h),
              Text(
                'Employee number',
                style: TextThemeData.getTextTheme(
                    Colors.black, 16.sp, FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                label: 'Enter employee number',
                controller: _nikController,
                textInputType: TextInputType.number,
                validator: (value) => InputValidator().nikValidator(value),
              ),
              SizedBox(height: 25.h),
              Text(
                'Password',
                style: TextThemeData.getTextTheme(
                    Colors.black, 16.sp, FontWeight.w600),
              ),
              SizedBox(height: 8.h),
              CustomTextFormField(
                label: 'Enter password',
                controller: _passwordController,
                validator: (value) => InputValidator().passwordValidator(value),
                isPassword: true,
              ),
              SizedBox(height: 50.h),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // BlocProvider.of<LoginBloc>(context).add(
                    //   PostLoginEvent(
                    //     niy: _nikController.text,
                    //     password: _passwordController.text,
                    //   ),
                    // );
                    Navigate.navigatorPushAndRemove(
                      context,
                      const HomePage(),
                    );
                  }
                },
                child: const Text('Log In'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loading() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Visibility(
          visible: state is LoginLoading,
          child: const LoadingWidget(),
        );
      },
    );
  }
}
