import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ftl/controller/booking_controller.dart';
import 'package:test_ftl/model/divisi_model.dart';
import 'package:test_ftl/model/room_model.dart';

class AddBookingPage extends StatelessWidget {

  const AddBookingPage({super.key});

  @override
  Widget build(BuildContext context) {

  final BookingController controller = Get.put(BookingController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFd9d9d9),
        title: Text('Booking Ruang Meeting'),
        leading: BackButton(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Obx(() => DropdownButtonFormField<DivisiModel>(
                decoration: _inputDecoration('Divisi'),
                value: controller.selectedDivisi.value,
                items: controller.divisiList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.name ?? ''),
                        ))
                    .toList(),
                onChanged: (val) => controller.selectedDivisi.value = val,
              )),
              const SizedBox(height: 12),
      
              Obx(() => DropdownButtonFormField<RoomModel>(
                decoration: _inputDecoration('Ruang Meeting'),
                value: controller.selectedRoom.value,
                items: controller.roomList
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.roomName ?? ''),
                        ))
                    .toList(),
                onChanged: (val) => controller.selectedRoom.value = val,
              )),
              const SizedBox(height: 12),
        
              Obx(() => TextFormField(
                    readOnly: true,
                    decoration: _inputDecoration('Tanggal Meeting').copyWith(
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    controller: TextEditingController(
                      text: controller.selectedDate.value != null
                          ? '${controller.selectedDate.value!.toLocal()}'.split(' ')[0]
                          : '',
                    ),
                    onTap: () async {
                      final picked = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2020),
                        lastDate: DateTime(2030),
                      );
                      if (picked != null) {
                        controller.selectedDate.value = picked;
                      }
                    },
                  )),
              const SizedBox(height: 12),
        
              Obx(() => TextFormField(
                    readOnly: true,
                    decoration: _inputDecoration('Waktu Mulai Meeting').copyWith(
                      suffixIcon: Icon(Icons.access_time),
                    ),
                    controller: TextEditingController(
                      text: controller.startTime.value?.format(context) ?? '',
                    ),
                    onTap: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null) {
                        controller.startTime.value = picked;
                      }
                    },
                  )),
              const SizedBox(height: 12),
        
              Obx(() => TextFormField(
                    readOnly: true,
                    decoration:
                        _inputDecoration('Waktu Selesai Meeting').copyWith(
                      suffixIcon: Icon(Icons.access_time),
                    ),
                    controller: TextEditingController(
                      text: controller.endTime.value?.format(context) ?? '',
                    ),
                    onTap: () async {
                      final picked = await showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.now(),
                      );
                      if (picked != null) {
                        controller.endTime.value = picked;
                      }
                    },
                  )),
              const SizedBox(height: 12),
        
              TextFormField(
                controller: controller.jumlahPeserta,
                keyboardType: TextInputType.number,
                decoration: _inputDecoration('Jumlah Peserta'),
              ),
              const Spacer(),
        
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: controller.submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text('Submit', style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Color(0xFFFAE1E1),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none
      ),
    );
  }
}
