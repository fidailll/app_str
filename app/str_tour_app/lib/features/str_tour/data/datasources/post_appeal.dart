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
    print("$data");
//Отправка запроса
    try {
      var response = await http.post(Uri.parse(url),
          headers: {
            //'Content-Type': 'application/json',
            // 'authorization': 'Basic $encodedCredentials',
            //'authorization': 'Basic ${token[0]}'
            //'authorization': 'Basic c2VyZ2VpOlgwZnNyMW1rYmVUcQ=='
          },
          body: body);
      print("Receive"); //Получение
      print("Status: ${response.statusCode}"); //статуc
      //print("Body: ${response.body}"); //вывод запроса в консоль
      ///=============================Разбиение строки=====================

      statusCode = response.statusCode;
    } catch (error) {
      //log(e.toString());
      print(error);
    }
  }
}
