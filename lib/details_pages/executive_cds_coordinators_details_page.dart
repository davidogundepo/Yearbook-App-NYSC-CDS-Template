import 'package:cached_network_image/cached_network_image.dart';
import 'package:confetti/confetti.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fnancialinclusioncds2020/notifier/executive_cds_coordinators_notifier.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';



String nyscBatch = "Nysc Batch\n";
String positionEnforced = "Position Enforced\n";


ExecutiveCDSCoordinatorsNotifier executiveCDSCoordinatorsNotifier;

class ExecutiveCDSCoordinatorsDetailsPage extends StatefulWidget {

  @override
  _ExecutiveCDSCoordinatorsDetailsPageState createState() => _ExecutiveCDSCoordinatorsDetailsPageState();
}

class _ExecutiveCDSCoordinatorsDetailsPageState extends State<ExecutiveCDSCoordinatorsDetailsPage> {
  ConfettiController _confettiController;

  @override
  Widget build(BuildContext context) {

    executiveCDSCoordinatorsNotifier = Provider.of<ExecutiveCDSCoordinatorsNotifier>(context, listen: true);

    return ConfettiWidget(
      confettiController: _confettiController,
      blastDirectionality: BlastDirectionality.explosive,
      shouldLoop: false,
      colors: [
        Colors.green,
        Colors.blue,
        Colors.pink,
        Colors.orange,
        Colors.purple,
        Colors.brown,
        Colors.white,
        Colors.blueGrey,
        Colors.redAccent,
        Colors.teal,
        Colors.indigoAccent,
        Colors.cyan,
      ],
      child: Scaffold(
        backgroundColor: Color.fromRGBO(123, 176, 182, 1),
        appBar: AppBar(
          centerTitle: true,
//        title: Text(classPrefectsNotifier.currentClassPrefects.name),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(30),
            ),
          ),

          elevation: 10,
          backgroundColor: Color.fromRGBO(123, 166, 182, 1),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios,
              color: Colors.blueGrey,),
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
                        imageUrl: executiveCDSCoordinatorsNotifier.currentExecutiveCDSCoordinators.image,
                        fit: BoxFit.cover,
                        alignment: Alignment(0, -1),
                        placeholder: (context, imageURL) =>
                        new CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                        new Icon(MdiIcons.alertRhombus),

                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                  ),
                  message: executiveCDSCoordinatorsNotifier.currentExecutiveCDSCoordinators.name
              ),
              Material(
                color: Colors.transparent,
                child: InkWell(
                  splashColor: Color.fromRGBO(123, 166, 182, 1).withOpacity(0.20),
                  onTap: () {},
                  child: Card(
                    color: Colors.blueGrey,
                    elevation: 4,
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Color.fromRGBO(123, 166, 182, 1), width: 4.0, style: BorderStyle.solid
                      ),
                    ),

                    margin: EdgeInsets.fromLTRB(16, 16, 16, 16),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 16.0,
                          top: 16.0,
                          right: 16.0,
                          bottom: 16.0),

                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(executiveCDSCoordinatorsNotifier.currentExecutiveCDSCoordinators.name.toUpperCase(),
                            style: GoogleFonts.blinker(
                                color: Colors.white,
                                fontSize: 30,
                                fontWeight: FontWeight.w500
                            ),
                          ),
                          SizedBox(width: 10),
                          Icon (
                            MdiIcons.checkboxMarkedCircle,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Card(
                elevation: 5,
                color: Colors.blueGrey,
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
                      Container(
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                              child: Text.rich(
                                TextSpan(
                                  children: <TextSpan>[
                                    TextSpan(
                                        text: nyscBatch,
                                        style: GoogleFonts.aBeeZee(
                                          color: Colors.white,
                                          fontSize: 19,
                                          fontWeight: FontWeight.bold,
                                        )
                                    ),
                                    TextSpan(
                                        text: ' '+executiveCDSCoordinatorsNotifier.currentExecutiveCDSCoordinators.nyscBatch,
                                        style: GoogleFonts.trykker(
                                          color: Colors.white,
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
                            color: Color.fromRGBO(123, 166, 182, 1).withAlpha(120),
                            borderRadius: new BorderRadius.circular(10)
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: Container(
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              splashColor: Colors.white,
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 15, top: 15, left: 25),
                                child: Text.rich(
                                  TextSpan(
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: positionEnforced,
                                          style: GoogleFonts.aBeeZee(
                                            color: Colors.white,
                                            fontSize: 19,
                                            fontWeight: FontWeight.bold,
                                          )
                                      ),
                                      TextSpan(
                                          text: ' '+executiveCDSCoordinatorsNotifier.currentExecutiveCDSCoordinators.positionEnforced,
                                          style: GoogleFonts.trykker(
                                            color: Colors.white,
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
                              color: Color.fromRGBO(123, 166, 182, 1).withAlpha(120),
                              borderRadius: new BorderRadius.circular(10)
                          ),
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
    );

  }

  @override
  void initState() {
    _confettiController = ConfettiController(duration: const Duration(seconds: 35));
    _confettiController.play();
    super.initState();
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

}
