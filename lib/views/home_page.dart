import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ftl/controller/home_controller.dart';
import 'package:test_ftl/views/add_booking_page.dart';
import 'package:test_ftl/views/booking_page.dart';
import 'package:test_ftl/views/card_schedule_info.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController());
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFFd9d9d9),
        onTap: (value) {
          switch (value) {
            case 0:
              Get.to(BookingPage());
              break;
            case 1:
              Get.to(AddBookingPage());
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt), 
            label: 'Jadwal Ruang', 
            backgroundColor: Color(0xffd9d9d9),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.edit), 
            label: 'Booking Ruang', 
            backgroundColor: Color(0xffd9d9d9)
          ),
        ],
      ),
      body: Container(
        color: Colors.white,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 75,
                    child: Row(
                      children: [
                        SizedBox(
                          height: 75,
                          width: 75,
                          child: CircleAvatar(backgroundColor: Color(0xFFBEC3E6),)),
                        SizedBox(width: 20,),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Obx(() => Text(controller.userName.value.capitalizeFirst ?? '',
                              style: TextStyle(
                                  fontSize: 16, 
                                  color: Colors.black,
                                  fontFamily: 'Lato'
                                ),
                              )),
                            Obx(()=> Text(controller.userRole.value,
                              style: TextStyle(
                                  fontSize: 14, 
                                  color: Colors.black54,
                                  fontFamily: 'Lato'
                                ),
                              )),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 30,),
                  Text('Jadwal Ruang Meeting Hari Ini',
                    style: TextStyle(
                        fontSize: 16, 
                        color: Colors.black,
                        fontFamily: 'Lato'
                    ),),    
                  SizedBox(height: 20,),
                  Obx(() =>
                    controller.roomScheduleList.isEmpty ?
                      Center(child: Text('Tidak ada jadwal hari ini', style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Lato'),)) :
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: controller.roomScheduleList.length,
                        itemBuilder: (context, index) {
                          final room = controller.roomScheduleList[index];
                          return CardScheduleInfo(room: room);
                          }
                      )
                    )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}