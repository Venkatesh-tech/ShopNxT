import 'package:carousel_slider/carousel_slider.dart';
import 'package:shopnxt/model/categoryicon.dart';
import 'package:shopnxt/model/usermodel.dart';
import 'package:shopnxt/screens/about.dart';
import 'package:shopnxt/screens/checkout.dart';

import 'package:shopnxt/screens/contactus.dart';
import 'package:shopnxt/screens/privacy_policy.dart';

import 'package:shopnxt/screens/profilescreen.dart';

import '../provider/product_provider.dart';
import '../provider/category_provider.dart';
import 'package:shopnxt/screens/detailscreen.dart';
import 'package:shopnxt/screens/listproduct.dart';
import 'package:shopnxt/widgets/singeproduct.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/product.dart';
import '../widgets/notification_button.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Product menData;
CategoryProvider categoryProvider;
ProductProvider productProvider;

Product womenData;

Product bulbData;

Product smartPhoneData;

class _HomePageState extends State<HomePage> {
  Widget _buildCategoryProduct({String image, int color}) {
    return CircleAvatar(
      maxRadius: height * 0.1 / 2.1,
      backgroundColor: Color(color),
      child: Container(
        height: 40,
        child: Image(
          color: Colors.white,
          image: NetworkImage(image),
        ),
      ),
    );
  }

  double height, width;
  bool homeColor = true;

  bool checkoutColor = false;

  bool aboutColor = false;

