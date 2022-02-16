import 'package:courseapp/core/components/text_form_field_comp.dart';
import 'package:courseapp/core/constants/color_const.dart';
import 'package:courseapp/core/constants/font_const.dart';
import 'package:courseapp/core/constants/padding_margin_const.dart';
import 'package:courseapp/service/reset_password.dart';
import 'package:courseapp/service/signin_service.dart';
import 'package:courseapp/widgets/messenger.dart';
import 'package:flutter/material.dart';

class PasswordReset extends StatelessWidget {
  PasswordReset({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();

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
                        'Emailingizni kiriting...', 'Email...'),
                    validator: (value) =>
                        value!.isEmpty ? "Email kiritilishi shart !" : null,
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  ElevatedButton(
                    child: const Text("Parolni Tiklash"),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ResetPasswordService.resetPassword(
                                _emailController.text)
                            .then((value) {
                          if (value) {
                            MyMessenger.showMessenger(
                              context,
                              'Emailingizga tiklash linki yuborildi !',
                              ColorConst.kPrimaryColor,
                            );
                            Navigator.pop(context);
                          } else {
                            MyMessenger.showMessenger(
                              context,
                              'Emailingiz topilmadi yoki muammo mavjud !',
                              Colors.redAccent,
                            );
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
        "Parolni Tiklash",
        style: TextStyle(
          color: ColorConst.kPrimaryColor,
          fontSize: FontConst.kLargeFont,
        ),
      ),
    );
  }
}
