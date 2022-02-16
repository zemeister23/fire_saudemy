import 'package:courseapp/core/components/text_form_field_comp.dart';
import 'package:courseapp/core/constants/color_const.dart';
import 'package:courseapp/core/constants/font_const.dart';
import 'package:courseapp/core/constants/padding_margin_const.dart';
import 'package:courseapp/service/signin_service.dart';
import 'package:courseapp/service/signup_service.dart';
import 'package:courseapp/widgets/messenger.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Padding(
            padding: PaddingMarginConst.kExtraLargePM,
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _emailController,
                    decoration: TextFormFieldComp.inpurDecoration(
                        'Email kiriting...', 'Email...'),
                    validator: (value) =>
                        value!.isEmpty ? "Email kiritilishi shart !" : null,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    decoration: TextFormFieldComp.inpurDecoration(
                        'Password kiriting...', 'Password...'),
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? "Password kiritilishi shart !" : null,
                  ),
                  TextFormField(
                    controller: _passwordRepeatController,
                    decoration: TextFormFieldComp.inpurDecoration(
                        'Password qayta kiriting...', 'Password qayta...'),
                    obscureText: true,
                    validator: (value) => value! != _passwordController.text
                        ? "Password bir xil bo'lishi kerak !"
                        : null,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ElevatedButton(
                    child: const Text("Ro'yhatdan O'tish"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        SignUpService.signUp(
                          _emailController.text,
                          _passwordController.text,
                        ).then((value) {
                          if (value) {
                            MyMessenger.showMessenger(
                                context,
                                'Ro\'yhatdan o\'tish muvaffaqiyatli !',
                                Colors.green);
                            return Navigator.pushNamedAndRemoveUntil(
                                context, '/', (f) => false);
                          } else {
                            MyMessenger.showMessenger(
                                context,
                                'Ro\'yhatdan o\'tish muvaffaqiyatsiz !',
                                Colors.redAccent);
                          }
                        });
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Ro'yhatdan O'tish",
        style: TextStyle(
          color: ColorConst.kPrimaryColor,
          fontSize: FontConst.kLargeFont,
        ),
      ),
    );
  }
}
