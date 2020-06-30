import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fnancialinclusioncds2020/about_menu_details_pages/about_app.dart';
import 'package:fnancialinclusioncds2020/about_menu_details_pages/about_cds.dart';
import 'package:fnancialinclusioncds2020/about_menu_details_pages/about_nysc_federal.dart';
import 'package:fnancialinclusioncds2020/about_menu_details_pages/acronyms_meanings.dart';
import 'package:fnancialinclusioncds2020/about_menu_details_pages/who_we_are.dart';
import 'package:fnancialinclusioncds2020/api/batch_c_stream_two_api.dart';
import 'package:fnancialinclusioncds2020/details_pages/batch_c_stream_two_details_page.dart';
import 'package:fnancialinclusioncds2020/notifier/batch_c_stream_two_notifier.dart';
import 'package:fnancialinclusioncds2020/thrown_searches/batch_c_stream_two_thrown_search.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';


String nyscName = "NYSC";
String cdsName = "Financial Inclusion CDS Group";
String thrownName = "Batch C Stream Two Corpers";

String exitAppStatement = "Exit from App";
String exitAppTitle = "Come on!";
String exitAppSubtitle = "Do you really really want to?";
String exitAppNo = "Oh No";
String exitAppYes = "I Have To";


String whoWeAre = "Who We Are";
String aboutCDS = "About $cdsName";
String aboutNYSC = "About $nyscName 2020";
String acronymMeanings = "Acronym Meanings";
String aboutApp = "About App";

String imgAsset = "assets/images/fin_inc_40.jpeg";



