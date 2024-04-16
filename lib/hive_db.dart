import 'package:hive/hive.dart';

part 'hive_db.g.dart';

@HiveType(typeId: 0)
class Booking extends HiveObject {

  @HiveField(0)
  int consumerNumber;

  @HiveField(1)
  String name;

  @HiveField(2)
  int phone;

  @HiveField(3)
  String place;

  @HiveField(4)
  String bookingDate;

  @HiveField(5)
  String deliverydate;

  @HiveField(6)
  bool deliverystatus;

  @HiveField(7)
  bool onlinePayment;

  @HiveField(8)
  String area;
  

  Booking({
    required this.name,
    required this.consumerNumber,
    required this.phone,
    required this.place,
    required this.bookingDate,
    required this.deliverydate,
    required this.deliverystatus,
    required this.onlinePayment,
    required this.area
  });
}