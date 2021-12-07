import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/screens/login_pages/signin_number.dart';
import 'package:titanscrypto/servises/servisauth.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool chek = true;
  bool signin = true;
  bool isEmail = true;

  Services _apiService=Helper();

  @override
  void initState() {
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(resizeToAvoidBottomInset: false, body: signinEmail());
  }

  Container signinEmail() {
    return Container(
      color: bkColor,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: getWidth(24)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(
                  bottom: getHeight(30), top: getHeight(35), left: getWidth(5)),
              child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: SvgPicture.asset(
                    "assets/icons/x_icon.svg",
                    color: greyColor,
                    height: getHeight(19),
                    width: getHeight(19),
                  )),
            ),
            topSignInButton(signin),
            SizedBox(
              height: getHeight(30),
            ),
            signin
                ? Text(
                    "Sign in",
                    style: TextStyle(fontSize: getWidth(32), color: whColor),
                  )
                : Text(
                    "Sign up",
                    style: TextStyle(fontSize: getWidth(32), color: whColor),
                  ),
            SizedBox(
              height: getHeight(44),
            ),
            formEmailSignin(signin, isEmail),
            facebookgoogle(),
            fingerprint(),
          ],
        ),
      ),
    );
  }

  Container topSignInButton(bool signin1) {
    return Container(
      alignment: Alignment.center,
      height: getHeight(46),
      width: getWidth(366),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(getWidth(12))),
          color: blackColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              _apiService.inemailController.clear();
              _apiService.inpasswordController.clear();
              setState(() {
                signin = true;
                print("$signin");
              });
            },
            child: Container(
              padding: EdgeInsets.all(getWidth(4)),
              alignment: Alignment.center,
              height: getHeight(38),
              width: getWidth(162),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(getWidth(12))),
                color: signin1 ? bkColor : blackColor,
              ),
              child: Text(
                "Sign in",
                style: TextStyle(
                  color: greyColor,
                  fontSize: getWidth(14),
                ),
              ),
            ),
          ),
          InkWell(
            onTap: () {
              _apiService.inemailController.clear();
              _apiService.inpasswordController.clear();
              signin = false;
              isEmail = true;
              setState(() {
                print("hello $signin");
              });
            },
            child: Container(
              padding: EdgeInsets.all(getWidth(4)),
              alignment: Alignment.center,
              height: getHeight(38),
              width: getWidth(162),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(getWidth(12))),
                color: signin1 ? blackColor : bkColor,
              ),
              child: Text(
                "Sign up",
                style: TextStyle(
                  color: greyColor,
                  fontSize: getWidth(14),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  Row fingerprint() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            SvgPicture.asset("assets/icons/Vector.svg"),
            SizedBox(
              height: getHeight(20),
            ),
            Text(
              "Use fingerprint instead?",
              style: TextStyle(fontSize: getWidth(14), color: greywhite),
            )
          ],
        ),
      ],
    );
  }

  Column facebookgoogle() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                thickness: 1,
                height: 2,
                color: greyColor,
              ),
            ),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: getWidth(9)),
                child: Text(
                  "Or login with ",
                  style: TextStyle(fontSize: getWidth(14), color: greyColor),
                )),
            Expanded(
              child: Divider(
                thickness: 1,
                height: 2,
                color: greyColor,
              ),
            ),
          ],
        ),
        SizedBox(
          height: getHeight(8),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: SvgPicture.asset("assets/icons/facebooklogo.svg"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  primary: whColor,
                  fixedSize: Size(getWidth(154), getHeight(54))),
            ),
            ElevatedButton(
              onPressed: () {
                _apiService.signInwithGoogle(context);
              },
              child: SvgPicture.asset("assets/icons/googlelogo.svg"),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  primary: whColor,
                  fixedSize: Size(getWidth(154), getHeight(54))),
            )
          ],
        ),
        SizedBox(
          height: 45,
        ),
      ],
    );
  }

  Form formEmailSignin(bool signin1, bool isemail1) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          signin1
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    isemail1
                        ? Text(
                            "Email",
                            style: TextStyle(
                                fontSize: getWidth(14), color: greywhite),
                          )
                        : Text(
                            "Your number",
                            style: TextStyle(
                                fontSize: getWidth(14), color: greywhite),
                          ),
                    isemail1
                        ? InkWell(
                            onTap: () {
                              _apiService.inemailController.clear();
                              _apiService.inpasswordController.clear();
                              setState(() {
                                print("hello");
                                isEmail = false;
                              });
                            },
                            child: Text("Sign in with mobile",
                                style: TextStyle(
                                    fontSize: getWidth(14), color: tealColor)),
                          )
                        : InkWell(
                            onTap: () {
                              _apiService.inemailController.clear();
                              _apiService.inpasswordController.clear();
                              setState(() {
                                isEmail = true;
                              });
                            },
                            child: Text("Sign in with email",
                                style: TextStyle(
                                    fontSize: getWidth(14), color: tealColor)),
                          )
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Email",
                      style:
                          TextStyle(fontSize: getWidth(14), color: greywhite),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (c) => SigninNumber()));
                      },
                      child: Text("Registr with mobile",
                          style: TextStyle(
                              fontSize: getWidth(14), color: tealColor)),
                    )
                  ],
                ),
          SizedBox(
            height: getHeight(8),
          ),
          TextFormField(
            validator: (value) {
              if (value!.length < 4) {
                return "Must contains 4 symbols";
              }
            },
            controller: _apiService.inemailController,
            keyboardType:
                isEmail ? TextInputType.emailAddress : TextInputType.phone,
            style: const TextStyle(color: whColor),
            cursorColor: whColor,
            decoration: InputDecoration(
                constraints: BoxConstraints(maxHeight: getHeight(54)),
                hintText: isemail1 ? "Enter your email" : "Enter your number",
                hintStyle: TextStyle(fontSize: getWidth(14), color: greyColor),
                fillColor: blackColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        BorderRadius.all(Radius.circular(getWidth(12))))),
          ),
          SizedBox(
            height: getHeight(20),
          ),
          Text(
            "Password",
            style: TextStyle(fontSize: getWidth(14), color: greywhite),
          ),
          SizedBox(
            height: getHeight(8),
          ),
          TextFormField(
            controller: _apiService.inpasswordController,
            validator: (value) {
              if (value!.length < 4) {
                return "Must contains 4 symbols";
              }
            },
            obscureText: chek,
            keyboardType: isEmail ? TextInputType.text : TextInputType.phone,
            style: const TextStyle(color: whColor),
            decoration: InputDecoration(
                suffix: IconButton(
                  onPressed: () {
                    setState(
                      () {
                        chek = !chek;
                      },
                    );
                  },
                  icon: chek
                      ? const Icon(
                          Icons.visibility,
                          color: greyColor,
                        )
                      : const Icon(
                          Icons.visibility_off,
                          color: greyColor,
                        ),
                ),
                constraints: BoxConstraints(maxHeight: getHeight(54)),
                hintText: "Enter your password",
                hintStyle: TextStyle(fontSize: getWidth(14), color: greyColor),
                fillColor: blackColor,
                filled: true,
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius:
                        BorderRadius.all(Radius.circular(getWidth(12))))),
          ),
          SizedBox(
            height: getHeight(8),
          ),
          Text("Forgot password?",
              style: TextStyle(fontSize: getWidth(14), color: tealColor)),
          SizedBox(
            height: getHeight(20),
          ),
          ElevatedButton(
            onPressed: () async {
              if (_formKey.currentState!.validate()) {
                if (signin) {
                  if (isEmail) {
                    await _apiService.readdata(
                        _apiService.inemailController.text,
                        _apiService.inpasswordController.text,
                        context);
                  } else {}
                } else {
                  if (isEmail) {
                    await _apiService.createUser(
                        _apiService.inemailController.text,
                        _apiService.inpasswordController.text,
                        context);
                  }
                }
              }
            },
            child: signin
                ? Text(
                    "Sign in",
                    style: TextStyle(color: blackColor, fontSize: getWidth(16)),
                  )
                : Text(
                    "Sign up",
                    style: TextStyle(color: blackColor, fontSize: getWidth(16)),
                  ),
            style: ElevatedButton.styleFrom(
              primary: tealColor,
              fixedSize: Size(
                getWidth(366),
                getHeight(54),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
          ),
          SizedBox(
            height: getHeight(8),
          ),
        ],
      ),
    );
  }
}
