

import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animation/hero_animation.dart';
void main()=>runApp(MaterialApp(home: MyApp(),));
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("Flutter Animation"),
      ),
      body: Center(
        child: MyHomePage(),
      ),
    );
  }
}
class MyHomePage extends StatefulWidget   {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController animationController;
  @override
  void initState(){
    super.initState();
    animationController=AnimationController(vsync: this,duration: Duration(seconds: 2));
    animation =Tween<double>(begin: 0.0,end: 1.0).animate(animationController);
    animation.addListener(() {
      setState(() {
      print(animation.value.toString());
    });
    });
    animation.addStatusListener((status) {
      if(status==AnimationStatus.completed){
       animationController.reverse();
      }
      else if(status==AnimationStatus.dismissed){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HeroAnimation(title: "App bar",)));
      }
    });
    animationController.forward();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Center(
     child: AnimatedLogo(
       animation: animation,
     ),
    );
  }
}
class AnimatedLogo extends AnimatedWidget{
  final Tween<double>sizeAnimation = Tween<double>(begin: 0.0,end: 500.0);
  AnimatedLogo({Key? key,  required Animation animation}) : super(key: key,listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Transform.scale(
      scale: sizeAnimation.evaluate(animation),
      child: FlutterLogo(),
    );
  }
}


