import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  double offset = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      offset = _scrollController.offset;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  controller: _scrollController,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          children: [
                                    Container(
                                      height: 180,
                                      color: Colors.red,
                                    ),
                                    Container(
                                      height: 80,
                                      color: Colors.yellow,
                                    ),
                                    Container(
                                      height: 500,
                                      color: Colors.yellow,
                                    ),
                                    Container(
                                      height: 500,
                                      color: Colors.orange,
                                    ),
                                    Container(
                                      height: 500,
                                      color: Colors.blue,
                                    ),
                          ],
                        ),
                      ),
                    ),
                Padding(
                  padding: EdgeInsets.only(top: 180 - offset >= 0 ? 180 - offset : 0, left: 20, right: 20),
                  child: Container(
                    height: 80,
                    color: Colors.green,
                  ),
                )
              ],
            )));
  }

  double screenHeight() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .size
        .height;
  }
}
