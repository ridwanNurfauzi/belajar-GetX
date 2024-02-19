import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/counter_controller.dart';

class CounterView extends GetView<CounterController> {
  const CounterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CounterView'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'CounterView is working',
              style: TextStyle(fontSize: 20),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: 'btn1',
                  onPressed: () {
                    controller.increment();
                  },
                  child: Icon(Icons.add),
                ),
                Obx(() => Text(
                      "${controller.count}",
                      style: TextStyle(
                        fontSize: controller.count.toDouble() * 2,
                      ),
                    )),
                FloatingActionButton(
                    heroTag: 'btn2',
                    onPressed: () {
                      controller.decrement();
                    },
                    child: Icon(Icons.remove)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
