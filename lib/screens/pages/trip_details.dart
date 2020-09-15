import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_travel_app/repository/repository.dart';

class TripDetails extends StatefulWidget {
  final String image;
  final String location;
  final String date;

  const TripDetails({Key key, this.image, this.location, this.date})
      : super(key: key);

  @override
  _TripDetailsState createState() => _TripDetailsState();
}

class _TripDetailsState extends State<TripDetails> {
  final _myTrips = TravelRepository.myTrips;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            _headerWidget(),
            _bodyContent(),
          ],
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Stack(
      children: <Widget>[
        Container(
          height: 180,
          child: Image.asset('assets/cover.png'),
        ),
        Container(
          margin: EdgeInsets.only(top: 35, right: 10, left: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "Trip Details",
                    style: TextStyle(fontSize: 22, color: Colors.black),
                  ),
                  InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.location,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _bodyContent() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Container(
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _myTrips.length,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.only(right: 15),
                  height: 160,
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(15),
                    ),
                    child: Image.asset(
                      _myTrips[index].image,
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "My First Visit To ${widget.location}",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          Text(
            "Lorem Ipsum - ${widget.date}",
            style: TextStyle(
              color: Colors.black.withOpacity(.6),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
            style: TextStyle(
              color: Colors.black.withOpacity(.6),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 160,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
              child: Image.asset(
                widget.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently",
            style: TextStyle(
              color: Colors.black.withOpacity(.6),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 40,
            width: 120,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: Colors.black.withOpacity(.1)),
            child: Text(
              "Read more..",
              style: TextStyle(color: Colors.black),
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
