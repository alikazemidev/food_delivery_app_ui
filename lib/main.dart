import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:food_delivery_app_ui/screens/detail_screen.dart';

import './widgets/mydrawer.dart';

void main() {
  runApp(Application());
}

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'vazir',
        textTheme: TextTheme(
          headline1: TextStyle(
            fontFamily: 'vazir',
            fontSize: 18,
            fontWeight: FontWeight.w900,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontFamily: 'vazir',
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w300,
          ),
          bodyText1: TextStyle(
            fontFamily: 'vazir',
            fontSize: 13,
            color: Color(0xff767676),
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa', ''), // farsi
      ],
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.grey,
          size: 30,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'images/logo.png',
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.shopping_cart_outlined,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: 35,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //* search_bar
              ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: TextField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(15),
                    suffixIcon: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18.0),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 30,
                      ),
                    ),
                    fillColor: Color(0xffF5F6F1),
                    filled: true,
                    hintText: 'جستجو',
                    hintStyle: TextStyle(
                      color: Color(0xff7E7E7E),
                      fontSize: 13,
                    ),
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(height: 30),
              Text('دسته بندی ها',
                  style: Theme.of(context).textTheme.headline1),
              SizedBox(height: 20),
              // * category Row
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // * category Row item
                    CategoryRowItem(title: 'پاستا', imageName: 'pasta'),
                    CategoryRowItem(title: 'پیتزا', imageName: 'pizza'),
                    CategoryRowItem(title: 'برگر', imageName: 'burger'),
                    CategoryRowItem(title: 'پاستا', imageName: 'pasta'),
                    CategoryRowItem(title: 'پیتزا', imageName: 'pizza'),
                    CategoryRowItem(title: 'برگر', imageName: 'burger'),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Text('پیشنهادها', style: Theme.of(context).textTheme.headline1),
              SizedBox(height: 10),
              //* offer cards
              Column(
                children: [
                  OfferCard(
                    title: 'پیتزا اسپشیال',
                    description:
                        'موزارلا، فلفل دلمه ای رنگی، ژامبون بیکن، قارچ، پنیر گودا، پنیر،سس گوجه فرنگی، ژامبون ایتالیایی،خمیر پیتزا ایتالیایی ۳۰ سانتی متری،',
                    imageName: 'pepperoni',
                    price: 170,
                  ),
                  OfferCard(
                    title: 'پیتزا سبزیجات',
                    description:
                        'پنیر ماتزارالا کدو گریل شده، قارچ، فلفل دلمه، پیاز ،خمیر پیتزا ایتالیایی ۳۰ سانتی متری،',
                    imageName: 'vegetarian',
                    price: 129,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      // *navbar
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => DetailScreen()),
                  ),
                );
              },
              child: Image.asset('images/Home.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => DetailScreen()),
                    ),
                  );
                },
                child: Image.asset('images/Order.png')),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => DetailScreen()),
                    ),
                  );
                },
                child: Image.asset('images/User.png')),
            label: '',
          ),
        ],
      ),
    );
  }
}

// *OfferCard
class OfferCard extends StatelessWidget {
  final String? title;
  final String? description;
  final String? imageName;
  final double? price;

  OfferCard({
    required this.title,
    required this.description,
    required this.imageName,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title!,
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    SizedBox(height: 10),
                    Text(
                      description!,
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                    SizedBox(height: 15),
                    Text(
                      price!.toStringAsFixed(3),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Image.asset(
                      'images/$imageName.png',
                      fit: BoxFit.cover,
                    ),
                    SizedBox(height: 10),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        minimumSize: Size(150, 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(27.0),
                        ),
                        side: BorderSide(
                          color: Color(0xffFFB95B),
                        ),
                        primary: Color(0xffFFB95B),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Text('افزودن'),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// * category Row item widget
class CategoryRowItem extends StatelessWidget {
  final String? title;
  final String? imageName;

  CategoryRowItem({this.title, this.imageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      height: 170,
      width: 122,
      decoration: BoxDecoration(
        color: Color(0xffFFB95B),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.asset(
            'images/$imageName.png',
            height: 100,
            fit: BoxFit.cover,
          ),
          Text(
            title!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
