import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fnancialinclusioncds2020/notifier/batch_b_stream_two_notifier.dart';
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


String cdsName = "Financial Inclusion CDS";

String reachDetails = "Reach";
String autoBioDetails = "AutoBio";

String callButton = "Call";
String messageButton = "Send a Message";
String emailButton = "Send an Email";
String twitterButton = "My Twitter";
String instagramButton = "My Instagram";
String linkedInButton = "My LinkedIn";
String facebookButton = "My Facebook";

String autobiographyTitle = "Autobiography\n";
String nicknameTitle = "My Nickname\n";
String bestMomentTitle = "Best Moment in NYSC\n";
String worstMomentTitle = "Worst Moment in NYSC\n";
String ppaNameTitle = "PPA Name\n";
String ppaLocationTitle = "PPA Location\n";
String ppaAssignmentTitle = "PPA Assignment\n";
String almaMaterTitle = "Alma Mater\n";
String courseOfStudyTitle = "Course of Study\n";
String academicQualificationTitle = "Academic Qualification\n";
String graduationYearTitle = "Graduation Year\n";
String cdsExecutiveTitle = "CDS Executive\n";
String cdsExecutivePositionTitle = "CDS Executive Position\n";
String whatsNextAfterTitle = "What's next after NYSC\n";
String whereILiveTitle = "Where I live\n";
String stateOfOriginTitle = "State of Origin\n";
String dobTitle = "Date of Birth\n";
String hobbiesTitle = "Hobbies\n";
String philosophyTitle = "Philosophy about Life\n";
String droplineTitle = "Dropline to My Junior $cdsName Colleagues\n";


BatchBStreamTwoNotifier batchBStreamTwoNotifier;

Map<int, Widget> userBIO;

var _academicQualification;
var _almaMater;
var _autoBio;
var _bestMoment;
var _courseOfStudy;
var _dob;
var _email;
var _facebook;
var _graduationYear;
var _hobbies;
var _instagram;
var _linkedIn;
var _myDropline;
var _name;
var _nickname;
var _philosophy;
var _phone;
var _ppaAssignment;
var _cdsExecutive;
var _cdsExecutivePosition;
var _ppaLocation;
var _ppaName;
var _stateOfOrigin;
var _twitter;
var _whatsNext;
var _whereYouLive;
var _worstMoment;


class BatchBStreamTwoDetailsPage extends StatefulWidget {
  @override
  _BatchBStreamTwoDetailsPageState createState() => _BatchBStreamTwoDetailsPageState();
}

class _BatchBStreamTwoDetailsPageState extends State<BatchBStreamTwoDetailsPage> {

