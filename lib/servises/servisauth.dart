import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:titanscrypto/screens/login_pages/start_home.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class Services {
  //Function

  Future<String?> signInwithGoogle(BuildContext context);
  createUser(String email, String password, BuildContext context);
  snackBarForUserNotFound(context);
  readdata(String email, String password, BuildContext context);
  verified(String phone, String kod, BuildContext context);
  sendCodephone(String phonenumber);
  Future isLogin();
  void _writestore(String email, String password);
  pushToHomePage(context);

  // Variable
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController inemailController = TextEditingController();
  TextEditingController inpasswordController = TextEditingController();
  TextEditingController kodController = TextEditingController();
  var phoneController = TextEditingController();
  String? code;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final storage = const FlutterSecureStorage();
  String? username;
  String? phoneNumber;
  String? emailstr;
}

class Helper extends Services {
  @override
  createUser(String email, String password, BuildContext context) async {
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    debugPrint("${userCredential.user}");

    _writestore(email, password);
    print("Create funksiyadasan");

    if (auth.currentUser != null) {
      pushToHomePage(context);
      writeLogin();
    }
  }

  @override
  sendCodephone(String phonenumber1) async {
    debugPrint(phonenumber1);
    await auth.verifyPhoneNumber(
        phoneNumber: phonenumber1,
        verificationCompleted: (PhoneAuthCredential credential) {
          print(credential.toString());
        },
        verificationFailed: (FirebaseAuthException e) {},
        codeSent: (String verificationId, int? resendToken) {
          print(resendToken.toString());
          print(verificationId);
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          code = verificationId;
        });
  }

  @override
  readdata(String email, String password, BuildContext context) async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (userCredential.user!.email != null) {
        writeLogin();
        username = userCredential.user!.displayName;
        emailstr = userCredential.user!.email;
        pushToHomePage(context);
      } else {
        snackBarForUserNotFound(context);
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  signinnumber(String phone, String password, context) async {
    QuerySnapshot snapshot = await firestore.collection("collection").get();
    for (int i = 0; i < snapshot.docs.length; i++) {
      var data = snapshot.docs;
      if (data[i]["eamilname"] == phone) {
        phoneNumber = phone;
        pushToHomePage(context);
      }
    }
  }

  @override
  verified(String phone, String kod, BuildContext context) async {
    var _credential =
        await PhoneAuthProvider.credential(verificationId: code!, smsCode: kod);

    await auth.signInWithCredential(_credential).then((dynamic result) {
      //firestorega yoz

      _writestore(phone, kod);
      writeLogin();
      phoneNumber = phone;
      pushToHomePage(context);
    }).catchError((e) {
      print(e);
    });
  }

  @override
  void _writestore(String email, String password) {
    debugPrint(email);
    debugPrint(password);

    firestore.collection("users").add({
      'eamilname': email,
      'password': password,
    });
  }

  @override
  isLogin() async {
    String? value = await storage.read(key: 'judaMaxfiySoz');
    return value;
  }

  @override
  writeLogin() async {
    await storage.write(key: 'judaMaxfiySoz', value: "logged");
  }

  snackBarForUserNotFound(context) {
    return ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text(
          "Username topilmadi !",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  pushToHomePage(context) {
    return Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => StartHome()),
        (Route<dynamic> route) => false);
  }

  Future<String?> signInwithGoogle(context) async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      await auth.signInWithCredential(credential).then((value) {
        username = value.user!.displayName;
        phoneNumber = value.user!.phoneNumber;
      });

      pushToHomePage(context);
      writeLogin();
    } on FirebaseAuthException catch (e) {
      print(e.message);
      throw e;
    }
  }
}








// import 'package:flutter/material.dart';
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:flutter/material.dart';

// abstract class ApiService{
// FirebaseAuth auth = FirebaseAuth.instance;
// Future phoneSignup();
// Future<bool> signInWithEmailAndPassword(String email, String password);
// Future<bool> updateUser(UserModel user, String oldEmail, String password);
// Future<bool> isAdmin();
// TextEditingController _emailController = TextEditingController();
//   TextEditingController _passwordController = TextEditingController();
// String? code;

// }




// class Enter extends ApiService{


// @override
// phoneSignup(){
// await FirebaseAuth.instance.verifyPhoneNumber(
//                                     phoneNumber:
//                                         _emailController.text.toString(),
//                                     verificationCompleted:
//                                         (PhoneAuthCredential credential) {
//                                       print(credential.toString());
//                                     },
//                                     verificationFailed:
//                                         (FirebaseAuthException e) {},
//                                     codeSent: (String verificationId,
//                                         int? resendToken) {
//                                       print(resendToken.toString());
//                                       print(verificationId);
//                                     },
//                                     codeAutoRetrievalTimeout:
//                                         (String verificationId) {
//                                       code = verificationId;
//                                     });

// }
// @override
// verified(){
//     var _credential = PhoneAuthProvider.credential(
//                                 verificationId: code!,
//                                 smsCode: _codecontroller.text.toString(),
//                               );
//                               _auth
//                                   .signInWithCredential(_credential)
//                                   .then((dynamic result) {
//                                 writePhone(_phonecontroller.text.toString());
//                                 setState(() {});
//                               }).catchError((e) {
//                                 print(e);
//                               });
//                             }

//   @override
//   Future<bool> isAdmin() {
//     // TODO: implement isAdmin
//     throw UnimplementedError();
//   }

  
//   @override
//   Future<bool> updateUser(user, String oldEmail, String password) {
//     // TODO: implement updateUser
//     throw UnimplementedError();
//   }




// @override
//  Future<bool> signInWithEmailAndPassword(String email, String password) async {
//     try {
//       await _auth.signInWithEmailAndPassword(email: email, password: password);
//       return true;
//     } catch (e) {
//       return false;
//     }
//   }
// @override
// Future<bool> updateUser(
//       UserModel user, String oldEmail, String password) async {
//     bool _result = false;
//     await _auth
//         .signInWithEmailAndPassword(email: oldEmail, password: password)
//         .then((_firebaseUser) {
//       _firebaseUser.user.updateEmail(user.email);
//       _updateUserFirestore(user, _firebaseUser.user);
//       _result = true;
//     });
//     return _result;
//   }


// }