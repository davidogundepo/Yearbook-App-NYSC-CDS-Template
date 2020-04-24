import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:fnancialinclusioncds2020/api/achievement_images_api.dart';
import 'package:fnancialinclusioncds2020/notifier/achievement_images_notifier.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';


String cdsName = "Financial Inclusion CDS";
String aboutCDS = "About $cdsName";

String visionTitle = "OUR VISION STATEMENT";
String visionStatement = "Raising the total Nigerian youth through comprehensive education.";
String missionTitle = "OUR MISSION STATEMENT";
String missionStatement = "Mobilizing Academic, Moral, Social, Political and Religious tools, by dedicated and vision driven educators in a proactive environment of teaching and learning, which is geared towards impacting and equipping our corp members to be THE TOTAL NIGERIAN YOUTH the world will be proud of.";

String coreValues = "OUR CORE VALUES";
String cvStatement1 = "1. We are dedicated to the success of your ward\n\n";
String cvStatement2 = "2. We teach academics as well as morals\n\n";
String cvStatement3 = "3. We are genuinely interested in deploying the full capacity of your ward.\n\n";
String cvStatement4 = "4. We create a social atmosphere for corpers and we believe every youth can excel.";

String whyCDSGroup = "WHY $cdsName?".toUpperCase();
String whyCDSGroupStatement = "$cdsName was established on the 3rd of October 1974 out of the vision and passion of President David Oludepo to empower today’s youth for tomorrows challenges.\n\nWe offer students (both domestic and international) the opportunity to earn an unparalleled high-quality educational experience. With passionate and  qualified teaching staff, a clean and caring school atmosphere, and the resources to supply students with the skills necessary for their continued personal success, our school looks to help students to realize their potential.";
String cdsBody = "Financial Inclusion CDS Body\n\n";
String cdsBodyStatement = "We currently have 54 corp members in $cdsName, 31 male corpers and 22 female corpers. 13 corp members have graduated from $cdsName.";
String cdsPopulationChart = "$cdsName Corp Members Population Chart";

String schoolAchievements = "Some of our achievements";

double maleCDSCorperPopulation = 31;
double femaleCDSCorperPopulation = 22;


Color backgroundColor = Colors.blueGrey[900];
Color appBarBackgroundColor = Colors.blueGrey[800];
Color appBarBackgroundTextColor = Colors.blueGrey;
Color cardBackgroundColor = Colors.black38;
Color cardTextColor = Colors.blueGrey;
Color materialInkWellColor = Colors.blueGrey;
Color materialTextColor = Colors.blueGrey;
Color containerColor = Colors.blueGrey.withAlpha(50);
Color containerTextColor = Colors.blueGrey[900];
Color containerColor2 = Colors.blueGrey;
Color chartBackgroundColor = Colors.blueGrey[200];
Color chartTextColor = Colors.blueGrey[900].withOpacity(0.9);

class AboutCDS extends StatefulWidget {

  @override
  _AboutCDS createState() => _AboutCDS();
}

class _AboutCDS extends State<AboutCDS> {

  final controlla = PageController(
    initialPage: 0,
  );

  var scrollDirection = Axis.horizontal;


