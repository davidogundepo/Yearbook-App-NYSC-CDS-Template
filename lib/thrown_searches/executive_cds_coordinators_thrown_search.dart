
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../details_pages/executive_cds_coordinators_details_page.dart';
import '../notifier/executive_cds_coordinators_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';


Color backgroundColor = Color.fromRGBO(123, 176, 182, 1);
Color appBarTextColor = Colors.white;
Color appBarBackgroundColor = Color.fromRGBO(123, 166, 182, 1);
Color appBarIconColor = Colors.white;
Color modalColor = Color.fromRGBO(123, 166, 182, 1);
Color modalBackgroundColor = Colors.transparent;
Color materialBackgroundColor = Colors.transparent;
Color cardBackgroundColor = Colors.white;
Color splashColor = Color.fromRGBO(123, 166, 182, 1);
Color iconColor = Colors.white;
Color textColor = Colors.white;
Color textColorTwo = Colors.white70;
Color dialogBackgroundColor = Color.fromRGBO(123, 176, 182, 1);
Color borderColor = Colors.black;


class MyExecutiveCDSCoordinatorsSearch extends SearchDelegate {
  final List all;

  MyExecutiveCDSCoordinatorsSearch({@required this.all});

  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = ThemeData(
        primaryColor: appBarBackgroundColor,
        primaryIconTheme: IconThemeData(color: appBarIconColor),
        primaryColorBrightness: Brightness.light,
        textTheme: TextTheme(title: TextStyle(color: appBarTextColor)),
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: appBarTextColor)
        ),
        cursorColor: appBarTextColor
    );
    return theme;
  }

  Future navigateToExecutiveCDSCoordinatorsDetailsPage(context) async {
    Navigator.push(context, MaterialPageRoute(builder: (context) => ExecutiveCDSCoordinatorsDetailsPage()));
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(MdiIcons.closeCircleOutline),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    var query1;
    var query2 = " ";
    if (query.length != 0) {
      query1 = query.toLowerCase();
      query2 = query1[0].toUpperCase() + query1.substring(1);
    }

    var search = all.where((executiveCDSCoordinators) => executiveCDSCoordinators.name.contains(query2)).toList();

    return search == null
        ? _buildProgressIndicator()
        : _buildSearchList(search);
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    var query1;
    var query2 = "";
    if (query.length != 0) {
      query1 = query.toLowerCase();
      query2 = query1[0].toUpperCase() + query1.substring(1);
    }

    var search;

    if(query2.isNotEmpty){
      search =all.where((executiveCDSCoordinators) => executiveCDSCoordinators.name.contains(query2)).toList();


    }else{
      search = all;
    }

    return search == null
        ? _buildProgressIndicator()
        : _buildSearchList(search);
  }


  _buildSearchList(List search) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        color: backgroundColor,
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
          child: ListView.builder(
              shrinkWrap: true,
              itemCount: search == null ? 0 : search.length,
              itemBuilder: (BuildContext context, int position) {

                ExecutiveCDSCoordinatorsNotifier executiveCDSCoordinatorsNotifier = Provider.of<ExecutiveCDSCoordinatorsNotifier>(context);
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
                          executiveCDSCoordinatorsNotifier.currentExecutiveCDSCoordinators = search[position];
                          navigateToExecutiveCDSCoordinatorsDetailsPage(context);
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
                                            search[position].image
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
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                              search[position].name,
                                              style: GoogleFonts.tenorSans(
                                                  color: textColor,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w600
                                              )
                                          ),
                                          SizedBox(width: 10),
                                          Icon (
                                              MdiIcons.checkboxMarkedCircle,
                                              color: iconColor
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                          search[position].positionEnforced,
                                          style: GoogleFonts.tenorSans(
                                              color: textColor,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w300,
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
                  ),
                );
              }
          ),
        ),
      ),
    );
  }

  _buildProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
      ),
    );
  }

}