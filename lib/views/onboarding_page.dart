import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_ftl/views/login_page.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Selamat Datang', 
                    style: TextStyle(
                        fontSize: 36, 
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato'
                    ),
                  ),
                  SizedBox(height: 16,),
                  Text('di Aplikasi',
                    style: TextStyle(
                        fontSize: 24, 
                        fontWeight: FontWeight.w700,
                        fontFamily: 'Lato',
                      ),
                  ),
                  SizedBox(height: 16,),
                  Text('Ruang Meeting',
                    style: TextStyle(
                      fontSize: 32, 
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Lato'
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 30,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: SizedBox(
                  height: 50,
                  width: 178,
                  child: ElevatedButton(
                    onPressed: (){
                      Get.to(LoginPage());
                    }, 
                    child: Text('Next',
                    style: TextStyle(
                        fontSize: 24, 
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                        fontFamily: 'Lato'
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
