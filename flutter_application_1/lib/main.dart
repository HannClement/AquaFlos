import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

//String tersebut berisi link image dari carousel
List<String> imgList = [
  'https://th.bing.com/th/id/OIP.Bt75VLJFe5MSrHOZNGt9qwHaEK?w=327&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  'https://th.bing.com/th/id/OIP.dZBs9Tn3DBWx9Shq3gzcIwHaE8?w=327&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
  'https://th.bing.com/th/id/OIP.5SXmLbT4j-oGi1nakw6dggHaEo?w=327&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7'
];

//Data Jenis Makanan Carousel
List<String> namaCarouselRestaurant = [
  'Italian',
  'British',
  'Japanese'
];

//Struct Data Menu
class menu {
  final String urlImage;
  final String title;
  final String subtitle;

  const menu({
    required this.urlImage,
    required this.title,
    required this.subtitle
  });
}

//Data Menu Most Popular
List<menu> dataMenuPopular = [
  menu(
    urlImage:
      'https://th.bing.com/th/id/OIP.B-Wi1mJOIJ0Qhixs7LtNbQHaE7?w=311&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    title: 'Mirazur',
    subtitle: 'Menton, France',
  ),
  menu(
    urlImage:
      'https://th.bing.com/th/id/OIP.X-c4h-3sFIVMaX8IjUiXHwHaE8?w=311&h=203&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    title: 'Pujol',
    subtitle: 'Tennyson, Mexico',
  ),
  menu(
    urlImage:
      'https://th.bing.com/th/id/OIP.c2ZMPXdCcMNTi1jD6ppu-QHaE3?w=311&h=194&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    title: 'White Rabbit',
    subtitle: 'Moscow, Russia',
  ),
  menu(
    urlImage:
      'https://th.bing.com/th/id/OIP.xek42n6Yk2prbDHQc2E4sAHaE7?w=311&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    title: 'Central',
    subtitle: 'Lima, Peru',
  ),
  menu(
    urlImage:
      'https://th.bing.com/th/id/OIP.yp8uyHLy7H-4aHznDasWTgHaE8?w=311&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    title: 'Attica',
    subtitle: 'Melbourne, Australia',
  ),
  menu(
    urlImage:
      'https://th.bing.com/th/id/OIP.IMqAbRP-_FK9RaMOJHElRgHaHa?w=311&h=180&c=7&r=0&o=5&dpr=1.3&pid=1.7',
    title: 'Alinea',
    subtitle: 'Chicago, United States',
  ),
];

//Data Menu Meal Deals
List<menu> dataMealDeals = [

];

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

  //Function create menu slider
    Widget sliderCardMenu({
      required menu item,
    }) => 
    Container(
      width: 200,
      child: Column(
        children: [
          Expanded(
          child: AspectRatio(
            aspectRatio: 4 / 3,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: Image.network(
                item.urlImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          item.title,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        Text(
          item.subtitle,
          style: TextStyle(fontSize: 18, color: Colors.black),
          ),
        ],
      ),
    );

    return MaterialApp(
      title: "Flos Aquae",
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Text(
              'Flos Aquae',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30.0,
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              
            //Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                child: TextField(
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    hintText: "Search For Restaurant",
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),

              SizedBox(height: 10.0,),

            //Carousel
              Container(
                height: 200,
                child: CarouselSlider(
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    viewportFraction: 1
                  ),
                  items: imgList.map(
                    (item) {
                      int index = imgList.indexOf(item);
                      String restaurantName = "";

                      if (index != -1 && index < namaCarouselRestaurant.length) {
                        restaurantName = namaCarouselRestaurant[index];
                      }

                      return Container(
                        child: Container(
                          margin: EdgeInsets.all(5.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                            child: Stack(
                              children: <Widget>[
                                Image.network(item, fit: BoxFit.fill),
                                Positioned(
                                  bottom: 0.0,
                                  left: 0.0,
                                  right: 0.0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(200, 0, 0, 0),
                                          Color.fromARGB(0, 0, 0, 0)
                                        ],
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                      ),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10.0, horizontal: 20.0),
                                    child: Text(
                                      '$restaurantName Style',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ).toList(),
                ),
              ),

            //Title Most Popular and See All
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Most Popular",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        
                      },
                      child: Text(
                        "See All",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                          color: Colors.greenAccent,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 5.0),

            //Listview Most Popular
              Container(
                height: 256,
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 6,
                  separatorBuilder: (context, _) => SizedBox(width: 12),
                  itemBuilder: (context, index) => sliderCardMenu(item: dataMenuPopular[index]),
                ),
              ),

              SizedBox(height: 5.0),

            //Title Meal Deals
              Align(
                alignment: Alignment.centerLeft, // Menyusun teks ke kiri
                child: Padding(
                  padding: const EdgeInsets.only(top: 15.0, left: 25.0), // Menambahkan padding hanya di atas dan kiri
                  child: Text(
                    "Meal Deals",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ),

          //listview Meal Deals
            // Container(
            //     height: 256,
            //     padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //     child: ListView.separated(
            //       scrollDirection: Axis.horizontal,
            //       shrinkWrap: true,
            //       itemCount: 6,
            //       separatorBuilder: (context, _) => SizedBox(width: 12),
            //       itemBuilder: (context, index) => cardList(item: dataMenuRestaurant[index]),
            //     ),
            //   ),

            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home),
            ),
            BottomNavigationBarItem(
              label: "Discovery",
              icon: Icon(Icons.location_city),
            ),
            BottomNavigationBarItem(
              label: "Bookmark",
              icon: Icon(Icons.bookmark),
            ),
            BottomNavigationBarItem(
              label: "Top Foodie",
              icon: Icon(Icons.emoji_events),
            ),
            BottomNavigationBarItem(
              label: "Profile",
              icon: Icon(Icons.person),
            ),
          ],
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
        ),
      ),
    );
  }
}