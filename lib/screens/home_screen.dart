import 'package:flutter/material.dart';
import 'package:test_app/screens/area_screen.dart';
import 'package:test_app/screens/admin_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Area1(areaNumber: 1,)));
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green),
                  shape: MaterialStateProperty.resolveWith(
                    (states) => const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  ),
                ),
                child: const Text(
                  "Area 1",
                  style: TextStyle(
                    fontSize: 50,
                    color: Color.fromARGB(167, 0, 0, 0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Area1(areaNumber: 2)));
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.symmetric(vertical: 60, horizontal: 80),
                  ),
                  backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green),
                  shape: MaterialStateProperty.resolveWith(
                    (states) => const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  ),
                ),
                child: const Text(
                  "Area 2",
                  style: TextStyle(
                    fontSize: 50,
                    color: Color.fromARGB(167, 0, 0, 0),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const Admin()));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.green),
                  padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.symmetric(vertical: 20, horizontal: 110),
                  ),
                  shape: MaterialStateProperty.resolveWith(
                    (states) => const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                  ),
                ),
                child: const Text(
                  "ADMIN",
                  style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(167, 0, 0, 0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}