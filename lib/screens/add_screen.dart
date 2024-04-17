import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/hive_db.dart';
import 'package:collection/collection.dart';


class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  AddScreenState createState() => AddScreenState();
}

class AddScreenState extends State<AddScreen> {
  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _placeController = TextEditingController();
  final _cNoController = TextEditingController(text: '60');
  // final _bookingDateController = TextEditingController();
  // final _deliveryDateController = TextEditingController();
  // final _areaCodeController = TextEditingController();

  int _radioValue = 0;

  final List<String> area = [
    'പഴയന്നൂർ',
    'വടക്കേത്തറ',
    'കുമ്പളക്കോട്',
    'കല്ലേപ്പാടം',
    'വെണ്ണൂർ',
    'എളനാട്',
    'തിരുമണി',
    'തൃക്കണ്ണായ'
  ];

  void _clearFields() {
    _nameController.clear();
    _phoneController.clear();
    _placeController.clear();
    _cNoController.text = '60';
    // _bookingDateController.clear();
    // _deliveryDateController.clear();
    // _areaCodeController.clear();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _placeController.dispose();
    _cNoController.dispose();
    // _bookingDateController.dispose();
    // _deliveryDateController.dispose();
    // _areaCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Booking')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _cNoController,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(6)
              ],
              onEditingComplete: () {
                if (_cNoController.text.length == 6) {
                  final Box box = Hive.box<Booking>(
                      'bookings'); // Specify the type for type safety
                  final List<Booking> bookingsList =
                      box.values.toList().cast<Booking>();
                  final Booking? booking = bookingsList.firstWhereOrNull(
                      (element) =>
                          element.consumerNumber ==
                          int.parse(_cNoController.text));
                  if (booking != null) {
                    _nameController.text = booking.name;
                    _phoneController.text = booking.phone.toString();
                    _placeController.text = booking.place;
                    _handleRadioValueChange(area.indexOf(booking.area));
                    // print(booking.area);
                    // print(area.indexOf(booking.area));
                    // print((booking.area));
                  }
                }
              },
            ),
            TextField(
              controller: _nameController,
              decoration: const InputDecoration(hintText: 'Name'),
            ),
            TextField(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10)
              ],
              decoration: const InputDecoration(hintText: 'Phone')),
            // TextField(controller: _bookingDateController, decoration: const InputDecoration(hintText: 'Booking Date')),
            // TextField(controller: _deliveryDateController, decoration: const InputDecoration(hintText: 'Delivery Date')),
            // TextField(controller: _areaCodeController, decoration: const InputDecoration(hintText: 'Area Code')),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Radio(
                      value: index,
                      groupValue: _radioValue,
                      onChanged: _handleRadioValueChange,
                    ),
                    Text(area[index]),
                  ],
                );
              }),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return Column(children: [
                  Radio(
                    value: index + 4,
                    groupValue: _radioValue,
                    onChanged: _handleRadioValueChange,
                  ),
                  Text(area[index + 4])
                ]);
              }),
            ),
            const SizedBox(height: 10),
            TextField(
                controller: _placeController,
                decoration: const InputDecoration(hintText: 'Place')),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                saveOrUpdateBooking();
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRadioValueChange(int? value) {
    setState(() {
      _radioValue = value!;
    });
  }

  void saveOrUpdateBooking() async {
  String cNoText = _cNoController.text;
  if (cNoText.isNotEmpty) {
    try {
      int cNo = int.parse(cNoText);
      final Box<Booking> box = Hive.box<Booking>('bookings');
      final List<Booking> bookingsList = box.values.toList().cast<Booking>();
      final Booking? existingBooking = bookingsList.firstWhereOrNull((element) => element.consumerNumber == cNo);

      if (existingBooking != null) {
        // Update the existing booking here (you can modify this part)
        existingBooking.name = _nameController.text;
        existingBooking.phone = int.parse(_phoneController.text);
        existingBooking.place = _placeController.text.toUpperCase();
        existingBooking.area = area[_radioValue];
        existingBooking.bookingDate = DateTime.now().day.toString() + DateTime.now().month.toString();
        // Update other fields as needed
        // print(existingBooking.area);
        box.put(existingBooking.key, existingBooking); // Update the booking in the box
      } else {
        // Create a new booking here (you can modify this part)
        Booking newBooking = Booking(
          name: _nameController.text,
          consumerNumber: cNo,
          phone: int.parse(_phoneController.text),
          place: _placeController.text.toUpperCase(),
          area: area[_radioValue],
          bookingDate: DateTime.now().day.toString() + DateTime.now().month.toString(),
          deliverydate: '',
          deliverystatus: false,
          onlinePayment: false,
        );
        await box.add(newBooking); // Add the new booking to the box
        // print(newBooking.area);
      }
      _clearFields(); // Clear text fields after updating or adding the booking
    } catch (e) {
      // print('Error parsing Consumer Number: $e');
      // Handle parsing errors here
    }
  }
}
}