Color backgroundColor = Color.fromRGBO(114, 78, 147, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(95, 65, 128, 1);
Color appBarIconColor = Colors.white;
Color modalColor = Color.fromRGBO(95, 65, 128, 1);
Color modalBackgroundColor = Colors.transparent;
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Colors.white;
Color splashColor = Colors.purple;
Color iconColor = Colors.white;
Color textColor = Colors.white;
Color textColorTwo = Colors.white70;
Color dialogBackgroundColor = Color.fromRGBO(114, 78, 147, 1);
Color borderColor = Colors.black;


class MyBatchCStreamTwoPage extends StatefulWidget with NavigationStates {

  MyBatchCStreamTwoPage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyBatchCStreamTwoPageState createState() => _MyBatchCStreamTwoPageState();
}

class _MyBatchCStreamTwoPageState extends State< MyBatchCStreamTwoPage> {

  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }

  Widget _buildProductItem(BuildContext context, int index) {
    BatchCStreamTwoNotifier batchCStreamTwoNotifier = Provider.of<BatchCStreamTwoNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: borderColor.withAlpha(50),
        ),

        child: Material(
          color: materialBackgroundColor,
          child: InkWell(
            splashColor: splashColor,
            onTap: () {
              batchCStreamTwoNotifier.currentBatchCStreamTwo = batchCStreamTwoNotifier.batchCStreamTwoList[index];
              navigateToBatchCStreamTwoDetailsPage(context);
            },

            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      image: DecorationImage(
                        alignment: Alignment(0, -1),
                        image: CachedNetworkImageProvider(
                            batchCStreamTwoNotifier.batchCStreamTwoList[index].image
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  batchCStreamTwoNotifier.batchCStreamTwoList[index].name,
                                  style: GoogleFonts.tenorSans(
                                      color: textColor,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                              (() {
                                if (batchCStreamTwoNotifier.batchCStreamTwoList[index].cdsExecutive == "Yes") {
                                  return
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Icon (
                                          MdiIcons.checkboxMarkedCircle,
                                          color: iconColor,
                                        ),
                                      ],
                                    );
                                } else {
                                  return Visibility(
                                    visible: !_isVisible,
                                    child: Icon (
                                      MdiIcons.checkboxMarkedCircle,
                                      color: iconColor,
                                    ),
                                  );
                                }
                              }()),
                            ],
                          ),
                        ),
                        (() {
                          if (batchCStreamTwoNotifier.batchCStreamTwoList[index].twitter.toString().isNotEmpty) {
                            if (!batchCStreamTwoNotifier.batchCStreamTwoList[index].twitter.toString().contains("@")) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    batchCStreamTwoNotifier.batchCStreamTwoList[index].twitter == batchCStreamTwoNotifier.batchCStreamTwoList[index].twitter ? '@'+batchCStreamTwoNotifier.batchCStreamTwoList[index].twitter : batchCStreamTwoNotifier.batchCStreamTwoList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              );
                            }
                            else {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    batchCStreamTwoNotifier.batchCStreamTwoList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              );
                            }
                          } else {
                            return Visibility(
                              visible: !_isVisible,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    batchCStreamTwoNotifier.batchCStreamTwoList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: textColorTwo,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              ),
                            );
                          }
                        }()),
                      ],
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),

        ),
          backgroundColor: dialogBackgroundColor,
        title: Text(exitAppTitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        content: Text(exitAppSubtitle,
          style: TextStyle(
              color: textColor
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text(exitAppYes,
              style: TextStyle(
                  color: textColor
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToBatchCStreamTwoDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BatchCStreamTwoDetailsPage()));
  }

  Future navigateToAboutAppDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppDetails()));
  }
  Future navigateToAcronymsMeaningsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AcronymsMeanings()));
  }
  Future navigateToAboutCDS(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutCDS()));
  }
  Future navigateToAboutNYSCFederalState(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutNYSCFederalState()));
  }
  Future navigateToWhoWeArePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WhoWeAre()));
  }

  @override
  void initState() {
    BatchCStreamTwoNotifier batchCStreamTwoNotifier = Provider.of<BatchCStreamTwoNotifier>(context, listen: false);
    getBatchCStreamTwo(batchCStreamTwoNotifier);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    BatchCStreamTwoNotifier batchCStreamTwoNotifier = Provider.of<BatchCStreamTwoNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: backgroundColor,

          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(MdiIcons.formatFloatLeft, color: iconColor),
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: modalBackgroundColor,
                            context: context,
                            builder: (context) => Container(
                              height: 300,
                              decoration: BoxDecoration(
                                color: modalColor,
                                borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
                              ),
                              child: Material(
                                color: materialBackgroundColor,
                                child: InkWell(
                                  splashColor: splashColor,
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading: new Icon(MdiIcons.atom,
                                            color: iconColor),
                                          title: new Text(whoWeAre,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),),
                                          onTap: () {
                                            navigateToWhoWeArePage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessQueen,
                                          color: iconColor),
                                        title: new Text(aboutCDS,
                                          style: GoogleFonts.zillaSlab(
                                              color: textColor
                                          ),),
                                        onTap: () {
                                          navigateToAboutCDS(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessKing,
                                          color: iconColor),
                                        title: new Text(aboutNYSC,
                                          style: GoogleFonts.zillaSlab(
                                              color: textColor
                                          ),),
                                        onTap: () {
                                          navigateToAboutNYSCFederalState(context);
                                        },
                                      ),
                                      ListTile(
                                          leading: new Icon(MdiIcons.sortAlphabeticalAscending,
                                            color: iconColor),
                                          title: new Text(acronymMeanings,
                                            style: GoogleFonts.zillaSlab(
                                                color: textColor
                                            ),),
                                          onTap: () {
                                            navigateToAcronymsMeaningsPage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.opacity,
                                          color: iconColor),
                                        title: new Text(aboutApp,
                                          style: GoogleFonts.zillaSlab(
                                              color: textColor
                                          ),),
                                        onTap: () {
                                          navigateToAboutAppDetailsPage(context);
                                        },
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ));
                      },
                    ),
                    IconButton(
                      icon: Icon(MdiIcons.magnify, color: iconColor),
                      onPressed: batchCStreamTwoNotifier.batchCStreamTwoList == null
                          ? null
                          : (){
                        showSearch(
                          context: context,
                          delegate: MyBatchCStreamTwoSearch(all: batchCStreamTwoNotifier.batchCStreamTwoList),
                        );
                      },
                      tooltip: "Search",
                    ),
                  ],
                  backgroundColor: appBarBackgroundColor,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(thrownName,
                          style: GoogleFonts.amaticSC(
                              color: textColor,
                              fontSize: 26.0,
                              fontWeight: FontWeight.bold
                          )
                      ),
                      background: Image.asset(imgAsset,
                        alignment: Alignment(0, -0.5),
                        fit: BoxFit.cover
                        ,)
                  ),
                ),
              ];
            },
            body: Padding(
              padding: const EdgeInsets.only(left: 25, right: 10),
              child: Container(
                margin: new EdgeInsets.only( bottom: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10)
                ),
                child: ListView.builder(
                  itemBuilder: _buildProductItem,
                  itemCount: batchCStreamTwoNotifier.batchCStreamTwoList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
