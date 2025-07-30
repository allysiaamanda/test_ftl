import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ftl/controller/auth_controller.dart';

class LoginPage extends StatelessWidget{
  const LoginPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    final authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: 
        ListView(
          children: [
            SizedBox(height: 45,),
            Center(
              child: Text('Ruangan Meeting',
                style: TextStyle(
                    fontSize: 32, 
                    fontWeight: FontWeight.w700,
                    color: Colors.black,
                    fontFamily: 'Lato'
                ),
              ),
            ),
            SizedBox(height: 126,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 16),
              padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
              decoration: BoxDecoration(
                color: Color(0xFFd9d9d9),
                borderRadius: BorderRadius.circular(8.0)
              ),
              child: Column(
                children: [
                  Text('Sign In',
                  style: TextStyle(
                      fontSize: 24, 
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                      fontFamily: 'Lato'
                    ),
                  ),
                  SizedBox(height: 37,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: TextFormField(
                      controller: authController.emailFieldController,
                      decoration: InputDecoration(
                        hintText: 'Email....',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8), 
                          borderSide: BorderSide(color: Colors.white))
                      ),
                      validator: (value) => authController.emailFieldController.text.contains('@') == true ? '' : 'Invalid Email',
                    ),
                  ),
                  SizedBox(height: 19,),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0)
                    ),
                    child: Obx(()=>
                    TextFormField(
                      controller: authController.passwordFieldController,
                      obscureText: authController.isObscure.value,
                      decoration: InputDecoration(
                        hintText: 'Password....',
                        suffixIcon: GestureDetector(
                          onTap: (){
                            if(authController.isObscure.isTrue){
                              authController.changeObscureState(false);
                            } else {
                              authController.changeObscureState(true);
                            }
                          },
                          child: Icon(Icons.remove_red_eye_outlined),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8), 
                          borderSide: BorderSide(color: Colors.white))
                      ),
                    )),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  SizedBox(
                    height: 47,
                    width: 126,
                    child: ElevatedButton(
                      onPressed: (){
                        authController.isLoadingAuth(true);
                        try {
                          authController.login(
                            email: authController.emailFieldController.text,
                            password: authController.passwordFieldController.text,); 
                          
                        } catch (e) {
                          print(e); 
                        } finally {
                        authController.isLoadingAuth(false);
                        }
                      }, 
                      child: Obx(()=> authController.isLoading.isFalse ? Center(
                        child: Text('Sign In',
                          style: TextStyle(
                            fontSize: 18, 
                            color: Colors.black,
                            fontFamily: 'Lato'
                          ),
                        ),
                      ) : Center(
                        child: CircularProgressIndicator(color: Colors.black,),
                      )),
                    ),
                  ),
                  SizedBox(height: 51,),
                ],
              )
            )
          ],
        )
        ));
  }

}