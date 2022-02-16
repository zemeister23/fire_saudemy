import 'package:courseapp/core/constants/color_const.dart';
import 'package:courseapp/core/constants/font_const.dart';
import 'package:courseapp/core/constants/padding_margin_const.dart';
import 'package:courseapp/service/firebase_user.dart';
import 'package:courseapp/service/sign_out.dart';
import 'package:courseapp/widgets/messenger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  late final  _user = AuthUser.authUser.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar(context),
      body: Padding(
        padding: PaddingMarginConst.kExtraLargePM,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _user != null ? "Salom ${_user!.email!.split('@')[0]}" : "",
                    style: TextStyle(
                      fontSize: FontConst.kExtraLargeFont,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  Text(
                    "O'zingizga mos kursni topib darhol boshlang",
                    style: TextStyle(
                      fontSize: FontConst.kMediumFont,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }

  AppBar myAppBar(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: const Icon(
            Icons.logout,
            color: Colors.redAccent,
          ),
          onPressed: () {
            showMyDialog(context);
          },
        ),
      ],
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: false,
      title: Text(
        "Bosh Sahifa",
        style: TextStyle(
          color: ColorConst.kPrimaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  showMyDialog(BuildContext context) => showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text("Chiqishni Istaysizmi?"),
            actions: [
              ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: ColorConst.kPrimaryColor),
                child: const Text("Bekoq qilish"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.red),
                child: const Text("Chiqish"),
                onPressed: () async {
                  await SignOutService.signOut().then((value) {
                    if (value) {
                      MyMessenger.showMessenger(
                          context, 'Chiqish muvaffaqiyatli !', Colors.green);
                      return Navigator.pushNamedAndRemoveUntil(
                          context, '/signin', (f) => false);
                    } else {
                      MyMessenger.showMessenger(context,
                          'Chiqish muvaffaqiyatsiz !', Colors.redAccent);
                    }
                  });
                },
              ),
            ],
          );
        },
      );
}
