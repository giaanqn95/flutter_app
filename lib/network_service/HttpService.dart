import 'package:http/http.dart' as http;
import 'package:flutter_app/model/BaseResponse.dart';
import 'dart:convert';
import 'BaseRepository.dart';
import 'Domain.dart';
import 'KeyRequest.dart';

Domain getDomain(){
  return Domain.DEV;
}

Future<StateRepository> get(KeyRequest keyRequest, String codeComplete) async {
  final response = await http.get(DomainExtensionMap.valuesMap[getDomain()] +
      KeyExtensionMap.valuesMap[keyRequest]);

  if (response.statusCode == 200) {
    BaseResponse base = BaseResponse.fromJson(json.decode(response.body));
    if(base.code == codeComplete){
      return SuccessState(base);
    }
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return ErrorState(base.message);
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    return ErrorState("Call api error");
  }
}



