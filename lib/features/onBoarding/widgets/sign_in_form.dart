import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            decoration: InputDecoration(
                prefixIcon: SvgPicture.asset('assets/icons/email.svg')),
          )
        ],
      ),
    );
  }
}