  Future launchURL(String url) async{
    if(await canLaunch(url)) {
      await launch(url);
    } else{
      print("Can't Launch $url");
    }
  }
  
  
  @override
  Widget build(BuildContext context) { 
    
    batchBStreamTwoNotifier = Provider.of<BatchBStreamTwoNotifier>(context, listen: true);

  return Scaffold(
    backgroundColor: Color.fromRGBO(86, 158, 128, 1),
    appBar: AppBar(
      centerTitle: true,
      title: Text(batchBStreamTwoNotifier.currentBatchBStreamTwo.nickname,
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
                    imageUrl: batchBStreamTwoNotifier.currentBatchBStreamTwo.image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(MdiIcons.alertRhombus),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              message: batchBStreamTwoNotifier.currentBatchBStreamTwo.name
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

                  child: Text(batchBStreamTwoNotifier.currentBatchBStreamTwo.name.toUpperCase(),
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
                        0: Text(reachDetails,
                          style: GoogleFonts.sacramento(
                              color: Color.fromRGBO(46, 137, 112, 1),
                              fontSize: 25,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                        1: Text(autoBioDetails,
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
    BatchBStreamTwoNotifier batchBStreamTwoNotifier = Provider.of<BatchBStreamTwoNotifier>(context, listen: false);

    _autoBio = batchBStreamTwoNotifier.currentBatchBStreamTwo.autoBio;
    _bestMoment = batchBStreamTwoNotifier.currentBatchBStreamTwo.bestMoment;
    _courseOfStudy = batchBStreamTwoNotifier.currentBatchBStreamTwo.courseOfStudy;
    _graduationYear = batchBStreamTwoNotifier.currentBatchBStreamTwo.graduationYear;
    _linkedIn = batchBStreamTwoNotifier.currentBatchBStreamTwo.linkedIn;
    _ppaAssignment = batchBStreamTwoNotifier.currentBatchBStreamTwo.ppaAssignment;
    _cdsExecutive = batchBStreamTwoNotifier.currentBatchBStreamTwo.cdsExecutive;
    _cdsExecutivePosition = batchBStreamTwoNotifier.currentBatchBStreamTwo.cdsExecutivePosition;
    _ppaLocation = batchBStreamTwoNotifier.currentBatchBStreamTwo.ppaLocation;
    _ppaName = batchBStreamTwoNotifier.currentBatchBStreamTwo.ppaName;
    _stateOfOrigin = batchBStreamTwoNotifier.currentBatchBStreamTwo.stateOfOrigin;
    _whatsNext = batchBStreamTwoNotifier.currentBatchBStreamTwo.whatsNext;
    _whereYouLive = batchBStreamTwoNotifier.currentBatchBStreamTwo.whereYouLive;
    _bestMoment = batchBStreamTwoNotifier.currentBatchBStreamTwo.bestMoment;
    _dob = batchBStreamTwoNotifier.currentBatchBStreamTwo.dob;
    _academicQualification = batchBStreamTwoNotifier.currentBatchBStreamTwo.academicQualification;
    _almaMater = batchBStreamTwoNotifier.currentBatchBStreamTwo.almaMater;
    _email = batchBStreamTwoNotifier.currentBatchBStreamTwo.email;
    _facebook = batchBStreamTwoNotifier.currentBatchBStreamTwo.facebook;
    _hobbies = batchBStreamTwoNotifier.currentBatchBStreamTwo.hobbies;
    _instagram = batchBStreamTwoNotifier.currentBatchBStreamTwo.instagram;
    _myDropline = batchBStreamTwoNotifier.currentBatchBStreamTwo.myDropline;
    _name = batchBStreamTwoNotifier.currentBatchBStreamTwo.name;
    _nickname = batchBStreamTwoNotifier.currentBatchBStreamTwo.nickname;
    _philosophy = batchBStreamTwoNotifier.currentBatchBStreamTwo.philosophy;
    _phone = batchBStreamTwoNotifier.currentBatchBStreamTwo.phone;
    _twitter = batchBStreamTwoNotifier.currentBatchBStreamTwo.twitter;
    _worstMoment = batchBStreamTwoNotifier.currentBatchBStreamTwo.worstMoment;


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
                    launchURL(urlLinkedIn+_linkedIn);
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
                            text: autobiographyTitle,
                            style:  GoogleFonts.aBeeZee(
                              color: Color.fromRGBO(46, 137, 112, 1),
                              fontSize: 19,
                              fontWeight: FontWeight.bold,
                            )
                        ),
                        TextSpan(
                            text: ' '+_autoBio,
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
                              text: nicknameTitle,
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
                              text: bestMomentTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_bestMoment,
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
                              text: worstMomentTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_worstMoment,
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
                              text: ppaNameTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_ppaName,
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
                              text: ppaLocationTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_ppaLocation,
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
                              text: ppaAssignmentTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_ppaAssignment,
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
                              text: almaMaterTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_almaMater,
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
                              text: courseOfStudyTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_courseOfStudy,
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
                              text: academicQualificationTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_academicQualification,
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
                              text: graduationYearTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_graduationYear,
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
                              text: cdsExecutiveTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_cdsExecutive,
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
                              text: cdsExecutivePositionTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_cdsExecutivePosition,
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
                              text: whatsNextAfterTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_whatsNext,
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
                              text: whereILiveTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_whereYouLive,
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
                              text: stateOfOriginTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_stateOfOrigin,
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
                              text: dobTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_dob,
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
                              text: hobbiesTitle,
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
                              text: philosophyTitle,
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
                              text: droplineTitle,
                              style:  GoogleFonts.aBeeZee(
                                color: Color.fromRGBO(46, 137, 112, 1),
                                fontSize: 19,
                                fontWeight: FontWeight.bold,
                              )
                          ),
                          TextSpan(
                              text: ' '+_myDropline,
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
