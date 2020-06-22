import 'package:flutter/material.dart';
import 'package:random_pk/random_pk.dart';
import 'dart:math' as math;

class AnimatedBuilderExamle extends StatefulWidget {
  AnimatedBuilderExamle({Key key}) : super(key: key);

  @override
  _AnimatedBuilderExamleState createState() => _AnimatedBuilderExamleState();
}

class _AnimatedBuilderExamleState extends State<AnimatedBuilderExamle>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
//! step1: khởi tạo SingleTickerProviderStateMixin để gọi hàm AnimationController
  @override
  void initState() { //! trong init khởi tạo AnimationController 
    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 10))
          ..repeat();
    //! repeat giups tăng hiệu xuất của animation
    super.initState();
    _animationController.addListener(() { //! giúp lắng nghe thay đổi của animation
      setState(() {
        //! sau đó sẽ thay đổi trạng thái
      });
    });
  }
  @override
  void dispose() {
   _animationController.dispose(); //! khi kết thúc chương trình sẽ gọi hàm dispose để giải phóng bộ nhớ
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RandomContainer(//! tạo giao diện. thì đầu tiện phải gọi hàm randomContainer
          height: 200,
          width: 200,
          child: Transform.rotate( //! sau đó bắt sự kiện animation cho container đó
            angle: _animationController.value * 2.0 * math.pi, //! bắt sự kiện animation xoay tròn
            child: Container( //! con tainer ngoài cùng sẽ xoay
              height: 100,
              width: 100,
              color: Colors.red,
            ),
             ),
        ),
      ),
    );
  }
}
