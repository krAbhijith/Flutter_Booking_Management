// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_db.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BookingAdapter extends TypeAdapter<Booking> {
  @override
  final int typeId = 0;

  @override
  Booking read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Booking(
      name: fields[1] as String,
      consumerNumber: fields[0] as int,
      phone: fields[2] as int,
      place: fields[3] as String,
      bookingDate: fields[4] as String,
      deliverydate: fields[5] as String,
      deliverystatus: fields[6] as bool,
      onlinePayment: fields[7] as bool,
      area: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Booking obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.consumerNumber)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.place)
      ..writeByte(4)
      ..write(obj.bookingDate)
      ..writeByte(5)
      ..write(obj.deliverydate)
      ..writeByte(6)
      ..write(obj.deliverystatus)
      ..writeByte(7)
      ..write(obj.onlinePayment)
      ..writeByte(8)
      ..write(obj.area);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BookingAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
