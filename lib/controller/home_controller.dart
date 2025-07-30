import 'dart:convert';

import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_ftl/model/room_schedule_model.dart';

class HomeController extends GetxController{
  
  RxList roomScheduleList = <RoomScheduleModel>[].obs;
  RxString userName = ''.obs;
  RxString userEmail = ''.obs;
  RxString userRole = 'Web Developer'.obs;

  @override
  Future<void> onInit() async{
    await getUserData();
    super.onInit();
    await getJadwalRuangan();
  }

  Future<void> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    userName.value = prefs.getString('userName') ?? '';
    userEmail.value = prefs.getString('userEmail') ?? '';
  }

  Future<void> getJadwalRuangan() async{
    try {
      final res = await http.get(Uri.parse('https://api.ftlgym.com/api/v1/test/jadwalruangan'),);
    
      final jsonBody = jsonDecode(res.body);
      final jsonData = jsonBody['data'];
      if(res.statusCode == 200){
        roomScheduleList.addAll(
          (jsonData as List)
              .map((item) => RoomScheduleModel.fromJson(item))
              .toList()
        );
      } 
    } catch (e) {
      print(e); 
      rethrow;
    }
  }
}