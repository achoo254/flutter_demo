import 'package:flutter_app_demo/app/data/provider/person_provider.dart';

import '../EndpointProvider.dart';

const apiUrl = 'http://62b96ed1778bd553007e8888.mockapi.inet.vn:8080/';

class PersonProvider implements IPersonProvider {
  final EndpointProvider _endpointProvider = EndpointProvider();

  @override
  findAll(Map data) {
    return _endpointProvider.connectApi().get(apiUrl);
  }
  
}
