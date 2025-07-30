import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ftl/controller/home_controller.dart';

class HomePage extends StatelessWidget{
  const HomePage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeController())
    ;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 40),
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
                          Text('Yosi',
                          style: TextStyle(
                              fontSize: 24, 
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                              fontFamily: 'Lato'
                            ),
                          ),
                          Text('Web Developer',
                          style: TextStyle(
                              fontSize: 10, 
                              color: Colors.black,
                              fontFamily: 'Lato'
                            ),
                          ),
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
                  // controller.roomScheduleList.isEmpty ?
                  //   Center(child: Text('Tidak ada jadwal hari ini', style: TextStyle(fontSize: 16, color: Colors.black, fontFamily: 'Lato'),)) :
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: controller.roomScheduleList.length,
                      itemBuilder: (context, index) {
                        final room = controller.roomScheduleList[index];
                        return Container(
                          margin: EdgeInsets.only(bottom: 20),
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                            color: Color(0xFFd9d9d9),
                            borderRadius: BorderRadius.circular(8.0)
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('${room.waktuMulai} - ${room.waktuSelesai}',
                                style: TextStyle(
                                    fontSize: 16, 
                                    color: Colors.white,
                                    fontFamily: 'Lato'
                                  ),
                              ),
                              Text('${room.namaRuangan}',
                                style: TextStyle(
                                    fontSize: 16, 
                                    color: Colors.white,
                                    fontFamily: 'Lato'
                                  ),
                              ),
                            ],
                          ));
                        }
                    )
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}