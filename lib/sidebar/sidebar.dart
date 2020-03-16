import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:rxdart/rxdart.dart';
import '../bloc_navigation_bloc/navigation_bloc.dart';
import '../sidebar/menu_item.dart';

class SideBar extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _SideBarState();

}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar> {

  int _currentNAVSelected = 0;

  _onSelected(int index) {
    setState(() => _currentNAVSelected = index);
  }

  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;
  final bool isSidebarOpened = false;
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screeWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSidebarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSidebarOpenedAsync.data ? 0 : -screeWidth,
          right: isSidebarOpenedAsync.data ? 0 : screeWidth - 55,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Card(
                  elevation: 20,
                  margin: EdgeInsets.all(0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: [Color.fromRGBO(46, 137, 112, 1), Color.fromRGBO(46, 137, 112, 1)]
                        )
                    ),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 50,
                        ),
                        Stack(
                          children: <Widget>[
                            Opacity(
                              opacity: 0.7,
                              child: Container(
                                child: Material(
                                  color: Colors.transparent,
                                  child: InkWell(
                                    splashColor: Colors.greenAccent,
                                    onTap: () {},
                                    child: Padding(
                                      padding: const EdgeInsets.only(bottom: 20, top: 80),
                                      child: ListTile(
                                        title: Text(
                                          "FINANCIAL INCLUSION CDS",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 25,
                                              fontWeight: FontWeight.w800),
                                        ),
                                        subtitle: Text(
                                          "Obia/Akpor LG CDS GROUP",
                                          style: TextStyle(
                                            color: Color.fromRGBO(46, 137, 112, 1),
                                            fontWeight: FontWeight.w500,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                width: 400.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: new ExactAssetImage('assets/images/fin_inc_17.jpg'),
                                    fit: BoxFit.cover,
                                  ),
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [Colors.green, Colors.greenAccent.withAlpha(50)],
                                    stops: [0.3, 1],

                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromRGBO(46, 137, 112, 1),
                                      blurRadius: 12,
                                      offset: Offset(3, 12),
                                    )
                                  ],
                                  borderRadius: new BorderRadius.circular(10),
                                ),


                              ),
                            ),
                          ],
                        ),
                        Divider(
                          height: 30,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),
                        Material(
                          color: _currentNAVSelected == 0 ? Colors.greenAccent.withOpacity(0.3) : Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onSelected(0);
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyBatchBStreamOnePageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.accountGroup,
                              title: "Batch B Stream One Corpers",


                            ),
                          ),
                        ),
                        Material(
                          color: _currentNAVSelected == 1 ? Colors.greenAccent.withOpacity(0.3) : Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onSelected(1);
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyBatchBStreamTwoPageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.accountGroup,
                              title: "Batch B Stream Two Corpers",
                            ),
                          ),
                        ),
                        Material(
                          color: _currentNAVSelected == 2 ? Colors.greenAccent.withOpacity(0.3) : Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onSelected(2);
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyBatchCStreamOnePageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.accountGroup,
                              title: "Batch C Stream One Corpers",
                            ),
                          ),
                        ),
                        Material(
                          color: _currentNAVSelected == 3 ? Colors.greenAccent.withOpacity(0.3) : Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onSelected(3);
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyBatchCStreamTwoPageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.accountGroup,
                              title: "Batch C Stream Two Corpers",
                            ),
                          ),
                        ),
                        Material(
                          color: _currentNAVSelected == 4 ? Colors.greenAccent.withOpacity(0.3) : Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onSelected(4);
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyBatchAStreamOnePageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.accountGroup,
                              title: "Batch A Stream One Corpers",
                            ),
                          ),
                        ),
                        Material(
                          color: _currentNAVSelected == 5 ? Colors.greenAccent.withOpacity(0.3) : Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onSelected(5);
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyExecutivePageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.teach,
                              title: "Executive CDS Corpers",
                            ),
                          ),
                        ),
                        Material(
                          color: _currentNAVSelected == 6 ? Colors.greenAccent.withOpacity(0.3) : Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onSelected(6);
                              onIconPressed();
                              BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyLGOfficialsPageClickedEvent);
                            },
                            child: MenuItem(
                              icon: MdiIcons.pillar,
                              title: "Local Government Officials",
                            ),
                          ),
                        ),
                        Divider(
                          height: 64,
                          thickness: 0.5,
                          color: Colors.white.withOpacity(0.3),
                          indent: 32,
                          endIndent: 32,
                        ),
                        Material(
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor: Colors.white,
                            onTap: () {
                              _onWillPop();
                              onIconPressed();
                            },
                            child: MenuItem(
                              icon: MdiIcons.logout,
                              title: "Exit from App",
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-0.4, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Card(
                      elevation: 20,
                      margin: EdgeInsets.all(0),
                      child: Container(
                        width: 35,
                        height: 110,
                        color: Color.fromRGBO(46, 137, 112, 1),
                        alignment: Alignment.centerLeft,
                        child: AnimatedIcon(
                          progress: _animationController.view,
                          icon: AnimatedIcons.menu_close,
                          color: Colors.white70,
                          size: 25,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
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

}

class CustomPILLCardShapePainter extends CustomPainter {

  final double radius;
  final Color startColor;
  final Color endColor;

  CustomPILLCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var david = Paint();
    david.shader = ui.Gradient.linear(
        Offset(0,0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),endColor
    ]);

    var jesus = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(jesus, david);

  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {

    return true;
  }


}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.transparent;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {

    return true;
  }

}