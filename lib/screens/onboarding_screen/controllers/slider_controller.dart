import 'package:get/get.dart';

class SliderController extends GetxController{
  int currentIndex = 0;

  void changeSlide(int index){
    currentIndex = index;
    update();
  }
}