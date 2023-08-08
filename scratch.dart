import 'dart:io';

void main(){
  performtask();
}

performtask(){
  task1();
  task2();
  task3();
}

task1(){
  String result = 'Task 1 data';
  print('Task 1 completed');
}

task2(){
  Duration threesecs = Duration(seconds: 3);
  Future.delayed(threesecs, (){
    String result = 'Task 2 data';
    print('Task 2 completed');
  });
  // sleep(threesecs);

}

task3(){
  String result = 'Task 3 data';
  print('Task 3 completed');
}