import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:test_app/hive_db.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingsList extends StatefulWidget {
  final String place;
  const BookingsList({super.key, required this.place});

  @override
  State<BookingsList> createState() => _BookingsListState();
}

class _BookingsListState extends State<BookingsList> {
  @override
  Widget build(BuildContext context) {
    final Box box = Hive.box<Booking>('bookings'); // Specify the type for type safety
    final List<Booking> bookingsList = box.values.toList().cast<Booking>();
    final Iterable<Booking> bookings = bookingsList.where((element) => element.area == widget.place);

    void updateDeliveryStatus(int index) {
      // Check if index is valid
      if (index >= 0 && index < bookings.length) {
        // Update delivery status in Hive box
        final Booking booking = bookings.elementAt(index);
        setState(() {
          booking.deliverystatus = true;
          booking.deliverydate = DateTime.now().day.toString() + DateTime.now().month.toString();
        });
        box.putAt(index, booking); // Update the item in Hive box
      }
    }

    Future<void> makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
      );
      await launchUrl(launchUri);
    }
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      appBar: AppBar(
        backgroundColor: Colors.green.shade100,
        title: const Text('Bookings List'),
      ),
      body: ListView.builder(
        itemCount: bookings.length,
        itemBuilder: (context, index) {
          if (bookings.elementAt(index).deliverystatus) {
            return const SizedBox.shrink();
          }
          return Card(
            color: const Color.fromARGB(143, 122, 228, 125),
            child: ListTile(
              title: Text('Consumer Number: ${bookings.elementAt(index).consumerNumber}'),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Name: ${bookings.elementAt(index).name}'),
                  Text('Place: ${bookings.elementAt(index).place}'),
                  Text('Date: ${bookings.elementAt(index).bookingDate}'),
                ],
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                      onPressed: () {
                        makePhoneCall(bookings.elementAt(index).phone.toString());
                      },
                      icon: const Icon(Icons.call)),
                  IconButton(
                    onPressed: () {
                      // Modify the delivery status within the box
                      updateDeliveryStatus(index);
                    },
                    icon: const Icon(Icons.done_all_rounded),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.payments_outlined)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
