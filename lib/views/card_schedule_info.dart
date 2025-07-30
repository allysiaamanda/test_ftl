import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_ftl/model/room_schedule_model.dart';

class CardScheduleInfo extends StatelessWidget{
  final RoomScheduleModel room;
  const CardScheduleInfo({super.key, required this.room});

  @override
  Widget build(BuildContext context) {
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

}