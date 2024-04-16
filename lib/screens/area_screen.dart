import 'package:flutter/material.dart';
import 'package:test_app/screens/booking_list_screen.dart';

class Area1 extends StatelessWidget {
  final int areaNumber;
  const Area1({super.key, required this.areaNumber});

  @override
  Widget build(BuildContext context) {
    final List<String> area1 = ['Pazhayannur', 'Vadakkethara', 'Kumbalakode', 'Kallepadam'];
    final List<String> area2 = ['Vennur', 'Elanad', 'Thirumani', 'Thrikanaya'];
    List<String> area = areaNumber == 1 ? area1 : area2;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
      ),
      backgroundColor: Colors.green.shade100,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              4,
              (index) => SizedBox(
                width: 380,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookingsList(place : area[index])));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    area[index],
                    style: const TextStyle(fontSize: 40, color: Color.fromARGB(167, 0, 0, 0)),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
