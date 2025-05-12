import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EventServicesScreen extends StatefulWidget {
  @override
  _EventServicesCheckboxScreenState createState() => _EventServicesCheckboxScreenState();
}

class _EventServicesCheckboxScreenState extends State<EventServicesScreen> {
  List<dynamic> eventServices = [];
  List<String> selectedServices = [];

  @override
  void initState() {
    super.initState();
    fetchEventServices();
  }

  void fetchEventServices() async {
    final response = await http.get(Uri.parse("http://yourapi.com/get_event_services.php"));
    if (response.statusCode == 200) {
      setState(() {
        eventServices = json.decode(response.body);
      });
    }
  }

  void submitSelection() {
    String combined = selectedServices.join(',');
    print("Selected services: $combined");

    // You can also send this combined string to your database via API
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Select Event Services")),
      body: eventServices.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView(
        children: eventServices.map((service) {
          String serviceName = service['event_services'];
          return CheckboxListTile(
            title: Text(serviceName),
            value: selectedServices.contains(serviceName),
            onChanged: (bool? value) {
              setState(() {
                if (value == true) {
                  selectedServices.add(serviceName);
                } else {
                  selectedServices.remove(serviceName);
                }
              });
            },
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: submitSelection,
        child: Icon(Icons.save),
      ),
    );
  }
}
