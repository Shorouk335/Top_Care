import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:top_care_graduation_project/Components/PageViewItem.dart';
import 'package:top_care_graduation_project/Constant/Color.dart';
import 'package:top_care_graduation_project/Constant/PageName.dart';
import 'package:top_care_graduation_project/Models/PageViewModel.dart';
import 'package:top_care_graduation_project/Screens/Log_in.dart';
import 'package:top_care_graduation_project/Style/style.dart';

class OnBoarding extends StatelessWidget {
  var indexPageView = 0;

  var controller = PageController();

  List<PageViewModel> PageViewData = [
    PageViewModel(
        img: "calldoctor.webp",
        title: "Get a doctor easily for your disease ",
        disc:
            "you will find a great doctors and nurses,Every doctor here is with MBBS  ,all type of patients are served"),
    PageViewModel(
        img: "xray.png",
        title: "You can easily know the result of the chest x-ray ",
        disc:
            "You will upload the chest x-ray images then know the result of your x-ray and the doctor will see it"),
    PageViewModel(
        img: "doctor.webp",
        title: "Easily Know about your disease",
        disc:
            "learn about chest diseases such as pneumonia and everything new about the disease"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Expanded(
              flex: 3,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: PageViewData.length,
                itemBuilder: (context, index) {
                  return PageViewItem(
                      context: context, model: PageViewData[index]);
                },
                controller: controller,
                physics: BouncingScrollPhysics(),
                onPageChanged: (index) {
                  indexPageView = index;
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: SmoothPageIndicator(
                count: PageViewData.length,
                controller: controller,
                effect: ExpandingDotsEffect(
                  activeDotColor: CyneColorLight,
                  dotColor: GrayColorLight,
                  dotHeight: 10,
                  dotWidth: 10,
                  expansionFactor: 3,
                  spacing: 5,
                ),
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade200,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, LoginScreen);
                    },
                    child: CircleAvatar(
                      radius: 34,
                      backgroundColor: GrayColorLight,
                      child: Text(
                        "Skip",
                        style: txtStyle(Colors.white, 15.0, false),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: CyneColorLight,
                  ),
                  InkWell(
                    onTap: () {
                      if (indexPageView == PageViewData.length - 1) {
                        Navigator.pushReplacementNamed(context, LoginScreen);
                      }
                      controller.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    },
                    child: CircleAvatar(
                      radius: 34,
                      backgroundColor: blueColorLight,
                      child: Icon(
                        Icons.arrow_forward_ios_outlined,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
