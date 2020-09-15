import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_travel_app/repository/repository.dart';
import 'package:flutter_travel_app/screens/pages/my_trip_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _searchController = TextEditingController();
  final _popularCities = TravelRepository.popularCities;
  final _friends = TravelRepository.friends;
  final _trendingData = TravelRepository.trendingData;

  @override
  void dispose() {
    _searchController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              _headerWidget(),
              SizedBox(
                height: 15,
              ),
              _searchWidget(),
              SizedBox(
                height: 15,
              ),
              _bodyContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
          "Explore Cities",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MyTripPage(),
              ),
            );
          },
          child: Image.asset("assets/menu.png"),
        ),
      ],
    );
  }

  Widget _searchWidget() {
    return Container(
      height: 45,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(.2),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(
          hintText: "Search...",
          border: InputBorder.none,
          suffixIcon: Icon(Icons.mic),
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }

  Widget _bodyContent() {
    return Column(
      children: <Widget>[
        _popularCitiesWidget(),
        SizedBox(
          height: 10,
        ),
        _friendListWidget(),
        SizedBox(
          height: 10,
        ),
        _trendingListWidget(),
        SizedBox(
          height: 10,
        ),
        _travelWithFriendListWidget(),
      ],
    );
  }

  Widget _popularCitiesWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Popular Cities",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("View All",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black.withOpacity(.3))),
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          height: 210,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _popularCities.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return Container(
                width: 180,
                height: 180,
                margin: EdgeInsets.only(right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          width: 180,
                          height: 180,
                          child: ClipRRect(
                              borderRadius: BorderRadius.all(
                                Radius.circular(15),
                              ),
                              child: Image.asset(
                                _popularCities[index].image,
                                fit: BoxFit.cover,
                              )),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Text(
                              "${_popularCities[index].caption}",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(.4)),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0.0,
                          right: 0.0,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.deepOrange.withOpacity(.6),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            padding: EdgeInsets.symmetric(
                                horizontal: 8, vertical: 8),
                            child: Text(
                              "${_popularCities[index].activeFriends} Active Friends",
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.black.withOpacity(.8)),
                            ),
                          ),
                        )
                      ],
                    ),
                    Text(
                      "${_popularCities[index].name}",
                      textAlign: TextAlign.start,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  _friendListWidget() {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            height: 55,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _friends.length,
              shrinkWrap: true,
              itemBuilder: (_, index) {
                return Container(
                  margin: EdgeInsets.only(right: 15.0),
                  height: 55,
                  width: 55,
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: Colors.black.withOpacity(.2), width: 2),
                      borderRadius: BorderRadius.all(Radius.circular(35))),
                  child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: Image.asset(
                        _friends[index].image,
                        fit: BoxFit.cover,
                      )),
                );
              },
            ),
          ),
        ),
        Container(
          height: 30,
          width: 30,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        )
      ],
    );
  }

  _travelWithFriendListWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Travel with Friends",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Text("View All",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black.withOpacity(.3))),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 55,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: _friends.length,
            shrinkWrap: true,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.only(right: 15.0),
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    border: Border.all(
                        color: Colors.black.withOpacity(.2), width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(35))),
                child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    child: Image.asset(
                      _friends[index].image,
                      fit: BoxFit.cover,
                    )),
              );
            },
          ),
        ),
      ],
    );
  }

  _trendingListWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Trending Places",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text("View All",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.black.withOpacity(.3))),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 160,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: _trendingData.length,
            itemBuilder: (_, index) {
              return Container(
                margin: EdgeInsets.only(right: 15),
                height: 160,
                width: 160,
                child: Image.asset(
                  _trendingData[index].image,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
