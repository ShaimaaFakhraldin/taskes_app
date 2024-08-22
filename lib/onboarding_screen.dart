import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:taskes_app/login_screen.dart';

import 'data/on_bording_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
 late List<OnBoardingModel> onBoardingModellist ;
 final controller = PageController(viewportFraction: 0.8, keepPage: true);

 int indexPage = 0;
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
                  controller: controller ,

                  onPageChanged: (int index){
                    print("index is $index");
                    setState(() {
                      indexPage = index ;
                    });

                  },
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
                child:   Stack(
                  clipBehavior: Clip.none,
                    fit: StackFit.expand,

                    children: [


                      Positioned.fill(

                          top: 20,
                          child:SvgPicture.asset(
                              "assets/images/battom_image.svg",
                              semanticsLabel: 'A red up arrow'
                          ) ) ,
                      PositionedDirectional(
                        bottom: 30,
                          start: 30,
                          child:Container(
                            child: Text("Back" ,style: TextStyle(fontSize: 20 ,color: Colors.white),),

                       ) ),
                      Positioned(
                        top: 0,
                         right: 0,
                         left: 0,
                         child:InkWell(
                           onTap: (){
                             /// add anther screen  in top of current screen
                             Navigator.push(context, MaterialPageRoute(builder: (BuildContext context){
                                return LoginScreen ();
                             })) ;
                             /// remove current screen and push new one
                             // Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context){
                             //    return LoginScreen ();
                             // })) ;
                             /// remove all Previous screen
                             // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                             //    return  LoginScreen();
                             // }), (Route<dynamic> route)  { return false ;});
                           },
                           child:
                         Container(
                          decoration: BoxDecoration(
                            color: Color(0xffB73B5E),
                            shape: BoxShape.circle
                          ),
                          height: 80,
                          width: 80,
                          margin: EdgeInsets.only(bottom: 10),
                           child: Icon(Icons.arrow_forward , color: Colors.white, size: 30,),
                        )),
                        
                      ) ,
                      Positioned(
                        bottom: 35,
                          right: 0,
                          left: 0,

                          child:
                      Align(
                          alignment: Alignment.center,
                          child:SmoothPageIndicator(
                           count:  onBoardingModellist.length,
                          effect:  WormEffect(
                            activeDotColor: Colors.white ,
                            dotColor: Colors.white60
                              ,dotWidth: 12,
                            dotHeight: 11
                          ),  // your preferred effect
                          onDotClicked: (index){
                          }, controller: controller,
                      )
                      ))



                    ],

             ))
          ],
        ));
  }
}


// on click
// buttom
//text button
// InkWell
