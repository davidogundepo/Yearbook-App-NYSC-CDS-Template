import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fnancialinclusioncds2020/notifier/batch_b_stream_one_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';


String callFIRST = "tel:+234";
String smsFIRST = "sms:+234";
String mailFIRST = "mailto:";
String mailSECOND = "?subject=Hello ";
String urlTwitter = "https://twitter.com/";
String urlFacebook = "https://fb.com/olowote.oluwaseun";
String urlInstagram = "https://www.instagram.com/";
String urlLinkedIn = "https://www.linkedin.com/";

BatchBStreamOneNotifier batchBStreamOneNotifier;

Map<int, Widget> userBIO;

var _academic_qualification;
var _alma_mater;
var _autobio;
var _bestmoment;
var _course_of_study;
var _d_o_b;
var _email;
var _facebook;
var _graduation_year;
var _hobbies;
var _instagram;
var _linkedin;
var _my_dropline;
var _name;
var _nickname;
var _philosophy;
var _phone;
var _ppa_assignment;
var _cds_executive;
var _cds_executive_position;
var _ppa_location;
var _ppa_name;
var _state_of_origin;
var _twitter;
var _whats_next;
var _where_you_live;
var _worst_moment;


class BatchBStreamOneDetailsPage extends StatefulWidget {
  @override
  _BatchBStreamOneDetailsPageState createState() => _BatchBStreamOneDetailsPageState();
}

class _BatchBStreamOneDetailsPageState extends State<BatchBStreamOneDetailsPage> {

