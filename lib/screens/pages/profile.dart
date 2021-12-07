import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/helper/list_expansion_tile.dart';

class ProfilUpdatePage extends StatefulWidget {
  const ProfilUpdatePage({Key? key}) : super(key: key);

  @override
  _ProfilUpdatePageState createState() => _ProfilUpdatePageState();
}

class _ProfilUpdatePageState extends State<ProfilUpdatePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color(0xFF1B232A),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: getWidth(18.0),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: kPrimaryTextColors,
        ),
      ),
      body: Column(
        children: [
          Container(
            height: getHeight(250.0),
            child: Stack(
              children: [
                Container(
                  height: getHeight(100.0),
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Color(0xFF1B262E),
                        Color(0xFF1B2830),
                        Color(0xFF1B2C30),
                        Color(0xFF1B3034),
                        Color(0xFF1B3436),
                        Color(0xFF1C3638),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    left: getHeight(160.0),
                    bottom: getHeight(65.0),
                    child: Column(
                      children: [
                        Container(
                          height: getWidth(110.0),
                          width: getWidth(110.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.white,
                              width: 2.0,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            "assets/images/profile.png",
                            fit: BoxFit.cover,
                          ),
                        ),
                        SizedBox(
                          height: getHeight(14.0),
                        ),
                        Text(
                          "User1234",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: getWidth(18.0),
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                            width: getWidth(100),
                            child: const Divider(
                              color: kPrimaryTextColors,
                            ))
                      ],
                    )),
              ],
            ),
          ),
          SizedBox(
            height: getHeight(400.0),
            child: ListView.builder(
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: getHeight(10.0),
                      horizontal: getWidth(24.0)),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: ExpansionTileHelper.titles2[index].toString(),
                      hintText:
                          ExpansionTileHelper.subtitles2[index].toString(),
                    ),
                  ),
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: getWidth(179.0),
                height: getHeight(54.0),
                child: Text(
                  "Cancel",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: getWidth(18.0),
                      fontWeight: FontWeight.w400),
                ),
                decoration: BoxDecoration(
                  color: kPrimaryTextColors,
                  borderRadius: BorderRadius.circular(
                    getWidth(16.0),
                  ),
                ),
                alignment: Alignment.center,
              ),
              Container(
                width: getWidth(179.0),
                height: getHeight(54.0),
                child: Text(
                  "Save Changes",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: getWidth(18.0),
                      fontWeight: FontWeight.w400),
                ),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(
                    getWidth(16.0),
                  ),
                ),
                alignment: Alignment.center,
              )
            ],
          )
        ],
      ),
    );
  }
}
