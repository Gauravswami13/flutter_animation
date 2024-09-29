

import 'package:flutter/material.dart';

class HeroAnimation extends StatefulWidget  {
   const HeroAnimation({Key? key,  required this.title}) : super(key: key);
  final String title;

  @override
  State<HeroAnimation> createState() => _HeroAnimationState();
}

class _HeroAnimationState extends State<HeroAnimation> {
  Widget greenRectangle(){
    return Container(
      width: 75,
      height: 75,
      color: Colors.green,
    );
  }
  Widget detailPageRectangle(){
    return Container(
      width: 75,
      height: 75,
      color: Colors.red,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text("Flutter Application"),
    ),
      body: buildDemoWidget(context),
    );
  }
  Widget buildDemoWidget(BuildContext context){
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.0,
          ),
          ListTile(
            leading: GestureDetector(
              child: Hero(tag: "Hero-rectangle",
                  child: greenRectangle()),
              onTap: ()=>gotoDetailsPage(context),
            ),
            title: Text("Tap on the green icon rectangle to analyse hero animation transition."),
          )
        ],
      ),
    );
  }
  void gotoDetailsPage(BuildContext context){
    Navigator.of(context).push(MaterialPageRoute(
      builder: (ctx)=>Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Hero(
                  tag: "Hero-rectangle",
                  child: detailPageRectangle()
              ),
              Text("This is place where you can see details about the icon tapped at previous page")
            ],
          ),
        ),
      )
    ));
  }
}

