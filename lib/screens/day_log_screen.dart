import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_app/hive_db.dart';

class DayLog extends StatelessWidget {
  const DayLog({super.key});

  @override
  Widget build(BuildContext context) {
    final today = '${DateTime.now().day.toString()}-${DateTime.now().month.toString()}-${DateTime.now().year.toString()}';
    final Box box = Hive.box<Booking>('bookings');
    final List<Booking> bookingList =  box.values.toList().cast<Booking>();
    final Iterable<Booking> dayList = bookingList.where((element) => element.deliverydate == today && element.deliverystatus);

    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        title: Text("Day Log ($today)"),
        centerTitle: true,
      ),
      body: ListView.separated(
        itemCount: dayList.length,
        itemBuilder: (context, index){
          Booking bill = dayList.elementAt(index);
          Color tileColor = bill.onlinePayment ? const Color.fromARGB(120, 0, 0, 0) : Colors.green.shade300;
            return ListTile(
              titleTextStyle: const TextStyle(fontSize: 18),
              titleAlignment: ListTileTitleAlignment.center,
              textColor: Colors.black,
              tileColor: tileColor,
                title: Row(
                  children: [
                    Expanded(flex: 1,child: Text(bill.consumerNumber.toString(), textAlign: TextAlign.center,)),
                    Expanded(flex: 1,child: Text(bill.name, textAlign: TextAlign.center,)),
                    Expanded(flex: 1,child: Text(bill.place, textAlign: TextAlign.center,)),
                  ],
                ),
            );
        },
        separatorBuilder: (context, index) => const SizedBox(height: 8,),
      ),
    );
  }
}