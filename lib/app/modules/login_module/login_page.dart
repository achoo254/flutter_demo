import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_app_demo/app/modules/login_module/login_controller.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('login Page')),
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: controller.textEditingController,
            ),
            ElevatedButton(onPressed: () => controller.changeText(controller.textEditingController.text), child: const Text('thay doi')),
            Obx(() => Text(controller.userName)), //cach 1
            controller.obx((_) => Text(controller.userName),), //cach 2
            //Hiển thị person list bằng statemixin
            controller.obx((_) => Expanded(
              child: ListView.separated(
                itemCount: controller.personDataList.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    color: Colors.amber,
                    height: 200,
                    width: 100,
                    child: Text(
                        controller.personDataList[index].data.firstName
                    ),
                  );
                }, separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
              },

              ),
            ))
          ],
        ),
      )
    );
  }
}
