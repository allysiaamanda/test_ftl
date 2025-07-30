
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_ftl/views/home_page.dart';

class AuthController extends GetxController{


  TextEditingController emailFieldController = TextEditingController();
  TextEditingController passwordFieldController = TextEditingController();

  RxBool isObscure = true.obs;
  RxBool isLoading = false.obs;
  
  @override
  void onInit(){
    super.onInit();
  }

  Future<void> login({required String email, required String password}) async{
   try {
      final res = await http.post(Uri.parse('https://api.ftlgym.com/api/v1/test/login'), 
      body: {
        "email":email,
        "password":password
      });
      print("RESPONSE AUTH ${res.body}");
      if(res.statusCode == 200){
        Get.to(HomePage());
      } 
   } catch (e) {
     print(e); 
     rethrow;
   }
  }

  void changeObscureState(bool value){
    isObscure.value = value;
  }

  void isLoadingAuth(bool value){
    isLoading.value = value;
  }
}