  Future launchURL(String url) async{
    if(await canLaunch(url)) {
      await launch(url);
    } else{
      print("Can't Launch $url");
    }
  }
  
  
  @override
  Widget build(BuildContext context) {


    batchBStreamOneNotifier = Provider.of<BatchBStreamOneNotifier>(context, listen: true);


    return Scaffold(
      backgroundColor: Color.fromRGBO(86, 158, 128, 1),
      appBar: AppBar(
        centerTitle: true,
        title: Text(batchBStreamOneNotifier.currentBatchBStreamOne.nickname,
          style: GoogleFonts.sanchez(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w400
          ),),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        elevation: 10,
        backgroundColor: Color.fromRGBO(46, 137, 112, 1),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white,),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Tooltip(
                child: Container(
                  width: 400,
                  height: 520,
                  child: Card(
                    elevation: 5,
                    margin: EdgeInsets.all(10),
                    semanticContainer: true,
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: CachedNetworkImage(
                      imageUrl: batchBStreamOneNotifier.currentBatchBStreamOne.image,
                      fit: BoxFit.cover,
                      placeholder: (context, url) => CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(MdiIcons.alertRhombus),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                message: batchBStreamOneNotifier.currentBatchBStreamOne.name
            ),
            Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Color.fromRGBO(46, 137, 112, 1).withOpacity(0.20),
                onTap: () {},
                child: Card(
                  elevation: 4,
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Color.fromRGBO(46, 137, 112, 1).withOpacity(0.70), width: 4.0, style: BorderStyle.solid
                    ),
                  ),

                  margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0,
                        top: 16.0,
                        right: 16.0,
                        bottom: 16.0),

                    child: Text(batchBStreamOneNotifier.currentBatchBStreamOne.name.toUpperCase(),
                      style: GoogleFonts.blinker(
                          color: Color.fromRGBO(46, 137, 112, 1),
                          fontSize: 30,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 5,
              color: Colors.white,
              margin: EdgeInsets.all(10),
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),

              child: Padding(
                padding: const EdgeInsets.only(top: 20, bottom: 20, left: 8.0, right: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 35),
                      child: CupertinoSlidingSegmentedControl<int>(
                        padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
                        thumbColor: Colors.white,
                        backgroundColor: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),

                        children: {
                          0: Text('Reach',
                            style: GoogleFonts.sacramento(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 25,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.w400
                            ),
                          ),
                          1: Text('AutoBio',
                            style: GoogleFonts.sacramento(
                              color: Color.fromRGBO(46, 137, 112, 1),
                              fontSize: 25,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400,

                            ),
                          ),
                        },
                        onValueChanged: (int val) {
                          setState(() {
                            sharedValue = val;

                          });
                        },
                        groupValue: sharedValue,
                      ),
                    ),
                    userBIO[sharedValue],
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  int sharedValue = 0;


  initState(){
    BatchBStreamOneNotifier batchBStreamOneNotifier = Provider.of<BatchBStreamOneNotifier>(context, listen: false);

    _autobio = batchBStreamOneNotifier.currentBatchBStreamOne.autobio;
    _bestmoment = batchBStreamOneNotifier.currentBatchBStreamOne.bestmoment;
    _course_of_study = batchBStreamOneNotifier.currentBatchBStreamOne.course_of_study;
    _graduation_year = batchBStreamOneNotifier.currentBatchBStreamOne.graduation_year;
    _linkedin = batchBStreamOneNotifier.currentBatchBStreamOne.linkedin;
    _ppa_assignment = batchBStreamOneNotifier.currentBatchBStreamOne.ppa_assignment;
    _cds_executive = batchBStreamOneNotifier.currentBatchBStreamOne.cds_executive;
    _cds_executive_position = batchBStreamOneNotifier.currentBatchBStreamOne.cds_executive_position;
    _ppa_location = batchBStreamOneNotifier.currentBatchBStreamOne.ppa_location;
    _ppa_name = batchBStreamOneNotifier.currentBatchBStreamOne.ppa_name;
    _state_of_origin = batchBStreamOneNotifier.currentBatchBStreamOne.state_of_origin;
    _whats_next = batchBStreamOneNotifier.currentBatchBStreamOne.whats_next;
    _where_you_live = batchBStreamOneNotifier.currentBatchBStreamOne.where_you_live;
    _bestmoment = batchBStreamOneNotifier.currentBatchBStreamOne.bestmoment;
    _d_o_b = batchBStreamOneNotifier.currentBatchBStreamOne.d_o_b;
    _academic_qualification = batchBStreamOneNotifier.currentBatchBStreamOne.academic_qualification;
    _alma_mater = batchBStreamOneNotifier.currentBatchBStreamOne.alma_mater;
    _email = batchBStreamOneNotifier.currentBatchBStreamOne.email;
    _facebook = batchBStreamOneNotifier.currentBatchBStreamOne.facebook;
    _hobbies = batchBStreamOneNotifier.currentBatchBStreamOne.hobbies;
    _instagram = batchBStreamOneNotifier.currentBatchBStreamOne.instagram;
    _my_dropline = batchBStreamOneNotifier.currentBatchBStreamOne.my_dropline;
    _name = batchBStreamOneNotifier.currentBatchBStreamOne.name;
    _nickname = batchBStreamOneNotifier.currentBatchBStreamOne.nickname;
    _philosophy = batchBStreamOneNotifier.currentBatchBStreamOne.philosophy;
    _phone = batchBStreamOneNotifier.currentBatchBStreamOne.phone;
    _twitter = batchBStreamOneNotifier.currentBatchBStreamOne.twitter;
    _worst_moment = batchBStreamOneNotifier.currentBatchBStreamOne.worst_moment;


    userBIO = <int, Widget>{

      0: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                splashColor: Colors.white,
                child: RaisedButton.icon(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 2,
                  color: Color.fromRGBO(46, 137, 112, 1),
                  icon: new Icon(MdiIcons.dialpad, color: Colors.white,),
                  label: Text('Call',
                      style: GoogleFonts.abel(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300
                      )
                  ),
                  onPressed: () {
                    launchURL(callFIRST+_phone);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                splashColor: Colors.white,
                child: RaisedButton.icon(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 2,
                  color: Color.fromRGBO(46, 137, 112, 1),
                  icon: new Icon(MdiIcons.message, color: Colors.white,),
                  label: Text('Send a Message',
                      style: GoogleFonts.abel(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300
                      )
                  ),
                  onPressed: () {
                    launchURL(smsFIRST+_phone);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                splashColor: Colors.white,
                child: RaisedButton.icon(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 2,
                  color: Color.fromRGBO(46, 137, 112, 1),
                  icon: new Icon(MdiIcons.gmail, color: Colors.white,),
                  label: Text("Send an Email",
                      style: GoogleFonts.abel(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300
                      )
                  ),
                  onPressed: () {
                    launchURL(mailFIRST+_email+mailSECOND+_name);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                splashColor: Colors.white,
                child: RaisedButton.icon(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 2,
                  color: Color.fromRGBO(46, 137, 112, 1),
                  icon: new Icon(MdiIcons.twitterCircle, color: Colors.white,),
                  label: Text('My Twitter',
                      style: GoogleFonts.abel(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300
                      )
                  ),
                  onPressed: () {
                    launchURL(urlTwitter+_twitter);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                splashColor: Colors.white,
                child: RaisedButton.icon(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 2,
                  color: Color.fromRGBO(46, 137, 112, 1),
                  icon: new Icon(MdiIcons.instagram, color: Colors.white,),
                  label: Text('My Instagram',
                      style: GoogleFonts.abel(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300
                      )
                  ),
                  onPressed: () {
                    launchURL(urlInstagram+_instagram);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                splashColor: Colors.white,
                child: RaisedButton.icon(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 2,
                  color: Color.fromRGBO(114, 78, 147, 1),
                  icon: new Icon(MdiIcons.linkedinBox, color: Colors.white,),
                  label: Text('My LinkedIn',
                      style: GoogleFonts.abel(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300
                      )
                  ),
                  onPressed: () {
                    launchURL(urlLinkedIn+_linkedin);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: InkWell(
                splashColor: Colors.white,
                child: RaisedButton.icon(
                  shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  elevation: 2,
                  color: Color.fromRGBO(46, 137, 112, 1),
                  icon: new Icon(MdiIcons.facebook, color: Colors.white,),
                  label: Text('My Facebook',
                    style: GoogleFonts.abel(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  onPressed: () {
                    launchURL(urlFacebook+_facebook);
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      1: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                splashColor: Color.fromRGBO(46, 137, 112, 1),
                onTap: () {},
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                  child: Text.rich(
                    TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Autobiography\n',
                            style:  GoogleFonts.aBeeZee(
                              color: Color.fromRGBO(46, 137, 112, 1),
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        TextSpan(
                            text: ' '+_autobio,
                            style: GoogleFonts.trykker(
                              color: Color.fromRGBO(46, 137, 112, 1),
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

            decoration: BoxDecoration(
                color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                borderRadius: new BorderRadius.circular(10)
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'My Nickname\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_nickname,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Best Moment in NYSC\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_bestmoment,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Worst Moment in NYSC\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_worst_moment,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'PPA Name\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_ppa_name,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'PPA Location\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_ppa_location,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'PPA Assignment\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_ppa_assignment,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Alma Mater\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_alma_mater,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Course of Study\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_course_of_study,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Academic Qualification\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_academic_qualification,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Graduation Year\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_graduation_year,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'CDS Executive\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_cds_executive,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'CDS Executive Position\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_cds_executive_position,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "What's next after NYSC\n",
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_whats_next,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "Where I live\n",
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_where_you_live,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: "State of Origin\n",
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_state_of_origin,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Date of Birth\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_d_o_b,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Hobbies\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_hobbies,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Philosophy about Life\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_philosophy,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Container(
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(46, 137, 112, 1),
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                    child: Text.rich(
                      TextSpan(
                        children: <TextSpan>[
                          TextSpan(
                              text: 'Dropline to My Junior Hallel Colleagues\n',
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_my_dropline,
                              style: GoogleFonts.trykker(
                                color: Color.fromRGBO(46, 137, 112, 1),
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

              decoration: BoxDecoration(
                  color: Color.fromRGBO(46, 137, 112, 1).withAlpha(50),
                  borderRadius: new BorderRadius.circular(10)
              ),
            ),
          ),
        ],
      ),
    };
    super.initState();
  }
  
  
}
