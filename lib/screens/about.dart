import 'dart:ui';

import 'package:shopnxt/screens/homepage.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (ctx) => HomePage()));
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\t\tAbout Us"),
          backgroundColor: Color(0xff0C73EB),
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => HomePage()));
            },
            child: Icon(
              Icons.arrow_back_sharp,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 27),
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image(
                image: AssetImage("images/shopping.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 280,
                width: 360,
                child: Wrap(
                  children: [
                    Text(
                      "We are maximisers. We're out on our own journeys to maximise - be the best at what we choose and care about the most - whether it be our impact, voice, potential, ideas, influence, well-being or more. Because when we maximise ourselves in our inclusive teams, ShopNxt is able to deliver the best imaginable value for our customers, stakeholders and the planet!",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
