import 'package:flutter_app_demo/app/data/provider/impl/person_provider_impl.dart';
import 'package:flutter_app_demo/app/data/repository/impl/person_repository_impl.dart';
import 'package:flutter_app_demo/app/modules/login_module/login_controller.dart';
import 'package:get/get.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
        personRepository: PersonRepository(provider: PersonProvider())));
  }
}
