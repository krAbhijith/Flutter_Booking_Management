import 'package:flutter/material.dart';
import 'package:test_app/screens/booking_list_screen.dart';

class Area extends StatelessWidget {
  final int areaNumber;
  const Area({super.key, required this.areaNumber});

  @override
  Widget build(BuildContext context) {
    final List<String> area1 = ['പഴയന്നൂർ', 'വടക്കേത്തറ', 'കുമ്പളക്കോട്', 'കല്ലേപ്പാടം'];
    final List<String> area2 = ['വെണ്ണൂർ', 'എളനാട്', 'തിരുമണി', 'തൃക്കണ്ണായ'];
    List<String> area = areaNumber == 1 ? area1 : area2;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        title: Text(areaNumber == 1 ? 'പഴയന്നൂർ' : 'എളനാട്'),
        centerTitle: true,
      ),
      backgroundColor: Colors.green.shade100,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
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
      ),
    );
  }
}
