import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ftl/model/divisi_model.dart';
import 'package:test_ftl/model/room_model.dart';
import 'package:test_ftl/model/room_schedule_model.dart';

class BookingController extends GetxController {
  final selectedDivisi = Rxn<DivisiModel>();
  final selectedDate = Rxn<DateTime?>(null);
  final startTime = Rxn<TimeOfDay>();
  final endTime = Rxn<TimeOfDay>();
  final jumlahPeserta = TextEditingController();

  final List<DivisiModel> divisiList = [
    DivisiModel(id: '1', name: 'IT'),
    DivisiModel(id: '2', name: 'HR'),
    DivisiModel(id: '3', name: 'Finance'),
    DivisiModel(id: '4', name: 'Marketing'),
  ];

  final selectedRoom = Rxn<RoomModel>();

  final List<RoomModel> roomList = [
    RoomModel(id: 'r1', roomName: 'Ruang 1'),
    RoomModel(id: 'r2', roomName: 'Ruang 2'),
    RoomModel(id: 'r3', roomName: 'Ruang 3'),
  ];

  void submit() {
    if (selectedDivisi.value == null ||
        selectedRoom.value == null ||
        selectedDate.value == null ||
        startTime.value == null ||
        endTime.value == null ||
        jumlahPeserta.text.isEmpty) {
      Get.snackbar('Error', 'Harap lengkapi semua data');
      return;
    }

    SnackBar(content: Text('Booking berhasil!'));
  }

  final bookingList = <RoomScheduleModel>[].obs;

  final bookedRoomList = [
    RoomModel(id: 'r1', roomName: 'Squats Room'),
    RoomModel(id: 'r2', roomName: 'Pushups Room'),
  ];

  void pickDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: selectedDate.value ?? DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      selectedDate.value = date;
      fetchJadwal();
    }
  }

  void fetchJadwal() {
    bookingList.assignAll([
      RoomScheduleModel(
        namaRuangan: selectedRoom.value?.roomName ?? 'Unknown',
        waktuMulai: '08:00',
        waktuSelesai: '09:00',
      ),
      RoomScheduleModel(
        namaRuangan: selectedRoom.value?.roomName ?? 'Unknown',
        waktuMulai: '08:00',
        waktuSelesai: '09:00',
      ),
    ]);
  }

}
