import 'package:flutter/material.dart';

import 'data/on_bording_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
 late List<OnBoardingModel> onBoardingModellist ;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() {
    onBoardingModellist = [
      OnBoardingModel(image: "assets/images/onboardingone.png", title: "title one ", discription: "discription one") ,
      OnBoardingModel(image: "assets/images/onboardingtwo.png", title: "title two ", discription: "discription two") ,
      OnBoardingModel(image: "assets/images/onboardingthree.png", title: "title three ", discription: "discription three") ,
    ];
  }




  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // اتجاه الرئيسي
          crossAxisAlignment: CrossAxisAlignment.end, //  عكس الاتجاه الرئيسي
          children: [


            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple),
                onPressed: () {},
                child: Text(
                  "skip",
                  style: TextStyle(color: Colors.white),
                )),
            Expanded(
                flex: 3,
                child: PageView.builder(
                    itemCount: onBoardingModellist.length,
                    itemBuilder: (BuildContext cont, int index) {
                      return Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(onBoardingModellist[index].image),

                            Text(onBoardingModellist[index].title , style: TextStyle(fontSize: 24  ,color: Colors.grey),) ,
                            SizedBox(
                              height: 5,
                            ) ,
                            Text(onBoardingModellist[index].discription ,style: TextStyle(fontSize: 25),) ,

                          ],
                        ),

                      );
                    })),
            Expanded(
                child: Container(
              color: Colors.green,
            ))
          ],
        ));
  }
}
// on click
// buttom
//text button
// InkWell
