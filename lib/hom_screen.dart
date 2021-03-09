import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:vision_sms_gateway/data.dart';
import 'dart:io';
import 'package:get_ip/get_ip.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String toastMsg;

  void showToast(toastMsg) {
    Future.delayed(Duration(milliseconds: 500), () {
      Toast.show('$toastMsg', context,
          duration: Toast.LENGTH_SHORT,
          gravity: Toast.CENTER,
          textColor: Colors.white,
          backgroundColor: Colors.blue);
    });
  }

  String statusText = "Start Server";
  String btnText = "Start";
  var server;
  bool status = false;
  final globalKey = GlobalKey<ScaffoldState>();

  startServer() async {
    server = await HttpServer.bind(InternetAddress.anyIPv4, 4545);
    String ipAddress = await GetIp.ipAddress;
    String myUrl = ipAddress + ":" + server.port.toString();
    print(myUrl);
    setState(() {
      statusText =
          "Server running on: " + ipAddress + ":" + server.port.toString();
      btnText = "Stop";
      showToast('Server Startd');
      Future.delayed(Duration(milliseconds: 1500), () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Data(
                      myurl: myUrl,
                    )));
      });
    });
    status = true;
    print("Server running on IP : " +
        server.address.toString() +
        " On Port : " +
        server.port.toString());
    await for (var request in server) {
      request.response
        ..headers.contentType =
            new ContentType("text", "plain", charset: "utf-8")
        ..write('Hello World Adnan')
        ..close();
    }
  }

  stopServer() {
    setState(() {
      server.close();
      btnText = "Start";
      statusText = "Start Server";
      showToast('Start Stopped');
    });
    status = false;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'images/sms.png',
            width: 300,
          ),
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: Text(
              statusText,
              textAlign: TextAlign.center,
            ),
          ),
          RawMaterialButton(
            child: Text(
              '$btnText',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            fillColor: Colors.blue,
            padding: EdgeInsets.symmetric(horizontal: 100.0, vertical: 30.0),
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            onPressed: () {
              if (status == false) {
                startServer();
              } else {
                stopServer();
              }
            },
          )
        ],
      ),
    );
  }
}
