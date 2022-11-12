import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:top_care_graduation_project/Data/Models/PageViewModel.dart';
import 'package:top_care_graduation_project/Presentaion/Shared_Components/PageViewItem.dart';
import 'package:top_care_graduation_project/Resource/Asset_Manager/Asset_Manager.dart';
import 'package:top_care_graduation_project/Resource/Color_Manager/Color_Manager.dart';
import 'package:top_care_graduation_project/Resource/Routes/Routes.dart';
import 'package:top_care_graduation_project/Resource/String_Manager/String_Manager.dart';
import 'package:top_care_graduation_project/Resource/Theme/Light_Theme.dart';

class OnBoarding extends StatelessWidget {
  //to navigator to login screen on last pageview
  var indexPageView = 0;

  var controller = PageController();

  List<PageViewModel> PageViewData = [
    PageViewModel(
      img: AssetManager.onBord1,
      title: StringManager.onBordTitle1,
      disc:
      StringManager.onBordDis1,
      Hsize: 2.5,
    ),
    PageViewModel(
      img: AssetManager.onBord2,
      title: StringManager.onBordTitle2,
      disc:
      StringManager.onBordDis2,
      Hsize: 3,
    ),
    PageViewModel(
      img:AssetManager.onBord3,
      title: StringManager.onBordTitle3,
      disc:
      StringManager.onBordDis3,
      Hsize: 2.5,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            Expanded(
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
            SmoothPageIndicator(
              count: PageViewData.length,
              controller: controller,
              effect: ExpandingDotsEffect(
                activeDotColor: ColorManager.CyneColorLight,
                dotColor:ColorManager.GrayColorLight,
                dotHeight: 10,
                dotWidth: 10,
                expansionFactor: 3,
                spacing: 5,
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
                      Navigator.pushReplacementNamed(context, RouteGenerator.LoginRoute);
                    },
                    child: CircleAvatar(
                      radius: 34,
                      backgroundColor: ColorManager.GrayColorLight,
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
                    backgroundColor: ColorManager.CyneColorLight,
                  ),
                  InkWell(
                    onTap: () {
                      if (indexPageView == PageViewData.length - 1) {
                        Navigator.pushReplacementNamed(context, RouteGenerator.LoginRoute);
                      }
                      controller.nextPage(
                          duration: Duration(
                            milliseconds: 750,
                          ),
                          curve: Curves.fastLinearToSlowEaseIn);
                    },
                    child: CircleAvatar(
                      radius: 34,
                      backgroundColor: ColorManager.blueColorLight,
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
