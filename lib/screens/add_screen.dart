import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app/hive_db.dart';

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
            ),
            TextField(
                controller: _nameController,
                decoration: const InputDecoration(hintText: 'Name')),
            TextField(
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: const InputDecoration(hintText: 'Phone')),
            TextField(
                controller: _placeController,
                decoration: const InputDecoration(hintText: 'Place')),
            // TextField(controller: _bookingDateController, decoration: const InputDecoration(hintText: 'Booking Date')),
            // TextField(controller: _deliveryDateController, decoration: const InputDecoration(hintText: 'Delivery Date')),
            // TextField(controller: _areaCodeController, decoration: const InputDecoration(hintText: 'Area Code')),

            ElevatedButton(
              onPressed: () async {
                final box = Hive.box<Booking>('bookings');
                final booking = Booking(
                  name: _nameController.text,
                  consumerNumber: int.parse(_cNoController.text),
                  phone: int.parse(_phoneController.text),
                  place: _placeController.text.toUpperCase(),
                  bookingDate: DateTime.now().day.toString() +
                      DateTime.now().month.toString(),
                  deliverydate: '',
                  deliverystatus: false,
                  onlinePayment: false,
                );
                await box.add(booking);
                _clearFields(); // Clear text fields after adding the booking
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
