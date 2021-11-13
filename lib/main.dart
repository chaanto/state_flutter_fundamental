import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_flutter_fundamental/color_changer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChangeNotifierProvider<ColorChanger>(
        create: (context) => ColorChanger(),
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: Consumer<ColorChanger>(
                builder: (context, colorChanger, _) => Text(
                      'Provider State Management',
                      style: TextStyle(color: colorChanger.latestColor),
                    )),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Consumer<ColorChanger>(
                  builder: (context, colorChanger, _) => AnimatedContainer(
                      margin: EdgeInsets.all(5),
                      width: 100,
                      height: 100,
                      color: colorChanger.latestColor,
                      duration: Duration(milliseconds: 500)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(margin: EdgeInsets.all(5), child: Text("Amber")),
                    Consumer<ColorChanger>(
                        builder: (context, colorChanger, _) => Switch(
                            value: colorChanger.isLightBlue,
                            onChanged: (newValue) {
                              colorChanger.isLightBlue = newValue;
                            })),
                    Container(
                        margin: EdgeInsets.all(5), child: Text("Light Blue")),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
