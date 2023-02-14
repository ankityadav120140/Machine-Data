// ignore_for_file: avoid_unnecessary_containers

import 'dart:async';
import 'package:flutter/material.dart';
import '../utilities/flask.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool status = true;
  String temp = "25.0";
  String val = "50.0";

  @override
  void initState() {
    FetchData();
    super.initState();
  }

  void FetchData() async {
    Timer mytimer = Timer.periodic(const Duration(seconds: 2), (timer) async {
      var decodedData = await getData(Uri.parse(
          'https://capable-memory-364706.an.r.appspot.com/machine-data'));
      double temp1 = decodedData[5]['temperature'];
      double val1 = decodedData[5]['pressure'];
      temp = temp1.toStringAsFixed(2);
      val = val1.toStringAsFixed(2);
      setState(() {
        val;
        temp;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Machine Data",
          style: TextStyle(
            color: Colors.white,
            fontSize: 27,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.black,
          ),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.cyanAccent,
              Colors.white,
            ],
          ),
        ),
        // margin: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Text(
                      'Status : ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    child: status
                        ? const Icon(
                            Icons.circle,
                            size: 40,
                            color: Colors.green,
                          )
                        : const Icon(
                            Icons.circle,
                            size: 40,
                            color: Colors.red,
                          ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Text(
                      'Temperature : ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.cyan,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      '$temp °C',
                      style: const TextStyle(fontSize: 25),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: const Text(
                      'Pressure : ',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.cyan,
                        width: 2,
                      ),
                    ),
                    child: Text(
                      '$val atm',
                      style: const TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
