import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../api/batch_b_stream_one_api.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../about_menu_details_pages/about_app.dart';
import '../about_menu_details_pages/about_nysc_rivers.dart';
import '../about_menu_details_pages/acronyms_meanings.dart';
import '../about_menu_details_pages/who_we_are.dart';
import '../details_pages/batch_b_stream_one_details_page.dart';
import '../notifier/batch_b_stream_one_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';

class MyBatchBStreamOnePage extends StatefulWidget with NavigationStates {

  MyBatchBStreamOnePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyBatchBStreamOnePageState createState() => _MyBatchBStreamOnePageState();
}

class _MyBatchBStreamOnePageState extends State<MyBatchBStreamOnePage> {

  Widget _buildProductItem(BuildContext context, int index) {
    BatchBStreamOneNotifier batchBStreamOneNotifier = Provider.of<BatchBStreamOneNotifier>(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),color: Colors.black.withAlpha(50),
        ),

        child: Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Colors.pinkAccent,
            onTap: () {
              batchBStreamOneNotifier.currentBatchBStreamOne = batchBStreamOneNotifier.batchBStreamOneList[index];
               navigateToBatchBStreamOneDetailsPage(context);
            },

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomLeft: Radius.circular(10)),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              batchBStreamOneNotifier.batchBStreamOneList[index].image
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
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                            batchBStreamOneNotifier.batchBStreamOneList[index].name,
                            style: GoogleFonts.tenorSans(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600
                            )
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                            batchBStreamOneNotifier.batchBStreamOneList[index].twitter == batchBStreamOneNotifier.batchBStreamOneList[index].twitter ? '@'+batchBStreamOneNotifier.batchBStreamOneList[index].twitter : batchBStreamOneNotifier.batchBStreamOneList[index].twitter,
                            style: GoogleFonts.varela(
                                color: Colors.white70,
                                fontStyle: FontStyle.italic
                            )
                        ),
                      ),
                    ],
                  ),
                )

              ],
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
        title: Text('Come on!'),
        content: Text('Do you really really want to?'),
        actions: <Widget>[
          FlatButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('Oh No'),
          ),
          FlatButton(
            onPressed: () => exit(0),
            /*Navigator.of(context).pop(true)*/
            child: Text('I Have To'),
          ),
        ],
      ),
    ) ??
        false;
  }

  Future navigateToBatchBStreamOneDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => BatchBStreamOneDetailsPage()));
  }

  Future navigateToAboutAppDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutAppDetails()));
  }
  Future navigateToAcronymsMeaningsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AcronymsMeanings()));
  }
  Future navigateToAboutNYSCRiversState(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => AboutNYSCRiversState()));
  }
  Future navigateToWhoWeArePage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => WhoWeAre()));
  }

  @override
  void initState() {
    BatchBStreamOneNotifier batchBStreamOneNotifier = Provider.of<BatchBStreamOneNotifier>(context, listen: false);
    getBatchBStreamOne(batchBStreamOneNotifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    BatchBStreamOneNotifier batchBStreamOneNotifier = Provider.of<BatchBStreamOneNotifier>(context);

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        body: Container(
          color: Color.fromRGBO(222, 93, 131, 1),

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
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.pink[300],
                                borderRadius: BorderRadius.all(Radius.circular(15)),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  splashColor: Colors.pinkAccent,
                                  child: Wrap(
                                    children: <Widget>[
                                      ListTile(
                                          leading: new Icon(
                                              MdiIcons.atom,
                                              color: Colors.white),
                                          title: new Text(
                                            'Who We Are',
                                            style: GoogleFonts.zillaSlab(
                                              color: Colors.white,
                                            ),
                                          ),
                                          onTap: () {
                                            navigateToWhoWeArePage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.chessQueen, color: Colors.white),
                                        title: new Text('About NYSC Rivers State',
                                          style: GoogleFonts.zillaSlab(
                                            color: Colors.white,
                                          ),),
                                        onTap: () {
                                          navigateToBatchBStreamOneDetailsPage(context);
                                        },
                                      ),
                                      ListTile(
                                          leading: new Icon(MdiIcons.sortAlphabeticalAscending, color: Colors.white),
                                          title: new Text('Acronym Meanings',
                                            style: GoogleFonts.zillaSlab(
                                              color: Colors.white,
                                            ),),
                                          onTap: () {
                                            navigateToAcronymsMeaningsPage(context);
                                          }
                                      ),
                                      ListTile(
                                        leading: new Icon(MdiIcons.opacity, color: Colors.white),
                                        title: new Text('About App',
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
                  backgroundColor: Colors.pink[300],
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    title: Text("Batch B Stream One Corpers",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.amaticSC(
                            color: Colors.white,
                            fontSize: 26.0,
                            fontWeight: FontWeight.bold
                        )
                    ),
                    background: Image.asset('assets/images/fin_inc_3.jpg',
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
                  itemCount: batchBStreamOneNotifier.batchBStreamOneList.length,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
