import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';

class TradesPage extends StatefulWidget {
  const TradesPage({ Key? key }) : super(key: key);

  @override
  _TradesPageState createState() => _TradesPageState();
}

class _TradesPageState extends State<TradesPage>  with TickerProviderStateMixin {
  TabController? _controllerTab;
  TabController? _controllerTabs;
  TabController? _controllerTab2;
  TabController? _controllerTab3;
  double _value = 1;
  bool btn_color = true;
  @override
  void initState() {
    super.initState();
    _controllerTab = TabController(length: 4, vsync: this);
    _controllerTabs = TabController(length: 6, vsync: this);
    _controllerTab2 = TabController(length: 3, vsync: this);
    _controllerTab3 = TabController(length: 3, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: trades(context),
      
    );
  }

  Column trades(BuildContext context) {
    return Column(
      children: [
        statistic(),
        buySel(),
        _openOrder(),
        _bid_ask_stat(),
      ],
    );
  }

  statistic() {
    return Container(
      height: getHeight(406),
      color: mainColor,
      child: Column(
        children: [
          Padding(
            padding:  EdgeInsets.only(
              top: getHeight(20),
              left: getWidth(24),
              right: getWidth(24),
            ),
            child: Container(
              height: getHeight(46),
              decoration: BoxDecoration(
                color: backColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: TabBar(
                  isScrollable: false,
                  controller: _controllerTab,
                  labelColor: Colors.white,
                  labelStyle: TextStyle(
                      fontSize: getWidth(14), fontWeight: FontWeight.w400),
                  unselectedLabelColor: unselectedlabelColor,
                  indicator: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  tabs: [
                    Tab(
                      text: 'Convert',
                    ),
                    Tab(text: 'Spot'),
                    Tab(text: 'Margin'),
                    Tab(text: 'Fiat'),
                  ],
                ),
              ),
            ),
          ),
          Row(
            children: [
              Container(
                height: getHeight(297),
                width: getWidth(316),
                padding: EdgeInsets.only(top: getHeight(17), left: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          "40,059.83",
                          style: TextStyle(
                              fontSize: getWidth(28),
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        Text(
                          "+0.81%",
                          style: TextStyle(
                            fontSize: getWidth(14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xff5ED5A8),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SvgPicture.asset(
                          "assets/icons/arrow.svg",
                          color: Color(0xffC1C7CD),
                          height: getHeight(24.0),
                          width: getWidth(12.0),
                        ),
                        Text(
                          "BTC/BUSD",
                          style: TextStyle(
                            fontSize: getWidth(14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xffC1C7CD),
                          ),
                        ),
                      ],
                    ),
                    SvgPicture.asset(
                      "assets/icons/stat.svg",
                      height: getHeight(160),
                      width: getWidth(316),
                    ),
                    SizedBox(
                      height: getHeight(10),
                    ),
                    Container(
                      width: getWidth(316),
                      height: getHeight(40),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "18:00",
                            style: TextStyle(
                              fontSize: getWidth(10),
                              fontWeight: FontWeight.w400,
                              color: Color(0xff777777),
                            ),
                          ),
                          Text(
                            "19:00",
                            style: TextStyle(
                              fontSize: getWidth(10),
                              fontWeight: FontWeight.w400,
                              color: Color(0xff777777),
                            ),
                          ),
                          Text(
                            "20:00",
                            style: TextStyle(
                              fontSize: getWidth(10),
                              fontWeight: FontWeight.w400,
                              color: Color(0xff777777),
                            ),
                          ),
                          Text(
                            "21:00",
                            style: TextStyle(
                              fontSize: getWidth(10),
                              fontWeight: FontWeight.w400,
                              color: Color(0xff777777),
                            ),
                          ),
                          Text(
                            "22:00",
                            style: TextStyle(
                              fontSize: getWidth(10),
                              fontWeight: FontWeight.w400,
                              color: Color(0xff777777),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: getWidth(98),
                height: getHeight(297),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "64,000.00",
                      style: TextStyle(
                        fontSize: getWidth(10),
                        fontWeight: FontWeight.w400,
                        color: Color(0xff777777),
                      ),
                    ),
                    Text(
                      "64,000.00",
                      style: TextStyle(
                        fontSize: getWidth(10),
                        fontWeight: FontWeight.w400,
                        color: Color(0xff777777),
                      ),
                    ),
                    Text(
                      "64,000.00",
                      style: TextStyle(
                        fontSize: getWidth(10),
                        fontWeight: FontWeight.w400,
                        color: Color(0xff777777),
                      ),
                    ),
                    Text(
                      "64,000.00",
                      style: TextStyle(
                        fontSize: getWidth(10),
                        fontWeight: FontWeight.w400,
                        color: Color(0xff777777),
                      ),
                    ),
                    Text(
                      "64,000.00",
                      style: TextStyle(
                        fontSize: getWidth(10),
                        fontWeight: FontWeight.w400,
                        color: Color(0xff777777),
                      ),
                    ),
                    Text(
                      "64,000.00",
                      style: TextStyle(
                        fontSize: getWidth(10),
                        fontWeight: FontWeight.w400,
                        color: Color(0xff777777),
                      ),
                    ),
                    Text(
                      "64,000.00",
                      style: TextStyle(
                        fontSize: getWidth(10),
                        fontWeight: FontWeight.w400,
                        color: Color(0xff777777),
                      ),
                    ),
                    SvgPicture.asset(
                      "assets/icons/bulkc_icon.svg",
                      height: getWidth(44),
                      width: getWidth(44),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Container(
            height: getHeight(38),
            decoration: BoxDecoration(
              color: backColor,
            ),
            child: TabBar(
              isScrollable: false,
              controller: _controllerTabs,
              labelColor: Colors.white,
              labelStyle: TextStyle(
                  fontSize: getWidth(14), fontWeight: FontWeight.w400),
              unselectedLabelColor: unselectedlabelColor,
              indicator: BoxDecoration(
                color: mainColor,
              ),
              tabs: [
                Tab(text: '1m'),
                Tab(text: '5m'),
                Tab(text: '15m'),
                Tab(text: '15m'),
                Tab(text: '1d'),
                Tab(text: 'more'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  buySel() {
    return Row(
      children: [
        GestureDetector(
          onTap: _showModalBottomSheet,
          child: Container(
            width: getWidth(207),
            height: getHeight(48),
            alignment: Alignment.center,
            child: Text(
              "Buy",
              style: TextStyle(
                  fontSize: getWidth(14), fontWeight: FontWeight.w400),
            ),
            color: Color(0xff5ED5A8),
          ),
        ),
        GestureDetector(
          onTap: _showModalBottomSheet,
          child: Container(
            width: getWidth(207),
            height: getHeight(48),
            alignment: Alignment.center,
            child: Text(
              "Sell",
              style: TextStyle(
                  fontSize: getWidth(14), fontWeight: FontWeight.w400),
            ),
            color: Color(0xffDD4B4B),
          ),
        ),
      ],
    );
  }

  _showModalBottomSheet() {
    return showModalBottomSheet(
        useRootNavigator: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(getWidth(15)),
          ),
        ),
        backgroundColor: mainColor,
        barrierColor: Colors.black.withOpacity(0.5),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc) {
          return ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: getHeight(370), minHeight: getHeight(370)),
            child: Container(
              decoration: BoxDecoration(
                color: mainColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(
                    getWidth(15),
                  ),
                  topRight: const Radius.circular(25.0),
                ),
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: getWidth(166),
                        top: getHeight(16),
                        right: getWidth(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Available:",
                          style: TextStyle(
                            fontSize: getWidth(12),
                            fontWeight: FontWeight.w400,
                            color: Color(0xff777777),
                          ),
                        ),
                        Text(
                          "15.234164400",
                          style: TextStyle(
                            fontSize: getWidth(12),
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        Text(
                          "BUSD",
                          style: TextStyle(
                            fontSize: getWidth(12),
                            fontWeight: FontWeight.w400,
                            color: Color(0xffA7AFB7),
                          ),
                        ),
                        Icon(
                          Icons.add_circle_rounded,
                          size: getWidth(20),
                          color: Color(0xff777777),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getHeight(20),
                      left: getWidth(24),
                      right: getWidth(24),
                    ),
                    child: Container(
                      height: getHeight(46),
                      decoration: BoxDecoration(
                        color: backColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: TabBar(
                          isScrollable: false,
                          controller: _controllerTab3,
                          labelColor: Colors.white,
                          labelStyle: TextStyle(
                              fontSize: getWidth(14),
                              fontWeight: FontWeight.w400),
                          unselectedLabelColor: unselectedlabelColor,
                          indicator: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          tabs: [
                            Tab(text: 'Limit'),
                            Tab(text: 'Market'),
                            Tab(text: 'Stop Limit'),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getHeight(8),
                      left: getWidth(24),
                      right: getWidth(24),
                    ),
                    child: Container(
                      height: getHeight(54),
                      decoration: BoxDecoration(
                        color: backColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            top: 4, left: getWidth(15), right: 4, bottom: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Price:",
                              style: TextStyle(
                                fontSize: getWidth(12),
                                fontWeight: FontWeight.w400,
                                color: Color(0xffA7AFB7),
                              ),
                            ),
                            Text(
                              "38418.49",
                              style: TextStyle(
                                fontSize: getWidth(12),
                                fontWeight: FontWeight.w400,
                                color: Color(0xffFFFFFF),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        btn_color = !btn_color;
                                      });
                                    },
                                    child: Container(
                                      height: getHeight(46),
                                      width: getWidth(46),
                                      decoration: BoxDecoration(
                                        color:
                                            btn_color ? mainColor : backColor,
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            bottomLeft: Radius.circular(8)),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '+',
                                        style: TextStyle(
                                          color: const Color(0xff777777),
                                          fontSize: getWidth(20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        btn_color = !btn_color;
                                      });
                                    },
                                    child: Container(
                                      height: getHeight(46),
                                      width: getWidth(46),
                                      decoration: BoxDecoration(
                                        color:
                                            btn_color ? backColor : mainColor,
                                        borderRadius: const BorderRadius.only(
                                            topRight: Radius.circular(8),
                                            bottomRight: Radius.circular(8)),
                                      ),
                                      alignment: Alignment.center,
                                      child: Text(
                                        '-',
                                        style: TextStyle(
                                          color: const Color(0xff777777),
                                          fontSize: getWidth(25),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: getHeight(8),
                      left: getWidth(24),
                      right: getWidth(24),
                    ),
                    child: Container(
                      height: getHeight(144),
                      decoration: BoxDecoration(
                        color: backColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              top: 4,
                              left: getWidth(15),
                              right: 4,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Quantity",
                                  style: TextStyle(
                                    fontSize: getWidth(12),
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffA7AFB7),
                                  ),
                                ),
                                Text(
                                  "38418.49",
                                  style: TextStyle(
                                    fontSize: getWidth(12),
                                    fontWeight: FontWeight.w400,
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            btn_color = !btn_color;
                                          });
                                        },
                                        child: Container(
                                          height: getHeight(46),
                                          width: getWidth(46),
                                          decoration: BoxDecoration(
                                            color: btn_color
                                                ? backColor
                                                : mainColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topLeft: Radius.circular(8),
                                                    bottomLeft:
                                                        Radius.circular(8)),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            '+',
                                            style: TextStyle(
                                              color: const Color(0xff777777),
                                              fontSize: getWidth(20),
                                            ),
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            btn_color = !btn_color;
                                          });
                                        },
                                        child: Container(
                                          height: getHeight(46),
                                          width: getWidth(46),
                                          decoration: BoxDecoration(
                                            color: btn_color
                                                ? mainColor
                                                : backColor,
                                            borderRadius:
                                                const BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(8),
                                                    bottomRight:
                                                        Radius.circular(8)),
                                          ),
                                          alignment: Alignment.center,
                                          child: Text(
                                            '-',
                                            style: TextStyle(
                                              color: const Color(0xff777777),
                                              fontSize: getWidth(25),
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Slider(
                            activeColor: Color(0xff777777),
                            min: 0,
                            max: 100,
                            value: _value,
                            onChanged: (value) {
                              setState(() {
                                _value = value;
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: getWidth(220),
                        top: getHeight(16),
                        right: getWidth(23)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "TOTAL:",
                          style: TextStyle(
                            fontSize: getWidth(14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xff777777),
                          ),
                        ),
                        Text(
                          "25.234164400",
                          style: TextStyle(
                            fontSize: getWidth(14),
                            fontWeight: FontWeight.w400,
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: getWidth(24),
                      vertical: getHeight(30),
                    ),
                    child: Container(
                      height: getHeight(54),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xff5ED5A8),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                        ),
                        child: Text(
                          'Buy',
                          style: TextStyle(
                            fontSize: getWidth(18),
                            fontWeight: FontWeight.w400,
                            color: Color(0xff171D22)
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }

  _openOrder() {
    return Container(
      height: getHeight(48),
      decoration: BoxDecoration(),
      child: TabBar(
        isScrollable: false,
        controller: _controllerTab2,
        labelColor: Color(0xff1B232A),
        labelStyle:
            TextStyle(fontSize: getWidth(14), fontWeight: FontWeight.w400),
        unselectedLabelColor: Color(0xffA7AFB7),
        indicator: BoxDecoration(
          color: Color(0xffF1F4F6),
        ),
        tabs: [
          Tab(text: 'Open Order (2)'),
          Tab(text: 'Order Books'),
          Tab(text: 'Market Trades'),
        ],
      ),
    );
  }

  _bid_ask_stat() {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: getHeight(32),
              width: getWidth(207),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffA7AFB7),
                  ),
                  right: BorderSide(
                    color: Color(0xffA7AFB7),
                  ),
                ),
              ),
              padding: EdgeInsets.only(left: getWidth(20)),
              alignment: Alignment.centerLeft,
              child: Text(
                "Bid",
                style: TextStyle(
                  fontSize: getWidth(12),
                  fontWeight: FontWeight.w400,
                  color: Color(0xffA7AFB7),
                ),
              ),
            ),
            Container(
              height: getHeight(180),
              width: getWidth(207),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffA7AFB7),
                  ),
                  right: BorderSide(
                    color: Color(0xffA7AFB7),
                  ),
                ),
              ),
              child: ListView.builder(
                itemBuilder: (BuildContext contex, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: getWidth(20), right: getWidth(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "27,486.39",
                          style: TextStyle(
                            fontSize: getWidth(12),
                            fontWeight: FontWeight.w400,
                            color: Color(0xff1B232A),
                          ),
                        ),
                        Text(
                          "27,486.39",
                          style: TextStyle(
                            fontSize: getWidth(12),
                            fontWeight: FontWeight.w400,
                            color: Color(0xff5ED5A8),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
        Column(
          children: [
            Container(
              height: getHeight(32),
              width: getWidth(207),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffA7AFB7),
                  ),
                ),
              ),
              padding: EdgeInsets.only(left: getWidth(20)),
              alignment: Alignment.centerLeft,
              child: Text(
                "Ask",
                style: TextStyle(
                  fontSize: getWidth(12),
                  fontWeight: FontWeight.w400,
                  color: Color(0xffA7AFB7),
                ),
              ),
            ),
            Container(
              height: getHeight(180),
              width: getWidth(207),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xffA7AFB7),
                  ),
                ),
              ),
              child: ListView.builder(
                itemBuilder: (BuildContext contex, index) {
                  return Padding(
                    padding: EdgeInsets.only(
                        left: getWidth(20), right: getWidth(10)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "27,486.39",
                          style: TextStyle(
                            fontSize: getWidth(12),
                            fontWeight: FontWeight.w400,
                            color: Color(0xff1B232A),
                          ),
                        ),
                        Text(
                          "27,486.39",
                          style: TextStyle(
                            fontSize: getWidth(12),
                            fontWeight: FontWeight.w400,
                            color: Color(0xffDD4B4B),
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
          ],
        ),
      ],
    );
  }


}