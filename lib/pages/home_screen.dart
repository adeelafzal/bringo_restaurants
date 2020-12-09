import 'package:bringo_restaurants/models/deals.dart';
import 'package:bringo_restaurants/widget/category_item.dart';
import 'package:bringo_restaurants/widget/deals_item.dart';
import 'package:bringo_restaurants/widget/title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> catTitleList = [
    'Food',
    'Tiffin',
    'Grocery',
    'Pharma',
    'Errand',
  ];
  List<IconData> catIconList = [
    Icons.fastfood,
    Icons.storage,
    Icons.local_grocery_store,
    Icons.local_pharmacy,
    Icons.directions_bike,
  ];

  List<String> sliderImages = [
    'https://s3.envato.com/files/139731804/Preview%20Files/003_1200x628%20copy.jpg',
    'https://img.freepik.com/free-psd/food-menu-delicious-burger-web-banner-template_106176-320.jpg?size=626&ext=jpg',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/pizza-banner-design-template-5623a47ee70d2ca4f3a4eca9c19a8039_screen.jpg?ts=1572691129',
    'https://d1csarkz8obe9u.cloudfront.net/posterpreviews/burgers-banner-design-template-fa86377c72837f4976c1beb08445c1bb_screen.jpg?ts=1566575343',
    'https://codecanyon.img.customer.envatousercontent.com/files/200040760/preview.jpg?auto=compress%2Cformat&q=80&fit=crop&crop=top&max-h=8000&max-w=590&s=3a7231160dd51b6a8698873a115f621e',
  ];

  List<Deals> dealsList = [
    Deals(
        duration: '47 mins',
        title: 'Pizza Hut',
        detail: '✔️ 2 Regular Pizza ✔️ Free Upgrade to 2.5 Liter XXL',
        imageurl:
            'https://www.trendinginsocial.com/wp-content/uploads/2016/09/Pair-Deal.jpg',
        type: 'Rs.73/- Delivery',
        rating: '4.0',
        distance: '1.6 Km',
        totalRate: '11'),
    Deals(
        duration: '1 hr',
        title: 'McDonalds Clubhouse Beef',
        detail: '✔️ A Family Feast for Rs.799/-',
        imageurl:
            'https://4.bp.blogspot.com/-2IhKP3eruw8/TuH2_KwMYFI/AAAAAAAAANw/pNbqT4u3xTo/s1600/McDonald%25E2%2580%2599s-Jumbo-Deal-A-Family-Feast-for-799.jpg.jpg',
        type: 'Free Delivery',
        rating: '4.8',
        distance: '2.0 Km',
        totalRate: '40'),
    Deals(
        duration: '30 mins',
        title: 'KFC',
        detail: '✔️ Great value ✔️ Great Krunch in only Rs.300/-',
        imageurl: 'http://brandspakistan.pk/images/Deals/Deals246image11.jpg',
        type: 'Rs.73/- Delivery',
        rating: '4.5',
        distance: '5.0 Km',
        totalRate: '30'),
    Deals(
        duration: '47 mins',
        title: 'Pizza Hut',
        detail: '✔️ 2 Regular Pizza ✔️ Free Upgrade to 2.5 Liter XXL',
        imageurl:
            'https://www.trendinginsocial.com/wp-content/uploads/2016/09/Pair-Deal.jpg',
        type: 'Rs.73/- Delivery',
        rating: '4.0',
        distance: '1.6 Km',
        totalRate: '11'),
    Deals(
        duration: '1 hr',
        title: 'McDonalds Clubhouse Beef',
        detail: '✔️ A Family Feast for Rs.799/-',
        imageurl:
            'https://4.bp.blogspot.com/-2IhKP3eruw8/TuH2_KwMYFI/AAAAAAAAANw/pNbqT4u3xTo/s1600/McDonald%25E2%2580%2599s-Jumbo-Deal-A-Family-Feast-for-799.jpg.jpg',
        type: 'Free Delivery',
        rating: '4.8',
        distance: '2.0 Km',
        totalRate: '40'),
    Deals(
        duration: '30 mins',
        title: 'KFC',
        detail: '✔️ Great value ✔️ Great Krunch in only Rs.300/-',
        imageurl: 'http://brandspakistan.pk/images/Deals/Deals246image11.jpg',
        type: 'Rs.73/- Delivery',
        rating: '4.5',
        distance: '5.0 Km',
        totalRate: '30'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Card(
          elevation: 3,
          margin: EdgeInsets.only(left: 0, bottom: 4),
          child: Container(
            height: 85,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: catTitleList.length,
              itemBuilder: (context, index) => CategoryItem(
                title: catTitleList[index],
                icon: catIconList[index],
              ),
            ),
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 200,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        color: Colors.transparent,
                        elevation: 3,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            sliderImages[index],
                            fit: BoxFit.fill,
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.grey,
                                  value: loadingProgress.expectedTotalBytes !=
                                          null
                                      ? loadingProgress.cumulativeBytesLoaded /
                                          loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                    autoplay: true,
                    itemCount: sliderImages.length,
                    pagination: SwiperPagination(),
                  ),
                ),
                TitleWidget(
                  title: 'Featured',
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return DealsItem(
                        duration: dealsList[index].duration,
                        title: dealsList[index].title,
                        detail: dealsList[index].detail,
                        imageurl: dealsList[index].imageurl,
                        type: dealsList[index].type,
                        rating: dealsList[index].rating,
                        distance: dealsList[index].distance,
                        totalRate: dealsList[index].totalRate,
                      );
                    },
                    itemCount: dealsList.length,
                  ),
                ),
                TitleWidget(
                  title: 'Deals',
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return DealsItem(
                        duration: dealsList[index].duration,
                        title: dealsList[index].title,
                        detail: dealsList[index].detail,
                        imageurl: dealsList[index].imageurl,
                        type: dealsList[index].type,
                        rating: dealsList[index].rating,
                        distance: dealsList[index].distance,
                        totalRate: dealsList[index].totalRate,
                      );
                    },
                    itemCount: dealsList.length,
                  ),
                ),
                TitleWidget(
                  title: 'All Restaurants',
                ),
                ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemBuilder: (context, index) {
                    return DealsItem(
                      duration: dealsList[index].duration,
                      title: dealsList[index].title,
                      detail: dealsList[index].detail,
                      imageurl: dealsList[index].imageurl,
                      type: dealsList[index].type,
                      rating: dealsList[index].rating,
                      distance: dealsList[index].distance,
                      totalRate: dealsList[index].totalRate,
                      isAllRestaurants: true,
                    );
                  },
                  itemCount: dealsList.length,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
