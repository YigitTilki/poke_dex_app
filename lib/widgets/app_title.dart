import 'package:flutter/material.dart';
import 'package:poke_dex_app/constant/constants.dart';
import 'package:poke_dex_app/constant/ui_helper.dart';

// ignore: must_be_immutable
class AppTitle extends StatelessWidget {
  AppTitle({super.key});

  String pokeballImageUrl = "images/pokeball.png";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: UIHelper.getAppTitleWidgetHeight(),
      child: Stack(
        children: [
          Padding(
            padding: UIHelper.getDefaultPadding(),
            child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  Constants.title,
                  style: Constants.getTextStyle(),
                )),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              pokeballImageUrl,
              width: UIHelper.getAssetWidth(),
              fit: BoxFit.fitWidth,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