  bool contactUsColor = false;
  bool profileColor = false;
  MediaQueryData mediaQuery;
  Widget _buildUserAccountsDrawerHeader() {
    List<UserModel> userModel = productProvider.userModelList;
    return Column(
        children: userModel.map((e) {
      return UserAccountsDrawerHeader(
        accountName: Text(
          e.userName,
          style: TextStyle(color: Colors.black),
        ),
        currentAccountPicture: CircleAvatar(
          backgroundColor: Colors.white,
          backgroundImage: e.userImage == null
              ? AssetImage("images/UserImage.jfif")
              : NetworkImage(e.userImage),
        ),
        decoration: BoxDecoration(color: Colors.blue[100]),
        accountEmail: Text(
          e.userEmail,
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
      );
    }).toList());
  }

  Widget _buildMyDrawer() {
    return Drawer(
      child: ListView(
        children: <Widget>[
          _buildUserAccountsDrawerHeader(),
          ListTile(
            selected: homeColor,
            onTap: () {
              setState(() {
                homeColor = true;
                contactUsColor = false;
                checkoutColor = false;
                aboutColor = false;
                profileColor = false;
              });
            },
            leading: Icon(Icons.home),
            title: Text("My Home"),
          ),
          ListTile(
            selected: profileColor,
            onTap: () {
              setState(() {
                aboutColor = false;
                contactUsColor = false;
                homeColor = false;
                profileColor = true;
                checkoutColor = false;
              });
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (ctx) => ProfileScreen(),
                ),
              );
            },
            leading: Icon(Icons.person, color: Colors.black),
            title: Text("My Profile"),
          ),
          ListTile(
            selected: checkoutColor,
            onTap: () {
              setState(() {
                checkoutColor = true;
                contactUsColor = false;
                homeColor = false;
                profileColor = false;
                aboutColor = false;
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => CheckOut()));
            },
            leading: Icon(Icons.shopping_cart, color: Colors.yellow[500]),
            title: Text("My Cart"),
          ),
          ListTile(
            selected: aboutColor,
            onTap: () {
              setState(() {
                aboutColor = true;
                contactUsColor = false;
                homeColor = false;
                profileColor = false;
                checkoutColor = false;
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => About()));
            },
            leading: Icon(Icons.info, color: Colors.orange),
            title: Text("About Us"),
          ),
          ListTile(
            selected: contactUsColor,
            onTap: () {
              setState(() {
                contactUsColor = true;
                checkoutColor = false;
                profileColor = false;
                homeColor = false;
                aboutColor = false;
              });
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => ContactUs()));
            },
            leading: Icon(Icons.phone, color: Colors.green),
            title: Text("Contant Us"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => Privacy()));
            },
            leading: Icon(
              Icons.privacy_tip,
              color: Colors.red,
            ),
            title: Text("Privacy Policy"),
          ),
          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
            leading: Icon(Icons.logout_outlined, color: Colors.purple),
            title: Text("Logout"),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSlider() {
    return Container(
      height: height * 0.3,
      child: CarouselSlider(
        items: [
          //1st Image of Slider
          Container(
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage("images/offer2.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //2nd Image of Slider
          Container(
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage("images/offer1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //3rd Image of Slider
          Container(
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage("images/offer3.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //4th Image of Slider
          Container(
            margin: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage("images/offer4.jpeg"),
                fit: BoxFit.cover,
              ),
            ),
          ),

          //5th Image of Slider
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage("images/offer5.jfif"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                image: DecorationImage(
                  image: AssetImage("images/offer6.webp"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],

        //Slider Container properties
        options: CarouselOptions(
          viewportFraction: 1.0,
          height: 250.0,
          autoPlay: true,
          autoPlayCurve: Curves.fastLinearToSlowEaseIn,
          enableInfiniteScroll: true,
          autoPlayAnimationDuration: Duration(milliseconds: 800),
        ),
      ),
    );
  }

  Widget _buildDressIcon() {
    List<CategoryIcon> dressIcon = categoryProvider.getDressIcon;
    List<Product> dress = categoryProvider.getDressList;
    return Row(
        children: dressIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Dress",
                snapShot: dress,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(image: e.image, color: 0xff000000),
      );
    }).toList());
  }

  Widget _buildShirtIcon() {
    List<Product> shirts = categoryProvider.getShirtList;
    List<CategoryIcon> shirtIcon = categoryProvider.getShirtIconData;
    return Row(
        children: shirtIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Shirt",
                snapShot: shirts,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(image: e.image, color: 0xff000080),
      );
    }).toList());
  }

  Widget _buildShoeIcon() {
    List<CategoryIcon> shoeIcon = categoryProvider.getShoeIcon;
    List<Product> shoes = categoryProvider.getshoesList;
    return Row(
        children: shoeIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Shoes",
                snapShot: shoes,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(
          image: e.image,
          color: 0xffFF0000,
        ),
      );
    }).toList());
  }

  Widget _buildPantIcon() {
    List<CategoryIcon> pantIcon = categoryProvider.getPantIcon;
    List<Product> pant = categoryProvider.getPantList;
    return Row(
        children: pantIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Pant",
                snapShot: pant,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(
          image: e.image,
          color: 0xffC0C0C0,
        ),
      );
    }).toList());
  }

  Widget _buildTieIcon() {
    List<CategoryIcon> tieIcon = categoryProvider.getTieIcon;
    List<Product> tie = categoryProvider.getTieList;
    return Row(
        children: tieIcon.map((e) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (ctx) => ListProduct(
                name: "Tie",
                snapShot: tie,
              ),
            ),
          );
        },
        child: _buildCategoryProduct(
          image: e.image,
          color: 0xff00FF00,
        ),
      );
    }).toList());
  }

  Widget _buildCategory() {
    return Column(
      children: <Widget>[
        Container(
          height: height * 0.1 - 30,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Categories",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          height: 60,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              Row(
                children: <Widget>[
                  _buildDressIcon(),
                  _buildShirtIcon(),
                  _buildShoeIcon(),
                  _buildPantIcon(),
                  _buildTieIcon(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFeature() {
    List<Product> featureProduct;

    featureProduct = productProvider.getFeatureList;

    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Suggested",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 17,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (ctx) => ListProduct(
                      name: "Suggested",
                      isCategory: false,
                      snapShot: featureProduct,
                    ),
                  ),
                );
              },
              child: Text(
                "View more",
                style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 17,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
        Row(
          children: productProvider.getHomeFeatureList.map((e) {
            return Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (ctx) => DetailScreen(
                              image: e.image,
                              price: e.price,
                              name: e.name,
                            ),
                          ),
                        );
                      },
                      child: SingleProduct(
                        image: e.image,
                        price: e.price,
                        name: e.name,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => DetailScreen(
                              image: e.image, price: e.price, name: e.name),
                        ),
                      );
                    },
                    child: SingleProduct(
                      image: e.image,
                      price: e.price,
                      name: e.name,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildNewAchives() {
    List<Product> newAchivesProduct = productProvider.getNewAchiesList;
    return Column(
      children: <Widget>[
        Container(
          height: height * 0.1 - 30,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Latest Products",
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (ctx) => ListProduct(
                            name: "Electronics",
                            isCategory: false,
                            snapShot: newAchivesProduct,
                          ),
                        ),
                      );
                    },
                    child: Text(
                      "View more",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: 17,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        Row(
            children: productProvider.getHomeAchiveList.map((e) {
          return Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushReplacement(
                                  MaterialPageRoute(
                                    builder: (ctx) => DetailScreen(
                                      image: e.image,
                                      price: e.price,
                                      name: e.name,
                                    ),
                                  ),
                                );
                              },
                              child: SingleProduct(
                                  image: e.image, price: e.price, name: e.name),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (ctx) => DetailScreen(
                                    image: e.image,
                                    price: e.price,
                                    name: e.name,
                                  ),
                                ),
                              );
                            },
                            child: SingleProduct(
                                image: e.image, price: e.price, name: e.name),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          );
        }).toList()),
      ],
    );
  }

  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  void getCallAllFunction() {
    categoryProvider.getShirtData();
    categoryProvider.getDressData();
    categoryProvider.getShoesData();
    categoryProvider.getPantData();
    categoryProvider.getTieData();
    categoryProvider.getDressIconData();
    productProvider.getNewAchiveData();
    productProvider.getFeatureData();
    productProvider.getHomeFeatureData();
    productProvider.getHomeAchiveData();
    categoryProvider.getShirtIcon();
    categoryProvider.getshoesIconData();
    categoryProvider.getPantIconData();
    categoryProvider.getTieIconData();
    productProvider.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    categoryProvider = Provider.of<CategoryProvider>(context);
    productProvider = Provider.of<ProductProvider>(context);
    getCallAllFunction();
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      key: _key,
      drawer: _buildMyDrawer(),
      appBar: AppBar(
        title: Text(
          "ShopNxT",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Color(0xff0C73EB),
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              _key.currentState.openDrawer();
            }),
        actions: <Widget>[
          NotificationButton(),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 18),
        child: ListView(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _buildImageSlider(),
                  _buildCategory(),
                  SizedBox(
                    height: 20,
                  ),
                  _buildFeature(),
                  _buildNewAchives()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
