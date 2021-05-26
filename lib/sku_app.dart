import 'package:flutter/material.dart';
import 'package:fluttertest/sku_register.dart';
import 'untils.dart';

class SkuApp extends StatefulWidget {
  @override
  _SkuAppState createState() => _SkuAppState();
}

class _SkuAppState extends State<SkuApp> {
  var _edtUserName = TextEditingController();
  var _edtPassword = TextEditingController();
  var _showpassword = false;
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
                                    border: InputBorder.none),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
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
                                obscureText: !this._showpassword,
                                controller: _edtPassword,
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  border: InputBorder.none,
                                  suffixIcon: IconButton(
                                    onPressed: (){
                                      setState(() => this._showpassword = !this._showpassword);
                                    },
                                    icon: Icon(
                                      Icons.remove_red_eye,
                                      color: this._showpassword ? Colors.blue : Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        'Quên mật khẩu?',
                        style: TextStyle(decoration: TextDecoration.underline),
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(50)),
                              child: TextButton(
                                  onPressed: () {
                                    loginNomal(
                                        _edtUserName.text, _edtPassword.text);
                                  },
                                  child: Text(
                                    'ĐĂNG NHẬP',
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
                                  color: Colors.green,
                                  borderRadius: BorderRadius.circular(50)),
                              child: TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                SkuRegister()));
                                  },
                                  child: Text(
                                    'ĐĂNG KÝ',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  )))),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text('Hoặc đăng nhập bằng'),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
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
