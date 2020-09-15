

import 'package:flutter_travel_app/model/friend_model.dart';
import 'package:flutter_travel_app/model/my_trip_model.dart';
import 'package:flutter_travel_app/model/popular_cities_model.dart';
import 'package:flutter_travel_app/model/trendingModel.dart';

class TravelRepository{


  static List<PopularCitiesModel> popularCities = [
    PopularCitiesModel(
      caption: "",
      name: "New York City",
      image: "assets/new_yark.jpg",
      activeFriends: "20.3k"
    ),
    PopularCitiesModel(
        caption: "",
        name: "Iceland",
        image: "assets/iceland.jpeg",
        activeFriends: "120.3k"
    ),
    PopularCitiesModel(
        caption: "",
        name: "Bangkok, Thailand",
        image: "assets/bangkok_thailand.jpg",
        activeFriends: "10.3k"
    ),
    PopularCitiesModel(
        caption: "",
        name: "Italy",
        image: "assets/italy.jpg",
        activeFriends: "120.3k"
    ),
    PopularCitiesModel(
        caption: "",
        name: "Netherlands",
        image: "assets/Netherlands.jpg",
        activeFriends: "61.3k"
    ),
    PopularCitiesModel(
        caption: "",
        name: "Aruba",
        image: "assets/Aruba.jpg",
        activeFriends: "21.3k"
    ),
    PopularCitiesModel(
        caption: "",
        name: "Disnay Magic",
        image: "assets/disnay_magic.jpeg",
        activeFriends: "121.3k"
    ),
  ];

  static List<FriendModel> friends=[
    FriendModel("assets/user1.jpg"),
    FriendModel("assets/user2.jpeg"),
    FriendModel("assets/user3.jpg"),
    FriendModel("assets/user4.jpg"),
    FriendModel("assets/user5.jpeg"),
    FriendModel("assets/user6.jpeg"),
    FriendModel("assets/user7.jpg"),
    FriendModel("assets/user8.jpg"),
  ];
  static List<TrendingModel> trendingData=[
    TrendingModel("assets/trend1.jpg"),
    TrendingModel("assets/trend2.jpg"),
    TrendingModel("assets/trend3.jpg"),
    TrendingModel("assets/trend4.jpg"),
    TrendingModel("assets/trend5.jpg"),
    TrendingModel("assets/trend6.jpg"),
  ];
  static List<MyTripModel> myTrips =[
    MyTripModel(
      image: "assets/mytrip1.png",
      title: "Best of Morocco",
      date: "2019/04/05",
      location: "Morocco",
      locationCap: "Morocco"
    ),
    MyTripModel(
      image: "assets/mytrip2.jpg",
      title: "Best of Liberia",
      date: "2019/12/21",
      location: "Liberia",
      locationCap: "Liberia"
    ),
    MyTripModel(
        image: "assets/mytrip3.jpg",
        title: "Best of Netherlands",
        date: "2016/12/21",
        location: "The Netherlands",
        locationCap: "Netherlands"
    ),
    MyTripModel(
        image: "assets/mytrip4.jpg",
        title: "Best of Costa Rica",
        date: "2018/11/21",
        location: "The Costa Rica",
        locationCap: "Costa Rica"
    ),
    MyTripModel(
        image: "assets/mytrip5.jpg",
        title: "Best of Aruba",
        date: "2018/11/21",
        location: "The Aruba",
        locationCap: "Aruba"
    )
  ];
}