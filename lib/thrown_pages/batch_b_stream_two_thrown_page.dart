import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fnancialinclusioncds2020/about_menu_details_pages/about_app.dart';
import 'package:fnancialinclusioncds2020/about_menu_details_pages/about_cds.dart';
import 'package:fnancialinclusioncds2020/about_menu_details_pages/about_nysc_federal.dart';
import 'package:fnancialinclusioncds2020/about_menu_details_pages/acronyms_meanings.dart';
import 'package:fnancialinclusioncds2020/about_menu_details_pages/who_we_are.dart';
import 'package:fnancialinclusioncds2020/api/batch_b_stream_two_api.dart';
import 'package:fnancialinclusioncds2020/details_pages/batch_b_stream_two_details_page.dart';
import 'package:fnancialinclusioncds2020/notifier/batch_b_stream_two_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';


String nyscName = "NYSC";
String cdsName = "Financial Inclusion CDS Group";
String thrownName = "Batch B Stream Two Corpers";

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

String imgAsset = "assets/images/fin_inc_22.jpeg";


class MyBatchBStreamTwoPage extends StatefulWidget with NavigationStates {

  MyBatchBStreamTwoPage({Key key, this.title}) : super(key: key);

  final String title;


  @override
  _MyBatchBStreamTwoPageState createState() => _MyBatchBStreamTwoPageState();
}

class _MyBatchBStreamTwoPageState extends State<MyBatchBStreamTwoPage> {
  bool _isVisible = true;

  void showToast() {
    setState(() {
      _isVisible = !_isVisible;
    });
  }



  Widget _buildProductItem(BuildContext context, int index) {
    BatchBStreamTwoNotifier batchBStreamTwoNotifier = Provider.of<BatchBStreamTwoNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: Colors.black.withAlpha(50),
        ),

        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Color.fromRGBO(212, 78, 68, 1),
            onTap: () {
              batchBStreamTwoNotifier.currentBatchBStreamTwo = batchBStreamTwoNotifier.batchBStreamTwoList[index];
              navigateToBatchBStreamTwoDetailsPage(context);
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
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                        image: DecorationImage(
                            alignment: Alignment(0, -1),
                            image: CachedNetworkImageProvider(
                                batchBStreamTwoNotifier.batchBStreamTwoList[index].image
                            ),
                            fit: BoxFit.cover
                        )
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 60),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: Row(
                            children: <Widget>[
                              Text(
                                  batchBStreamTwoNotifier.batchBStreamTwoList[index].name,
                                  style: GoogleFonts.tenorSans(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600
                                  )
                              ),
                              (() {
                                if (batchBStreamTwoNotifier.batchBStreamTwoList[index].cdsExecutive == "Yes") {
                                  return
                                    Row(
                                      children: <Widget>[
                                        SizedBox(width: 10),
                                        Icon (
                                          MdiIcons.checkboxMarkedCircle,
                                          color: Colors.white,
                                        ),
                                      ],
                                    );
                                } else {
                                  return Visibility(
                                    visible: !_isVisible,
                                    child: Icon (
                                      MdiIcons.checkboxMarkedCircle,
                                      color: Colors.white,
                                    ),
                                  );
                                }
                              }()),
                            ],
                          ),
                        ),
                        (() {
                          if (batchBStreamTwoNotifier.batchBStreamTwoList[index].twitter.toString().isNotEmpty) {
                            if (!batchBStreamTwoNotifier.batchBStreamTwoList[index].twitter.toString().contains("@")) {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    batchBStreamTwoNotifier.batchBStreamTwoList[index].twitter == batchBStreamTwoNotifier.batchBStreamTwoList[index].twitter ? '@'+batchBStreamTwoNotifier.batchBStreamTwoList[index].twitter : batchBStreamTwoNotifier.batchBStreamTwoList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: Colors.white70,
                                        fontStyle: FontStyle.italic
                                    )
                                ),
                              );
                            }
                            else {
                              return Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                    batchBStreamTwoNotifier.batchBStreamTwoList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: Colors.white70,
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
                                    batchBStreamTwoNotifier.batchBStreamTwoList[index].twitter,
                                    style: GoogleFonts.varela(
                                        color: Colors.white70,
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
        backgroundColor: Color.fromRGBO(212, 88, 68, 1),
        title: Text(exitAppTitle,
          style: TextStyle(
              color: Colors.white
          ),
        ),
        content: Text(exitAppSubtitle,
          style: TextStyle(
              color: Colors.white
          ),
        ),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text(exitAppNo,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
          FlatButton(
            onPressed: () => exit(0),
            child: Text(exitAppYes,
              style: TextStyle(
                  color: Colors.white
              ),
            ),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToBatchBStreamTwoDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BatchBStreamTwoDetailsPage()));
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
    BatchBStreamTwoNotifier batchBStreamTwoNotifier = Provider.of<BatchBStreamTwoNotifier>(context, listen: false);
    getBatchBStreamTwo(batchBStreamTwoNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    BatchBStreamTwoNotifier batchBStreamTwoNotifier = Provider.of<BatchBStreamTwoNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: Color.fromRGBO(212, 88, 68, 1),

          child: NestedScrollView(
            headerSliverBuilder: (BuildContext context,
                bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  actions: <Widget>[
                    IconButton(
                      icon: Icon(MdiIcons.bandage, color: Colors.white,),
                      onPressed: () {
                        showModalBottomSheet(
                            backgroundColor: Colors.transparent,
                            context: context,
                            builder: (context) => Container(
                              height: 300,
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(212, 78, 68, 1),
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.black87,
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading: new Icon(MdiIcons.atom, color: Colors.white),
                                          title: new Text(whoWeAre,
                                            style: GoogleFonts.zillaSlab(
                                                color: Colors.white
                                            ),),
                                          onTap: () {
                                            navigateToWhoWeArePage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessQueen, color: Colors.white),
                                        title: new Text(aboutCDS,
                                          style: GoogleFonts.zillaSlab(
                                              color: Colors.white
                                          ),),
                                        onTap: () {
                                          navigateToAboutCDS(context);
                                        },
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessKing, color: Colors.white),
                                        title: new Text(aboutNYSC,
                                          style: GoogleFonts.zillaSlab(
                                              color: Colors.white
                                          ),),
                                        onTap: () {
                                          navigateToAboutNYSCFederalState(context);
                                        },
                                      ),
                                      ListTile(
                                          leading: new Icon(MdiIcons.sortAlphabeticalAscending, color: Colors.white),
                                          title: new Text(acronymMeanings,
                                            style: GoogleFonts.zillaSlab(
                                                color: Colors.white
                                            ),),
                                          onTap: () {
                                            navigateToAcronymsMeaningsPage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.opacity, color: Colors.white),
                                        title: new Text(aboutApp,
                                          style: GoogleFonts.zillaSlab(
                                            color: Colors.white,
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
                  ],
                  backgroundColor: Color.fromRGBO(212, 78, 68, 1),
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text(thrownName,
                        style: GoogleFonts.amaticSC(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    background: Image.asset(imgAsset,
                      fit: BoxFit.cover,
                    ),
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
                  itemCount: batchBStreamTwoNotifier.batchBStreamTwoList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );


  }
}
