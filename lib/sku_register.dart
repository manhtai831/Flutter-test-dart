import 'package:flutter/material.dart';

import 'package:fluttertest/untils.dart';

class SkuRegister extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SkuRegisterState();
  }
}

class _SkuRegisterState extends State<SkuRegister> {
  var _edtUserName = TextEditingController();
  var _edtPassword = TextEditingController();
  var _edtConfirmPassword = TextEditingController();
  String error1 = '';
  String error2 = '';
  String error3 = '';

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Stack(
            children: [
              Image.asset('assets/images/background.png'),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      'assets/images/skw_logo_enabled.png',
                      width: _width / 3,
                      height: _height / 4,
                    ),
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.green, width: 1)),
                                ),
                                child:
                                    Image.asset('assets/images/icon_user.png')),
                            Container(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _edtUserName,
                                decoration: InputDecoration(
                                    hintText: 'User Name',
                                    border: InputBorder.none,
                                    ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            '$error1',
                            style: TextStyle(color: Colors.red),
                          ))),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.green, width: 1)),
                                ),
                                child:
                                    Image.asset('assets/images/icon_mk.png')),
                            Container(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _edtPassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            '$error2',
                            style: TextStyle(color: Colors.red),
                          ))),
                  SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.green),
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 4),
                        child: Row(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          color: Colors.green, width: 1)),
                                ),
                                child:
                                    Image.asset('assets/images/icon_mk.png')),
                            Container(
                              width: 10,
                            ),
                            Expanded(
                              child: TextField(
                                controller: _edtConfirmPassword,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: 'Confirm password',
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            '$error3',
                            style: TextStyle(color: Colors.red),
                          ))),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50)),
                              child: TextButton(
                                  onPressed: () {

                                    setState(() {

                                      if (_edtUserName.text.length < 6) {
                                        error1 = 'Username is short';
                                        error2 = '';
                                        error3 = '';
                                      }
                                      else if (!RegExp("^[a-zA-Z0-9]{6,}").hasMatch(_edtUserName.text)) {
                                        error1 = 'Letter is unavailable';
                                        error2 = '';
                                        error3 = '';
                                      }
                                      else if (_edtPassword.text.length < 6) {
                                        error2 = 'Password is short';
                                        error1 = '';
                                        error3 = '';
                                      }
                                      else if (_edtPassword.text != _edtConfirmPassword.text) {
                                        error1 = '';
                                        error2 = '';
                                        error3 = 'Password is invalid';
                                      }
                                      else {
                                        error1 = '';
                                        error2 = '';
                                        error3 = '';
                                        register(
                                            _edtUserName.text,
                                            _edtPassword.text,
                                            _edtConfirmPassword.text);
                                      }
                                    });
                                  },
                                  child: Text(
                                    'ĐĂNG KÝ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )))),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.brown,
                                  borderRadius: BorderRadius.circular(50)),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    'QUAY LẠI',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )))),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Đăng ký bằng liên kết',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: (){
                          loginGuest();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            width: _width / 5,
                            child: Image.asset(
                                'assets/images/skw_logo_enabled.png')),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          loginGuest();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            width: _width / 5,
                            child: Image.asset('assets/images/ic_gg.png')),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      InkWell(
                        onTap: () {
                          loginGuest();
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.white),
                            width: _width / 5,
                            child:
                                Image.asset('assets/images/ic_facebook.png')),
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
