import 'package:flutter/material.dart';
import 'package:flutter_dashboard_mockup/app_colors.dart';
import 'package:flutter_dashboard_mockup/chart.dart';
import 'package:flutter_dashboard_mockup/donut.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // colorScheme: ColorScheme.fromSeed(seedColor: AppColors.almostBlack),
        // useMaterial3: true,
        fontFamily: 'Poppins'
      ),
      home: Material(
          color: AppColors.almostBlack,
          child: MyHomePage(title: 'Flutter Demo Home Page')),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.95;
    double containerHeight = MediaQuery.of(context).size.width * 0.6;

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.95,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.almostBlack2,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                  const Text(
                    "Stress Management",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.almostBlack2,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.add, color: Colors.white),
                      onPressed: () {},
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: [
                  Container(
                      width: containerWidth,
                      height: containerHeight,
                      padding: EdgeInsets.fromLTRB(10, 16, 10, 16),
                      decoration: BoxDecoration(
                        color: AppColors.canary2,
                        borderRadius: BorderRadius.circular(40),
                      ),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  spacing: 5,
                                  children: [
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AppColors.almostBlack2WithAlpa,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.arrow_back,
                                            size: 20,
                                            color: AppColors.almostBlack),
                                        onPressed: () {},
                                      ),
                                    ),
                                    Column(
                                      children: [
                                        Text(
                                          "Jul 16 - 24",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          "77 Stress Score",
                                          style: TextStyle(
                                              color: AppColors.almostBlack3),
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: AppColors.almostBlack2WithAlpa,
                                        shape: BoxShape.circle,
                                      ),
                                      child: IconButton(
                                        icon: const Icon(Icons.arrow_forward,
                                            size: 20,
                                            color: AppColors.almostBlack),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                    height: 40,
                                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                    decoration: BoxDecoration(
                                        color: AppColors.almostBlack2WithAlpa,
                                        shape: BoxShape.rectangle,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Text("Week"),
                                        IconButton(
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(Icons.arrow_downward,
                                              size: 20,
                                              color: AppColors.almostBlack),
                                          onPressed: () {},
                                        )
                                      ],
                                    )),
                              ],
                            ),
                            SizedBox(
                              height: containerHeight * 0.15,
                            ),
                            CustomBarChart(
                                containerHeight * 0.4, containerWidth)
                          ])),
                  const SizedBox(height: 20),
                  Container(
                    width: containerWidth,
                    height: containerHeight,
                    decoration: BoxDecoration(
                      color: AppColors.almostBlack2,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(25, 20.0, 25, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                "Todays Score",
                                style: TextStyle(
                                    color: Colors.white, fontSize: 15),
                              ),
                              const Text(
                                "Learn more",
                                style: TextStyle(
                                    color: AppColors.canary, fontSize: 15),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Center(
                            child: DonutWidget(
                              percentage: 0.6, // 60% giallo, 40% nero
                              number: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
