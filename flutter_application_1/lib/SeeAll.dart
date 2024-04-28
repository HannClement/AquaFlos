import 'package:flutter/material.dart';

class SeeAll extends StatelessWidget {
  final List<dynamic> data;
  const SeeAll({Key? key, required this.data}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'See All',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25.0,
              color: Colors.black,
            ),
          ),
        ),
        leading: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      ),
      body: mySeeAll(data: data,),
    );
  }
}

class mySeeAll extends StatefulWidget {
  final List<dynamic> data;
  const mySeeAll({Key? key, required this.data}) : super(key: key);

  @override
  State<mySeeAll> createState() => mySeeAllState(data: data);
}

class mySeeAllState extends State<mySeeAll> {
  final List<dynamic> data;
  mySeeAllState({Key? key, required this.data});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              return Container(
                height: 70,
                alignment: Alignment.center,
                color: Colors.transparent,
                child: ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 40),
                  title: Text(widget.data[index].title),
                  subtitle: Text(widget.data[index].subtitle),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.network(widget.data[index].urlImage,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 100,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}