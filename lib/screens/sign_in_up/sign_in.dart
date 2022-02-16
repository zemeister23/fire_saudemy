import 'package:courseapp/core/components/text_form_field_comp.dart';
import 'package:courseapp/core/constants/color_const.dart';
import 'package:courseapp/core/constants/font_const.dart';
import 'package:courseapp/core/constants/padding_margin_const.dart';
import 'package:courseapp/service/signin_service.dart';
import 'package:courseapp/widgets/messenger.dart';
import 'package:flutter/material.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(false);
      },
      child: Scaffold(
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
                      validator: (value) => value!.isEmpty
                          ? "Password kiritilishi shart !"
                          : null,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    ElevatedButton(
                      child: const Text("Kirish"),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          SignInService.signIn(
                            _emailController.text,
                            _passwordController.text,
                          ).then((value) {
                            if (value) {
                              MyMessenger.showMessenger(
                                  context,
                                  'Kirish muvaffaqiyatli !',
                                  Colors.green);
                              return Navigator.pushReplacementNamed(
                                  context, '/');
                            } else {
                              MyMessenger.showMessenger(context,
                                  'Kirish muvaffaqiyatsiz !', Colors.redAccent);
                            }
                          });
                        }
                      },
                    ),
                    TextButton(
                      child: const Text("Ro'yhatdan O'tish"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(primary: Colors.redAccent),
                      child: const Text("Parolni Unutdingizmi?"),
                      onPressed: () {
                        Navigator.pushNamed(context, '/passwordReset');
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      leading: const SizedBox(),
      centerTitle: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        "Kirish",
        style: TextStyle(
          color: ColorConst.kPrimaryColor,
          fontSize: FontConst.kLargeFont,
        ),
      ),
    );
  }
}
