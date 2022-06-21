import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'home_screen.dart';

class pickUp extends StatefulWidget {
  const pickUp({Key? key}) : super(key: key);

  @override
  State<pickUp> createState() => _PickUpState();
}

class _PickUpState extends State<pickUp> {
  var areaController = TextEditingController();
  var streetController = TextEditingController();
  var bfaController = TextEditingController();
  var dateController = TextEditingController();

  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  final databaseRef = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Schedule Pick Up',
                  style: TextStyle(
                      fontSize: 35.0,
                      color: Colors.green,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 40.0,
                ),
                TextField(
                  controller: areaController,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    labelText: 'Area',
                    hoverColor: Colors.green,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: streetController,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    labelText: 'Street',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: bfaController,
                  cursorColor: Colors.green,
                  decoration: InputDecoration(
                    labelText: 'Building / Floor/ Apartment Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () => _selectDate(context),
                  child: Text(
                    'Select date',
                    style: TextStyle(
                      fontSize: 17.0,
                      color: Colors.green,
                    ),
                  ),
                ),
                Text("${selectedDate.toLocal()}".split(' ')[0]),
                SizedBox(
                  height: 20.0,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RaisedButton(
                      onPressed: () {
                        if (areaController.text.isNotEmpty &&
                            streetController.text.isNotEmpty &&
                            bfaController.text.isNotEmpty) {
                          insertReq(areaController.text, streetController.text,
                              bfaController.text, dateController.text);
                        }
                      },
                      color: Colors.green,
                      child: Text(
                        'Schedule',
                        style: TextStyle(
                          fontSize: 22.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  child: Text(
                    'Back',
                    style: TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void insertReq(String area, String street, String BFA, String dateTime) {
    databaseRef.child("path").set({
      'area': area,
      'street': street,
      'address': BFA,
      'Date': dateTime,
    });
  }
}
