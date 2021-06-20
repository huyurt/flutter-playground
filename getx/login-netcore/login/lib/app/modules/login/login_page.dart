import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login/app/widgets/custom_button.dart';
import 'package:login/app/widgets/custom_tff.dart';
import 'package:login/core/values/keys.dart';
import 'package:login/core/values/strings.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 50.0,
                    ),
                    width: 200.0,
                    child: Image(
                      image: AssetImage(
                        '${IMAGES_PATH}splash.png',
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 250.0,
                  child: Expanded(
                    flex: 10,
                    child: Obx(
                      () => CustomTffWidget(
                        text: this.controller.username.value,
                        onChanged: (v) => this.controller.changeUsername(v),
                        onSaved: (v) => this.controller.savedUsername(v),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  width: 250.0,
                  child: Expanded(
                    flex: 10,
                    child: Obx(
                      () => CustomTffWidget(
                        obscure: this.controller.obscure.value,
                        text: this.controller.password.value,
                        onChanged: (v) => this.controller.changePassword(v),
                        onSaved: (v) => this.controller.savedPassword(v),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 50.0,
                  child: Expanded(
                    flex: 2,
                    child: Obx(
                      () => IconButton(
                        onPressed: () => this.controller.showPassword(),
                        icon: Icon(
                          Icons.remove_red_eye,
                          color: this.controller.obscure.value
                              ? Colors.grey
                              : Colors.green,
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 24.0),
                  height: 50.0,
                  width: 150.0,
                  child: CustomButtonWidget(
                    callback: () async {
                      await this.controller.login();
                    },
                    text: BUTTON_LOGIN.tr,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
