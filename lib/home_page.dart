import 'package:flutter/material.dart';
import 'package:flutter_remote_config_server_driven_ui/remote_config.dart';
import 'package:flutter_remote_config_server_driven_ui/widget_map.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Widget> serverWidgets = [];

  @override
  void initState() {
    super.initState();
    getVal();
  }

  getVal() async{
    var serverJsonList = (await FirebaseRemoteConfigClass().initializeConfig());
    setState(() {
      serverWidgets = MapDataToWidget().mapWidgets(serverJsonList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text(widget.title)),
      body:  SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              ...serverWidgets
            ],
          ),
        ),
      ),
    );
  }
}
