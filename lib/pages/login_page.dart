import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui/widgets/my_btn.dart';

class LoginPage extends StatefulWidget {
  static final routeName = 'login';
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  FocusNode _focusNodePassword = FocusNode();
  GlobalKey<FormState> _formKey = GlobalKey();
  String _email = "", _password = "";

  @override
  void dispose() {
    _focusNodePassword.dispose();
    super.dispose();
  }

  _submit() {
    final bool isValid = _formKey.currentState.validate();
    if(isValid) {}
  }

 String _validateEmail(email) {
    if(email.isNotEmpty && email.contains("@")) {
      _email = email;
      return null;
    }
    return "Invalid Email";
  }

 String _validatePassword(password) {
    if(password.isNotEmpty && password.length > 4 ) {
      _password = password;
      return null;
    }
    return "Invalid Password";
  }

  @override
  Widget build(BuildContext context) {
    final MediaQueryData media = MediaQuery.of(context);
    final Size size = media.size;
    final EdgeInsets padding = media.padding;

    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            child: Container(
              height: size.height - padding.top - padding.bottom,
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top:60, bottom: 10),
                    child: Image.network('https://placeholder.com/wp-content/uploads/2018/10/placeholder.com-logo4.png', width: 280, color: Colors.blue,),  
                  ),
                  Text("-  Steven Andrade  -", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
                ],
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: 330,
                  minWidth: 200
                ),
                child: Form(
                  key: _formKey ,
                  child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "example.@domain.com", 
                        labelText: "Email", 
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        prefixIcon: Container(
                          width: 70,
                          height: 40,
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset('assets/icons/email.svg', color: Colors.black54,),
                        )
                      ),
                      keyboardType: TextInputType.emailAddress,
                      keyboardAppearance: Brightness.light,
                      textInputAction: TextInputAction.next,
                      validator: _validateEmail,
                      onFieldSubmitted: (String text) {
                        FocusScope.of(context).requestFocus(_focusNodePassword);
                      } ,
                    ),
                    SizedBox(height: 20,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "*****", 
                        labelText: "Password", 
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30)
                        ),
                        prefixIcon: Container(
                          width: 70,
                          height: 40,
                          padding: EdgeInsets.all(10),
                          child: SvgPicture.asset('assets/icons/key.svg', color: Colors.black54,),
                        )
                      ),      
                      obscureText: true,
                      keyboardAppearance: Brightness.light,
                      focusNode: _focusNodePassword,
                      textInputAction: TextInputAction.send,
                      validator: _validatePassword,
                      onFieldSubmitted: (String text) {
                        _submit();
                      },
                    ),
                    SizedBox(height: 5,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        CupertinoButton(
                          padding: EdgeInsets.zero,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 10,),
                            //padding: EdgeInsets.symmetric(vertical: 10),
                            decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 0.8, color: Colors.blue))),
                            child: Text("Recuperar Contraseña", style: TextStyle(color: Colors.blue, fontSize: 14),)
                          ),
                          onPressed: (){}
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),
                    MyBtn(
                      fullWidth: true,
                      label: "INGRESAR",
                      onPressed: _submit,
                      backgroundColor: Colors.blue,
                      textColor: Colors.white,
                    ),
                    SizedBox(height: 20,),
                    Text("o inicia con"),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: MyBtn(
                            fullWidth: true,
                            label: "FACEBOOK",
                            onPressed: () {},
                            backgroundColor: Color(0xff0D47A1),
                            textColor: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10,),
                        Expanded(
                          child: MyBtn(
                            fullWidth: true,
                            label: "GOOGLE",
                            onPressed: () {},
                            backgroundColor: Color(0xffD32F2F),
                            textColor: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
                )
              ),
            ],
          ),
            )
          )
        ),
      ),
    );
  }
}