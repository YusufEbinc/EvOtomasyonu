import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ev_gider_app/screens/HomeScreen.dart';
import 'package:flutter_svg/flutter_svg.dart';

FirebaseFirestore _firestore = FirebaseFirestore.instance;
FirebaseAuth _auth = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  final formkey = GlobalKey<FormFieldState>();

  bool _obscureText = true;
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      child: Stack(
        children: [
          //Background Image
          Positioned(
            child: Image.asset(
              'assets/images/backraund_image.png',
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
          SingleChildScrollView(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              key: formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //Login İmage Container
                  Container(
                    height: size.height * .4,
                    width: size.width * .4,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/user.svg',
                      color: Colors.white,
                    ),
                  ),
                  //Login Mail Formfield
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: _email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.white),
                        labelText: 'Email',
                        suffixIcon: Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                      ),
                      validator: (girilendeger) {
                        if (girilendeger!.isEmpty ||
                            !girilendeger.contains("@")) {
                          return 'Gecerli bir Email Adresi giriniz';
                        } else
                          return null;
                      },
                      onSaved: (girilenVeri) {
                        _email.text = girilenVeri!;
                      },
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: 20,
                  ),
                  //Login Password Formfield
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: TextFormField(
                      controller: _password,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                            width: 2,
                          ),
                        ),
                        labelStyle:
                            TextStyle(fontSize: 20, color: Colors.white),
                        labelText: 'Password',
                        suffixIcon: IconButton(
                          onPressed: _toggle,
                          icon: Icon(
                            _obscureText
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      validator: (girilendeger) {
                        if (girilendeger!.length < 6) {
                          return 'Sifreniz Yetersiz';
                        } else
                          return null;
                      },
                      onSaved: (girilenVeri) {
                        _password.text = girilenVeri!;
                      },
                    ),
                  ),
                  //Space
                  SizedBox(
                    height: 20,
                  ),
                  //Login Kayit Button
                  Container(
                    margin: EdgeInsets.all(size.height * .03),
                    height: size.height * 0.06,
                    width: size.width / 1.5,
                    child: ElevatedButton(
                      onPressed: _kaydet,
                      child: Text(
                        'Kaydet',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                  //Login Giris Button
                  Container(
                    margin: EdgeInsets.all(size.height * .03),
                    height: size.height * 0.06,
                    width: size.width / 1.5,
                    child: ElevatedButton(
                      onPressed: girisYap,
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.black87,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Future<void> _kaydet() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(
              email: _email.text, password: _password.text)
          .then((kullanici) {
        _firestore
            .collection('Kullanicilar')
            .doc()
            .set({'mail': _email.text, 'sifre': _password.text});
      });
    } on FirebaseAuthException catch (e) {
      print("Kayit sırasında hata oluştu hata:$e");
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Kayıt Başarıyla Tamamlandı."),
        duration: Duration(seconds: 2),
        elevation: 0,
      ),
    );
    _email.text = "";
    _password.text = "";
  }

  Future<void> girisYap() async {
    try {
      await _auth
          .signInWithEmailAndPassword(
              email: _email.text, password: _password.text)
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
      });
    } on FirebaseAuthException catch (e) {
      print("Giriş yaparken hata oluştu hata:$e");
    }
  }
}
