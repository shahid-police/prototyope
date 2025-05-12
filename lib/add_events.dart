import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'Service/EventAuthFile.dart';





class EventFormScreen extends StatefulWidget {
  @override
  _EventFormScreenState createState() => _EventFormScreenState();
}

class _EventFormScreenState extends State<EventFormScreen> {
//drop down venue
  List<Map<String, dynamic>> itemsvenues = [];
  String? selectedVenue;
// dropdown show service type

  List<Map<String, dynamic>> serviceType = [];
  String? selectedservicetype;

//check box
  List<bool> selectedServices = [false, false, false, false];
//final String _type = "equipment";

  List<dynamic> eventServices = [];
 // bool isLoading = true;


  final _EauthService = Eventauthfile();

  @override
  void initState() {
    super.initState();
    fetchvenue();
   // fetchSType();
    //fetchServices("");

   // print( fetchServices());
  }

  saveData(){}

//Fetch venue start from here
  Future<void> fetchvenue() async {
    try {
      List<Map<String, dynamic>> venues = await _EauthService.myVenueData(_EauthService.gtvenue);
      setState(() {
        itemsvenues = venues;
      });
      print("Fetched venues: $venues");
    } catch (e) {
      print("Error fetching venues: $e");
    }
  }



  // Fetch service type from here
  //
  // Future<void> fetchSType() async {
  //   try {
  //     List<Map<String, dynamic>> service = await _EauthService.mySType(_EauthService.gtserType);
  //     setState(() {
  //       serviceType = service;
  //     });
  //     print("Fetched service types: $service");
  //   } catch (e) {
  //     print("Error fetching service types: $e");
  //   }
  // }

  //Fetch services start from here

  Future<void> fetchServices(String type) async {
    try {
      List<dynamic> services = await _EauthService.myeve(type);
      print("Fetched services: $services");  // Debug

      setState(() {
        eventServices = services;
        selectedServices =
            List.generate(services.length, (index) => false);  // Reset checkboxes
      });
    } catch (e) {
      print("Error fetching services: $e");
    }
  }




  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Event Registration Form")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Select Venue"),
              value: selectedVenue,
              items: itemsvenues.map((venue) => DropdownMenuItem(
                value: venue['venue_id'].toString(),
                child: Text(venue['name']),
              )).toList(),
              onChanged: (value) => setState(() => selectedVenue = value),
            ),//venue


            SizedBox(height: 20),

            DropdownButtonFormField<String>(
              decoration: InputDecoration(labelText: "Select Service Type"),
              value: selectedservicetype,
              items: serviceType.map((service) => DropdownMenuItem(
                value: service['type'].toString(),
                child: Text(service['type']),
              )).toList(),
              onChanged: (value) {
                setState(() {
                  selectedservicetype = value;
                });
                if (value != null) {
                  fetchServices(value);  // ✅ This triggers fetching when the type changes
                }
              },
            ),//venue

//service Type


            SizedBox(height: 20),

            Text(
              "Select Event Services",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),

            // ✅ WRAP ListView.builder INSIDE Expanded
            Expanded(

              child: ListView.builder(
                itemCount: eventServices.length,
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    value: selectedServices[index],
                    onChanged: (value) {
                      setState(() {
                        selectedServices[index] = value!;
                      });
                    },
                    title: Text(
                        "${eventServices[index]['name']} - ${eventServices[index]['charges']}"),
                  );
                },
              ),
            ),

            SizedBox(height: 20),

            Center(
              child: ElevatedButton(
                onPressed: () => saveData(),
                child: Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

