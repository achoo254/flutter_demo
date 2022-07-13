import 'package:flutter/foundation.dart';
import 'package:flutter_app_demo/app/data/provider/person_provider.dart';
import 'package:flutter_app_demo/app/data/repository/person_repository.dart';

class PersonRepository implements IPersonRepository {
  PersonRepository({required this.provider});

  final IPersonProvider provider;

  @override
  findAll(Map data) async {
    try {
      final response = await provider.findAll(data);
      if (response.statusCode == 200) {
        return response.data;
      } else {
        if (kDebugMode) {
          print('Request failed with status: ${response.statusCode}.');
        }
      }
    } catch (error, stacktrace) {
      if (kDebugMode) {
        print("Exception occured: $error stackTrace: $stacktrace");
      }
    }
  }
}