  @override
  void initState() {

    AchievementsNotifier achievementsNotifier = Provider.of<AchievementsNotifier>(context, listen: false);
    getAchievements(achievementsNotifier);

    cdsCorperMap.putIfAbsent("Male Corp Members", () => 31);
    cdsCorperMap.putIfAbsent("Female Corp Members", () => 22);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    AchievementsNotifier achievementsNotifier = Provider.of<AchievementsNotifier>(context);

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(aboutCDS,
        style: TextStyle(
          color: appBarBackgroundTextColor),),
        elevation: 10,
        backgroundColor: appBarBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 500,
              child: PageView(
                controller: controlla,
                scrollDirection: scrollDirection,
                pageSnapping: true,
                children: <Widget>[
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    visionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                visionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    missionTitle,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                missionStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    coreValues,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: RichText(
                                textAlign: TextAlign.justify,
                                text: TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: cvStatement1,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement2,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement3,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    TextSpan(
                                      text: cvStatement4,
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: cardTextColor,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Card(
                      color: cardBackgroundColor,
                      elevation: 4,
                      margin:   EdgeInsets.all(24),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: Center(
                                child: Container(
                                  child: Text(
                                    whyCDSGroup,
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: cardTextColor,
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 30, left: 8, right: 8, bottom: 8),
                              child: Text(
                                whyCDSGroupStatement,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: cardTextColor,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                child: Material (
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 15, left: 10, right: 10),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: RichText(
                          textAlign: TextAlign.justify,
                          text:TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                  text: cdsBody,
                                  style: TextStyle(
                                    color: materialTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold,
                                  )
                              ),
                              TextSpan(
                                  text: cdsBodyStatement,
                                  style: TextStyle(
                                    color: materialTextColor,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w300,
                                  )
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                    color: containerColor,
                    borderRadius: new BorderRadius.circular(10)
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: materialInkWellColor,
                    onTap: () {},
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(top: 15, bottom: 30, left: 10, right: 10),
                            child: Text(cdsPopulationChart,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: materialTextColor,
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          PieChart(
                            legendStyle: TextStyle(
                              color: materialTextColor,
                            ),
                            dataMap: cdsCorperMap,
                            animationDuration: Duration(seconds: 10),
                            chartLegendSpacing: 42.0,
                            chartRadius: MediaQuery.of(context).size.width / 2.7,
                            showChartValuesInPercentage: false,
                            showChartValues: true,
                            showChartValuesOutside: false,
                            chartValueBackgroundColor: chartBackgroundColor,
                            colorList: cdsCorperColorList,
                            showLegends: true,
                            legendPosition: LegendPosition.right,
                            decimalPlaces: 0,
                            showChartValueLabel: true,
                            initialAngle: 0,
                            chartValueStyle: defaultChartValueStyle.copyWith(
                              color: chartTextColor,
                            ),
                            chartType: ChartType.disc,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 10),
              child: Text(schoolAchievements,
                style: TextStyle(
                    fontSize: 20,
                    color: materialTextColor,
                    fontWeight: FontWeight.w500
                ),
              ),
            ),
            Container(
              height: 340,
              child: Swiper(
                viewportFraction: 0.8,
                scale: 0.9,
                itemCount: achievementsNotifier.achievementsList.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: <Widget>[
                      Container(
                        height: 250,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                            image: DecorationImage(
                              alignment: Alignment(0, -0.6),
                              image: CachedNetworkImageProvider(
                                  achievementsNotifier.achievementsList[index].image
                              ),
                              fit: BoxFit.cover,
                            )
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                            color: containerColor2
                        ),
                        child: ListTile(
                          title: Center(
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Text(
                                achievementsNotifier.achievementsList[index].toastName,
                                style: TextStyle(
                                  color: containerTextColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                },
                itemWidth: 350,
              ),

            ),

          ],
        ),
      ),
    );

  }
}

class CDSCorperPopulation{
  String x;
  double y;
  CDSCorperPopulation(this.x,this.y);
}

dynamic getCDSCorperPopulationData(){
  List<CDSCorperPopulation> cdsCorperPopulationData = <CDSCorperPopulation>[
    CDSCorperPopulation('Male', maleCDSCorperPopulation),
    CDSCorperPopulation('Female', femaleCDSCorperPopulation),
  ];
  return cdsCorperPopulationData;
}



bool toggle = false;

Map<String, double> cdsCorperMap = Map();

List<Color> cdsCorperColorList = [
  Color.fromRGBO(145, 172, 179, 1).withAlpha(160),
  Color.fromRGBO(184, 186, 181, 1),
];

