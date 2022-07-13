import 'package:flutter/material.dart';
import 'package:flutter_app_demo/app/data/model/ResponseData.dart';
import 'package:flutter_app_demo/app/data/repository/impl/person_repository_impl.dart';
import 'package:get/get.dart';

import '../../data/model/Person.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class LoginController extends GetxController with StateMixin{
  //gọi repo
  final PersonRepository personRepository;
  //gọi hàm
  LoginController({required this.personRepository});

  //init controller
  final TextEditingController textEditingController = TextEditingController();

  //init value
  final _userName = ''.obs;
  set userName(value) => _userName.value = value;
  get userName => _userName.value;

  final _personDataList = <Person>[].obs;
  set personDataList(value) => _personDataList.value = value;
  List<Person> get personDataList => _personDataList; //Với data kiểu array thì ko cần .value

  //init load controller
  @override
  Future<void> onInit() async {
    //Loading (statemixin)
    change(null, status: RxStatus.loading());
    //Cần xử lý j đó trước khi widget được hiển thị
    await actionFindAllPerson();
    //Success (statemixin)
    change(null, status: RxStatus.success());
    super.onInit();
  }

  changeText(String text){
    userName = text;
    //method của statemixin
    update();
  }

  actionFindAllPerson() async {
    //call request
    Map<String, dynamic> response = await personRepository.findAll({});
    //check nếu có data
    if(response.isNotEmpty){
      //mapping từ json -> object response
      ResponseData responseData = ResponseData.fromJson(response);
      //check nếu có data
      if(responseData.values.isNotEmpty){
        //duyệt từng phần tử trong values
        for(var item in responseData.values){
          //tạo object và set vào danh sách trả về
          Person person = Person(id: item.id, data: item.data, resourceId: item.resourceId, v: item.v);
          personDataList.add(person);
        }
      }
    }
  }
}
