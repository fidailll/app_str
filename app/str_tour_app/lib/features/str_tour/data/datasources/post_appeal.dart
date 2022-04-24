import 'dart:convert';

import 'package:http/http.dart' as http;

class PostAppeal {
  int? statusCode;
  Future<http.Response?> postAppeal({
    required String name,
    required String phone,
    required String message,
    required String email,
  }) async {
    var url = 'http://sonofmqe.beget.tech/post.php';

    Map data = {
      'name': name,
      'phone': phone,
      'message': message,
      'email': email,
    };

//Кодированиев в Json формат
    var body = json.encode(data);
    // ignore: avoid_print
    print("$data");
//Отправка запроса
    try {
      var response = await http.post(Uri.parse(url), headers: {}, body: body);
      // ignore: avoid_print
      print("Receive"); //Получение
      // ignore: avoid_print
      print("Status: ${response.statusCode}"); //статуc
      //print("Body: ${response.body}"); //вывод запроса в консоль

      statusCode = response.statusCode;
    } catch (error) {
      //log(e.toString());
      // ignore: avoid_print
      print(error);
    }
    return null;
  }
}
