import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final ScrollController _scrollController = ScrollController();
  double offset = 0.0;
  int selectedTab = 0;
  final double appBarHeight = 50;
  final double profileHeight = 180;
  final double tabLayoutHeight = 40;
  final double tabHeight = 1000;

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
    return Material(child: SafeArea(child: LayoutBuilder(
      builder: (context, constraint) {
        return Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      height: appBarHeight,
                      color: Colors.transparent,
                    ),
                    profile(constraint.maxWidth),
                    Container(
                      height: tabLayoutHeight,
                      color: selectedTab == 0 ? Colors.green : Colors.yellow,
                    ),
                    Container(
                      height: tabHeight,
                      width: constraint.maxWidth,
                      color: selectedTab == 0 ? Colors.green : Colors.yellow,
                      child: Align(
                          alignment: Alignment.topCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16),
                            child: Text(
                              "Tab ${selectedTab + 1}",
                              style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600),
                            ),
                          )),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: topMargin(), left: 20, right: 20),
              child: tabLayout(constraint.maxWidth),
            ),
            Container(
              padding: const EdgeInsets.all(16),
              height: appBarHeight,
              width: constraint.maxWidth,
              color: Colors.deepPurpleAccent,
              child: const Text(
                "Parallax scroll header with tab",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        );
      },
    )));
  }

  Widget profile(double width) {
    return SizedBox(
      height: profileHeight,
      width: width,
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.red),
                ),
                const SizedBox(
                  width: 16,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0, left: 4),
                  child: Text(
                    "User name",
                    style: TextStyle(fontSize: 30),
                  ),
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12, left: 4),
              child: Text(
                "User description User description User description User description",
                style: TextStyle(color: Colors.blue, fontSize: 14),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 4, left: 4),
              child: Text(
                "User profession",
                style: TextStyle(color: Colors.deepPurple, fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget tabLayout(double width) {
    return Container(
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                selectedTab = 0;
              });
            },
            child: Container(
                height: tabLayoutHeight,
                width: (width - 40) / 2,
                color: isStuckOnTop() ? Colors.deepPurpleAccent : Colors.white,
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tab 1",
                        style: TextStyle(
                            color: isStuckOnTop() ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: selectedTab == 0
                                ? FontWeight.w800
                                : FontWeight.w400)),
                    Divider(
                      color: selectedTab == 0
                          ? isStuckOnTop()
                              ? Colors.white
                              : Colors.black
                          : Colors.transparent,
                      height: 0,
                      thickness: 2,
                    )
                  ],
                )),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                selectedTab = 1;
              });
            },
            child: Container(
                height: tabLayoutHeight,
                width: (width - 40) / 2,
                color: isStuckOnTop() ? Colors.deepPurpleAccent : Colors.white,
                padding: const EdgeInsets.only(top: 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tab 2",
                        style: TextStyle(
                            color: isStuckOnTop() ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: selectedTab == 1
                                ? FontWeight.w800
                                : FontWeight.w400)),
                    Divider(
                      color: selectedTab == 1
                          ? isStuckOnTop()
                              ? Colors.white
                              : Colors.black
                          : Colors.transparent,
                      height: 0,
                      thickness: 2,
                    )
                  ],
                )),
          ),
        ],
      ),
    );
  }

  double screenHeight() {
    return MediaQueryData.fromWindow(WidgetsBinding.instance.window)
        .size
        .height;
  }

  double topMargin() {
    var topOffset = appBarHeight + profileHeight;
    return profileHeight - offset >= 0
        ? topOffset - offset
        : appBarHeight;
  }

  bool isStuckOnTop() {
    return profileHeight - offset < 0 ;
  }
}
