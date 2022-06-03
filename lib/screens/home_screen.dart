import 'package:flutter/material.dart';
import 'package:hamo_home_service/constants/colors.dart';
import 'package:hamo_home_service/constants/dimensions.dart';
import 'package:hamo_home_service/constants/strings.dart';
import 'package:hamo_home_service/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> services = [all, repairing, cleaning, painting, plumbing, electrician];

  @override
  Widget build(BuildContext context) {
    var darkThemeProvider = Provider.of<DarkThemeProvider>(context);

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Theme.of(context).backgroundColor,
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.only(left: w5, right: w5),
              child: Column(
                children: [
                  SizedBox(height: h3,),
                  Row(
                    children: [
                      const CircleAvatar(backgroundImage: AssetImage("assets/images/avatar_image.webp"),),
                      SizedBox(width:w5,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(goodMorning, style: TextStyle(fontSize: sp10, color: Theme.of(context).textTheme.bodyText1!.color),),
                          Text(aloysius, style: TextStyle(fontSize: sp14, color: Theme.of(context).textTheme.bodyText1!.color, fontWeight: FontWeight.bold),)
                        ]
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () => darkThemeProvider.darkTheme = !darkThemeProvider.darkTheme,
                        child: Icon(darkThemeProvider.darkTheme ? Icons.light_mode : Icons.dark_mode)
                      ),
                    ],
                  ),
                  SizedBox(height: h3,),
                  Container(
                    height: h22,
                    width: w90,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w7),
                      color: offerBannerColor
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: expandedFlex5,
                          child: Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Spacer(),
                                Text(percent30, style: TextStyle(fontSize: sp30, fontWeight: FontWeight.bold, color: white),),
                                Text(todaySpecial, style: TextStyle(fontSize: sp13, fontWeight: FontWeight.bold, color: white),),
                                Text(getDiscount, style: TextStyle(fontSize: sp7, color: white),),
                                Text(orderOnlyValid, style: TextStyle(fontSize: sp7, color: white),),
                                const Spacer()
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: expandedFlex5,
                          child: Image.asset("assets/images/banner_image.png"),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: h3,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(service, style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color, fontWeight: FontWeight.bold, fontSize: sp12)),
                      const Spacer(),
                      Text(seeAll, style: TextStyle(color: offerBannerColor, fontWeight: FontWeight.bold, fontSize: sp9))
                    ]
                  ),
                  SizedBox(height: h3,),
                  GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: servicesRowCount,
                    ), 
                    itemCount: servicesTotalItem,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) => Column(
                      children: [
                        CircleAvatar(
                          child: const Icon(Icons.cleaning_services, color: offerBannerColor,),
                          backgroundColor: offerBannerColor.withOpacity(o0p2),
                        ),
                        SizedBox(height:h0p5),
                        Text(cleaning, style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color, fontWeight: FontWeight.bold, fontSize: sp9)),
                      ],
                    )
                  ),
                  Divider(color: greyShade700,),
                  SizedBox(height: h3,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(mostPopularService, style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color, fontWeight: FontWeight.bold, fontSize: sp12)),
                      const Spacer(),
                      Text(seeAll, style: TextStyle(color: offerBannerColor, fontWeight: FontWeight.bold, fontSize: sp9))
                    ]
                  ),
                  SizedBox(height: h3,),
                  SizedBox(
                    height: h5,
                    child: ListView.builder(
                      itemCount: mostPopularServicesCount,
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) => Padding(
                        padding: EdgeInsets.only(right: w2),
                        child: Container(
                          height: h3,
                          decoration: BoxDecoration(
                            border: Border.all(color: offerBannerColor, width: w0p5),
                            borderRadius: BorderRadius.circular(w4),
                            color: index==0 ? offerBannerColor : transparent
                          ),
                          child: Center(child: Padding(
                            padding: EdgeInsets.only(left: w5, right: w5),
                            child: Text(services[index], style: TextStyle(color: index==0 ? white : offerBannerColor, fontWeight: FontWeight.bold, fontSize: sp9),),
                          )),
                        ),
                      )
                    ),
                  ),
                  SizedBox(height: h3,),
                  ListView.builder(
                    itemCount: mostPopularServicesItem,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Container(
                            height: h20,
                            width: w90,
                            decoration: BoxDecoration(
                              color: greyShade200.withOpacity(darkThemeProvider.darkTheme ? o0p1 : o0p5),
                              borderRadius: BorderRadius.circular(w4)
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: w3,),
                                Container(
                                  height: h15,
                                  width: w36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(w3),
                                    image: const DecorationImage(image: AssetImage("assets/images/cleaner_service_image.webp"), fit: BoxFit.fill)
                                  ),
                                ),
                                SizedBox(width: w3,),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Spacer(),
                                    Text(name, style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color, fontSize: sp8)),
                                    Text(work, style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color, fontWeight: FontWeight.bold, fontSize: sp14)),
                                    Text(money, style: TextStyle(color: offerBannerColor, fontWeight: FontWeight.bold, fontSize: sp16)),
                                    const Spacer()
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: h2,)
                        ],
                      );
                    }
                  ),
                  SizedBox(height: h3,)
                ],
              ),
            ),
          )
        ),
      )
    );
  }
}