import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:titanscrypto/constants/consts.dart';
import 'package:titanscrypto/constants/size_config.dart';
import 'package:titanscrypto/helper/list_of_informations.dart';

class MarketPage extends StatefulWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  _MarketPageState createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> with TickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this,initialIndex: 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bkColor,
      body: marketPage(context),
    );
  }

  Widget marketPage(BuildContext context) {
    SizeConfig().init(context);
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getWidth(24.0), vertical: getHeight(20.0)),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: kPrimaryTabBarColor,
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: TabBar(
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: kPrimaryBgColors,
                ),
                unselectedLabelColor: kPrimaryTextColors,
                controller: _tabController,
                indicatorColor: Colors.white,
                
                tabs: const [
                  Tab(
                    text: 'Convert',
                  ),
                  Tab(
                    text: 'Spot',
                  ),
                  Tab(
                    text: 'Margin',
                  ),
                  Tab(
                    text: 'Flat',
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: getHeight(600),
            child: TabBarView(
              controller: _tabController,
              children: [
                Container(
                  height: 200.0,
                  width: 300.0,
                  child: const Text('Hello'),
                  color: Colors.yellow,
                ),
                Container(
                  height: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        height: getHeight(450  )
                        ,
                        child: ListView.builder(
                          itemCount: 6,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Container(
                                height: getHeight(80.0),
                                width: double.infinity,
                                // color: Colors.white,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: getWidth(5.0)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.all(5.0),
                                            height: getWidth(70.0),
                                            width: getWidth(70.0),
                                            decoration: BoxDecoration(
                                              color: Information.colors[index],
                                              // borderRadius: BorderRadius.circular(30.0),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Container(
                                              margin: const EdgeInsets.all(8.0),
                                              height: getWidth(20.0),
                                              width: getWidth(20.0),
                                              // color: Colors.indigo,
                                              child: SvgPicture.asset(
                                                Information.images[index],
                                                height: 10.0,
                                              ),
                                            ),
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                alignment: Alignment.centerLeft,
                                                height: getHeight(24.0),
                                                width: getWidth(70.0),
                                                child: Text(
                                                  Information.titles[index],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    fontSize: getWidth(14.0),
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: getHeight(4.0)),
                                              Container(
                                                height: getHeight(17.0),
                                                width: getWidth(70.0),
                                                child: Text(
                                                  Information.subtitles[index],
                                                  style: TextStyle(
                                                    color: kPrimaryTextColors,
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: getWidth(14.0),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: getHeight(31.0),
                                        width: getWidth(91.0),
                                        // color: Colors.black,
                                        child: SvgPicture.asset(
                                          Information.statistic[index],
                                        ),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.centerRight,
                                            height: getHeight(24.0),
                                            width: getWidth(77.0),
                                            child: Text(
                                              Information.price[index],
                                              style: const TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.w700,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          Container(
                                            alignment: Alignment.centerRight,
                                            height: getHeight(17.0),
                                            width: getWidth(77.0),
                                            child: Text(
                                              Information.percent[index],
                                              style: TextStyle(
                                                color: Information
                                                    .colors_text[index],
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: getHeight(20),),
                      Container(
                        height: getHeight(70.0),
                        width: getWidth(366.0),
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          color: Colors.black,
                          radius: const Radius.circular(10.0),
                          strokeWidth: 2,
                          dashPattern: const [
                            5,
                            5,
                          ],
                          child: GestureDetector(
                            onTap: () {},
                            child: Card(
                              color: const Color(0xFF3E474F),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add_circle,
                                      size: 30.0,
                                      color: Color(0xFF5ED5A8),
                                    ),
                                  ),
                                  Text(
                                    'Add Fovorite',
                                    style: TextStyle(
                                      color: kPrimaryTextColors,
                                      fontSize: getWidth(18.0),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 100.0,
                  width: 300.0,
                  child: const Text('Hello'),
                  color: Colors.orange,
                ),
                Container(
                  height: 100.0,
                  width: 300.0,
                  child: const Text('Hello'),
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
