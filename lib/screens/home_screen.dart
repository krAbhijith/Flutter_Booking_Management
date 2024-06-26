import 'package:flutter/material.dart';
import 'package:test_app/screens/area_screen.dart';
import 'package:test_app/screens/admin_screen.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 380,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Area(areaNumber: 1,)));
                    },
                    style: ButtonStyle(
                      padding: MaterialStateProperty.resolveWith(
                        (states) => const EdgeInsets.symmetric(vertical: 60),
                      ),
                      backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green),
                      shape: MaterialStateProperty.resolveWith(
                        (states) => const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(18)),
                        ),
                      ),
                    ),
                    child: const Text(
                      "പഴയന്നൂർ",
                      style: TextStyle(
                        fontSize: 40,
                        color: Color.fromARGB(167, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 380,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const Area(areaNumber: 2)));
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
                      "എളനാട്",
                      style: TextStyle(
                        fontSize: 40,
                        color: Color.fromARGB(167, 0, 0, 0),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 380,
                  child: ElevatedButton(
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}