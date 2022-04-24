import 'package:flutter/material.dart';
import 'package:str_tour_app/features/str_tour/data/datasources/post_appeal.dart';

class Appeal extends StatefulWidget {
  const Appeal({Key? key}) : super(key: key);

  @override
  _AppealState createState() => _AppealState();
}

class _AppealState extends State<Appeal> {
  // @override
  // void initState() {
  //   PostAppeal().postAppeal();
  //   super.initState();
  // }

  final _formKeyName = GlobalKey<FormState>();
  final _formKeyPhone = GlobalKey<FormState>();
  final _formKeyMessage = GlobalKey<FormState>();
  final _formKeyEmail = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _messageController = TextEditingController();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _messageController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.transparent,
      appBar: AppBar(
        elevation: 0,
        //  backgroundColor: Colors.transparent,
        title: Row(
          children: const [
            // SizedBox(width: 10),
            // Image(
            //   image: AssetImage('assets/icons/str_logo.png'),
            //   width: 25,
            //   height: 25,
            // ),
            //  SizedBox(width: 20),
            Text(
              'Написать обращение',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
        // actions: [
        //   IconButton(
        //     tooltip: 'Режим отображение карты',
        //     onPressed: () {
        //       setState(() {
        //         _darkMode = !_darkMode;
        //       });
        //     },
        //     icon: Icon(
        //       Icons.wb_sunny,
        //       color: Colors.black,
        //     ),
        //   ),
      ),
      body: Container(
        color: const Color.fromARGB(255, 227, 225, 225),
        child: Column(
          children: [
            const SizedBox(height: 30),
            editText(
                text: 'Имя',
                key: _formKeyName,
                controller: _nameController,
                validate: _validateName),
            const SizedBox(height: 10),
            editText(
                text: 'Номер телефона',
                key: _formKeyPhone,
                controller: _phoneController,
                validate: _validatePhoneNumber),
            const SizedBox(height: 10),
            editText(
              text: 'Текст обращения',
              key: _formKeyMessage,
              controller: _messageController,
              validate: _validateMessage,
            ),
            const SizedBox(height: 10),
            editText(
                text: 'Почта',
                key: _formKeyEmail,
                controller: _emailController,
                validate: _validateEmail),
            const SizedBox(height: 30),
            Container(
              width: 300,
              height: 50,
              margin: const EdgeInsets.only(
                  top: 0, left: 10, right: 10, bottom: 10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  textStyle: const TextStyle(color: Colors.black),
                  primary: Colors.white,
                  shadowColor: Colors.black,
                  side: const BorderSide(color: Colors.black),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: () {
                  if (_formKeyName.currentState!.validate() &&
                      _formKeyPhone.currentState!.validate() &&
                      _formKeyMessage.currentState!.validate() &&
                      _formKeyEmail.currentState!.validate()) {
                    PostAppeal().postAppeal(
                        name: _nameController.text,
                        phone: _phoneController.text,
                        message: _messageController.text,
                        email: _emailController.text);

                    // setState(() {
                    //   if (PostAppeal().statusCode == 200){

                    //   }
                    // });

                    ScaffoldMessenger.of(context).hideCurrentSnackBar();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Ваше обращение отправлено!'),
                        action: SnackBarAction(
                          label: 'Ok',
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentSnackBar();
                            // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            //     content: Text(
                            //   'Kek',
                            // )));
                          },
                        ),
                      ),
                    );
                  }
                },
                child: const Center(
                  child: Text('Отправить обращение',
                      style: TextStyle(color: Colors.black)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String? _validateName(String? value) {
    if (value!.isEmpty) {
      return 'Заполните поле!';
    }
    // final nameExp = RegExp(r'^[a-zA-Z]+$');
    // if (!nameExp.hasMatch(value)) {
    //   return 'Введите только символы!';
    // }
    // final nameExp1 = RegExp(r'^[а-яА-ЯёЁ]+$');
    // if (!nameExp1.hasMatch(value)) {
    //   return 'Введите только символы!';
    // }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    final phoneExp = RegExp(r'^[0-9]+$');
    if (!phoneExp.hasMatch(value!)) {
      return 'Введите только цифры';
    }
    return null;
  }

  String? _validateMessage(String? value) {
    // final phoneExp = RegExp(r'^\(\d\d\d\) \d\d\d\-\d\d\d\d$');
    if (value!.isEmpty) {
      return 'Введите символы';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    final phoneExp = RegExp(
        r'^([a-z0-9_-]+\.)*[a-z0-9_-]+@[a-z0-9_-]+(\.[a-z0-9_-]+)*\.[a-z]{2,6}$');
    if (!phoneExp.hasMatch(value!)) {
      return 'Неправильный email';
    }
    return null;
  }

  Widget editText(
      {required String text,
      required var key,
      required var controller,
      var validate}) {
    return Center(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(8.0),
          ),
          // border: Border(
          //   top: BorderSide(width: 1.0, color: Colors.black),
          //   left: BorderSide(width: 1.0, color: Colors.black),
          //   right: BorderSide(width: 1.0, color: Colors.black),
          //   bottom: BorderSide(width: 1.0, color: Colors.black),
          // ),
        ),
        width: 300,
        //height: DynamicSize(context).tffHeight,
        //color: Colors.white,
        child: Form(
          key: key,
          child: TextFormField(
            controller: controller,
            cursorColor: Colors.black,
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.black),
              labelText: '  $text',
              labelStyle: const TextStyle(
                color: Colors.black,
              ),
              // enabledBorder: const OutlineInputBorder(
              //   borderRadius: BorderRadius.all(Radius.circular(16.0)),
              //   borderSide: BorderSide(color: Colors.black, width: 0.5),
              // ),
              focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              disabledBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black)),
              // suffixIcon: IconButton(
              //   onPressed: () {
              //     setState(() {
              //       //_hidePass = !_hidePass;
              //     });
              //   },
              //  // icon: Icon(_hidePass ? Icons.visibility : Icons.visibility_off,
              //     //  color: Colors.green),
              // ),
            ),
            //  obscureText: _hidePass,
            validator: validate,
          ),
        ),
      ),
    );
  }
}
