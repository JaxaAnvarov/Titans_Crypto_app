import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/helper/list_expansion_tile.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: const Color(0xFF1B232A),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: kPrimaryTextColors,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          'Settings',
          style: TextStyle(
            color: const Color(0xFFA7AFB7),
            fontSize: getWidth(18.0),
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: getHeight(400.0),
            child: ListView.builder(
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF161C22),
                      borderRadius: BorderRadius.circular(
                        getWidth(30.0),
                      ),
                    ),
                    height: getHeight(35.0),
                    width: getWidth(38.0),
                    child: Container(
                      margin: EdgeInsets.all(getWidth(5.0)),
                      height: getHeight(20.0),
                      width: getWidth(23.0),
                      child: SvgPicture.asset(
                        ExpansionTileHelper.images[index],
                      ),
                    ),
                  ),
                  title: Text(
                    ExpansionTileHelper.titles[index].toString(),
                    style: TextStyle(
                      color: greywhite,
                      fontSize: getWidth(14.0),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  trailing: SizedBox(
                    width: getWidth(160.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          ExpansionTileHelper.subtitles[index],
                          style: TextStyle(
                              color: kPrimaryTextColors,
                              fontWeight: FontWeight.w400,
                              fontSize: getWidth(14.0)),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.arrow_forward,
                            color: kPrimaryTextColors,
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
