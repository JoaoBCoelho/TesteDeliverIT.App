import 'dart:convert';

import 'package:testedeliverit_app/models/conta.dart';
import 'package:http/http.dart' as http;

class ContaAPI {
  String url = "https://sparta.azurewebsites.net/conta/";

  Future<List<Conta>> getContas() async {
    try {
      var response = await http.get(url + 'get');
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return List<Conta>.from(data.map((x) => Conta.fromJson(x)));
      } else {
        return List<Conta>();
      }
    } catch (error) {
      print(error);
      return List<Conta>();
    }
  }

  Future postConta(Conta conta) async {
    try {
      await http.post(url + 'post',
          body: jsonEncode(conta.toJson()),
          headers: {"Content-Type": "application/json"});
    } catch (error) {
      print(error);
    }
  }
}
