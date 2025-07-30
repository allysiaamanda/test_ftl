import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ftl/controller/booking_controller.dart';
import 'package:test_ftl/model/room_model.dart';
import 'package:test_ftl/views/card_schedule_info.dart';

class BookingPage extends StatelessWidget {

  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {

  final controller = Get.put(BookingController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFd9d9d9),
        title: const Text('Jadwal Ruang Meeting'),
        leading: const BackButton(),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade200,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Obx(() => DropdownButtonFormField<RoomModel>(
                      decoration: _inputDecoration('Ruang Meeting'),
                      value: controller.selectedRoom.value,
                      items: controller.roomList
                          .map((e) => DropdownMenuItem(
                                value: e,
                                child: Text(e.roomName ?? ''),
                              ))
                          .toList(),
                      onChanged: (val) {
                        controller.selectedRoom.value = val;
                        controller.fetchJadwal();
                      },
                    )),
                const SizedBox(height: 12),

                Obx(() => TextFormField(
                      readOnly: true,
                      onTap: () => controller.pickDate(context),
                      decoration:
                          _inputDecoration('Tanggal Meeting').copyWith(
                        suffixIcon: const Icon(Icons.calendar_today),
                      ),
                      controller: TextEditingController(
                        text: controller.selectedDate.value == null
                            ? ''
                            : '${controller.selectedDate.value!.toLocal()}'.split(' ')[0],
                      ),
                    )),
              ],
            ),
          ),

          Expanded(
            child: Obx(() => ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: controller.bookingList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 12),
                  itemBuilder: (context, index) {
                    final room = controller.bookingList[index];
                    return CardScheduleInfo(room: room);
                  },
                )),
          )
        ],
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
