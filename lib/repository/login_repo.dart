// ignore_for_file: avoid_print

import 'package:api/config/api_endpoint.dart';
import 'package:api/config/local_storage.dart';
import 'package:api/utils/api_handler_file.dart';

class AuthRepo {
  static registerRepo() async {
    Map res =
        await HttpHandler.postHttpMethod(url: APIEndpoints.resgiter, data: {
      "shop_name": "abc",
      "owner_name": "axc",
      "mobile": "9878967567",
      "email": "purveshghevaria230603@gmil.com",
      "address": "hjjjj",
      "image": "kkjnj",
      "password": "abc123",
    }); 
    
    print(res);
    
    await PrefString.sharedPreferences
        .setString(PrefString.token, res['body']['token']);
    await PrefString.sharedPreferences
        .setString(PrefString.id, res['body']['id']);
  }
}
