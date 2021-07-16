import 'package:flutter/material.dart';

import 'clock.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool darkMode = false;

  onSwitchValChanged(bool newValue) {
    setState(() {
      darkMode = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: darkMode ? Colors.grey[850] : Colors.grey[300],
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 300.0,
                  height: 300.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: darkMode ? Colors.grey[850] : Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                        color: darkMode ? Colors.black : Colors.grey.shade600,
                        offset: const Offset(6.0, 6.0),
                        blurRadius: 10.0,
                        spreadRadius: 5.0,
                      ),
                      BoxShadow(
                        color: darkMode ? Colors.grey.shade800 : Colors.white,
                        offset: const Offset(-6.0, -6.0),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20),
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey[300],
                    boxShadow: [
                      BoxShadow(
                        color: darkMode ? Colors.grey.shade800 : Colors.white,
                        offset: const Offset(-6.0, -6.0),
                        blurRadius: 10.0,
                        spreadRadius: 2.0,
                      ),
                    ],
                    // different from neu-morphism
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: darkMode
                          ? [
                              Colors.black,
                              Colors.black45,
                              Colors.black26,
                              Colors.black12,
                            ]
                          : [
                              Colors.grey.shade700,
                              Colors.grey.shade600,
                              Colors.grey.shade500,
                              Colors.grey.shade200,
                            ],
                      stops: darkMode ? [0, 0.2, 0.8, 1] : [0, 0.1, 0.3, 1],
                    ),
                  ),
                ),
                const Clock(),
              ],
            ),
            const SizedBox(
              height: 30.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Dark Mode: ",
                  style: TextStyle(
                    fontSize: 25.0,
                    letterSpacing: 3.0,
                    fontWeight: FontWeight.w500,
                    color: darkMode ? Colors.grey[300] : Colors.grey[900],
                  ),
                ),
                Switch(
                  value: darkMode,
                  onChanged: (newVal) {
                    onSwitchValChanged(newVal);
                  },
                  activeColor: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
