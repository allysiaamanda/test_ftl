import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:test_ftl/model/room_schedule_model.dart';

class HomeController extends GetxController{
  RxList roomScheduleList = <RoomScheduleModel>[].obs;
  @override
  Future<void> onInit() async{
    super.onInit();
    await getJadwalRuangan();
  }

  Future<void> getJadwalRuangan() async{
    final res = await http.get(Uri.parse('https://api.ftlgym.com/api/v1/test/jadwalruangan'),);
    
    print("RESPONSE HOME ${res.body}");
    final jsonBody = jsonDecode(res.body);
    final jsonData = jsonBody['data'];
    print("RESPONSE HOME DATA ===> ${json}");
    if(res.statusCode == 200){
      roomScheduleList.addAll(
        (jsonData as List)
            .map((item) => RoomScheduleModel.fromJson(item))
            .toList()
      );
    }
  }
}