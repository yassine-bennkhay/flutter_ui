import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_uis/model/profile_data.dart';
import 'package:flutter_uis/widgets/chat_button.dart';
import 'package:flutter_uis/widgets/follow_button.dart';
import 'package:flutter_uis/widgets/image.dart';
import 'package:flutter_uis/widgets/rounded_container.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline6: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      home: Scaffold(
        body: ProfilePage(),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Profile profile = ProfileProvider.getProfile();
    return Stack(
      children: [
        Scaffold(),
        roundedContainer(context),
        profileContainer(context),
        Positioned(
          top: MediaQuery.of(context).size.height / 2.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14),
                child: Text(
                  'Photos(${profile.photos})',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Transform.translate(
          offset: Offset(0, MediaQuery.of(context).size.height / 1.9),
          child: Container(
            width: double.infinity,
            height: 100,

            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, index) =>SizedBox(  width: 10,),
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemCount: 3,
              itemBuilder: ( context,index) {
                return myImage(index);
              },
            ),
          ),
        ),
        Transform.translate(
          offset: Offset(0, MediaQuery.of(context).size.height / 1.45),
          child: Padding(
            padding: const EdgeInsets.only(left:15),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
             mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:20),
                    child: Container(
                      height: 50,
                      width: 150,
                      child: Center(
                        child: Text('Today\'s Quote',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                        ),),
                      ),
                      decoration: BoxDecoration(
                          color: Color(0xff3C646C),
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:20,top: 25),
                    child: Text(profile.user.quote,style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25,
                    ),),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                color: Color(0xff79949d),

                borderRadius: BorderRadius.circular(14)
              ),
              height:200,
              width:400,
            ),
          )
        ),
      ],
    );
  }

  Widget profileContainer(BuildContext context) {
    Profile profile = ProfileProvider.getProfile();
    return Positioned(
      left: 15,
      right: 15,
      top: MediaQuery.of(context).size.height * 0.10,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 5,
              blurRadius: 100,
              offset: Offset(0, 30), // changes position of shadow
            ),
          ],
        ),
        height: MediaQuery.of(context).size.height * 0.35,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                image(),
                SizedBox(
                  height: 16,
                ),
                chatButton(),
              ],
            ),
            /**/
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Text(
                    profile.user.name,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    profile.user.job,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xffF2F5FA),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    height: 80,
                    width: 200,
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 8.0, right: 8.0, top: 14),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Photos',
                                style: TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(profile.photos.toString(),
                                  style: Theme.of(context).textTheme.headline6),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Followers',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(profile.followers.toString(),
                                  style: Theme.of(context).textTheme.headline6),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Rating',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(profile.rating.toString(),
                                  style: Theme.of(context).textTheme.headline6),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                followButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
List<Image> images = [
  Image.asset("images/n3.png"),
  Image.asset("images/n1.png"),
  Image.asset("images/n2.png"),
];
Widget myImage(int index) {
  return Container(
    height: 100,
    width: 150,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      image: DecorationImage(image: images[index].image, fit: BoxFit.cover),
    ),
  );
}