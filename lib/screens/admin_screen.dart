
import 'package:flutter/material.dart';
import 'package:test_app/screens/add_screen.dart';
import 'package:test_app/screens/day_log_screen.dart';

class Admin extends StatelessWidget {
  const Admin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
      ),
      backgroundColor: Colors.green.shade100,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: 380,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const DayLog(),));
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.resolveWith(
                      (states) => const EdgeInsets.symmetric(vertical: 40),
                    ),
                    backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green),
                    shape: MaterialStateProperty.resolveWith(
                      (states) => const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18)),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Day Log",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(167, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 380,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddScreen()));
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
                    "Add/Update",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(167, 0, 0, 0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 380,
                child: ElevatedButton(
                  onPressed: () {},
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
                    "Update",
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(167, 0, 0, 0),
                    ),
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
