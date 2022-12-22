// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  Users({
    this.token,
    this.user,
  });

  String? token;
  User? user;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        token: json["token"],
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "user": user!.toJson(),
      };
}

class User {
  User({
    this.url,
    this.email,
    this.firstName,
    this.lastName,
    this.phoneNumber,
    this.profile,
  });

  String? url;
  String? email;
  String? firstName;
  String? lastName;
  String? phoneNumber;
  Profile? profile;

  factory User.fromJson(Map<String, dynamic> json) => User(
        url: json["url"],
        email: json["email"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phoneNumber: json["phone_number"],
        profile: Profile.fromJson(json["profile"]),
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "email": email,
        "first_name": firstName,
        "last_name": lastName,
        "phone_number": phoneNumber,
        "profile": profile!.toJson(),
      };
}

class Profile {
  Profile({
    this.id,
    this.title,
    this.dob,
    this.address,
    this.country,
    this.city,
    this.zip,
    this.paymentStatus,
    this.balance,
    this.membershipType,
    this.photo,
    this.user,
    this.hotelRoom,
    this.airline,
  });

  int? id;
  String? title;
  DateTime? dob;
  String? address;
  String? country;
  String? city;
  String? zip;
  String? paymentStatus;
  String? balance;
  String? membershipType;
  String? photo;
  ProfileUser? user;
  HotelRoom? hotelRoom;
  Airline? airline;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        title: json["title"],
        dob: DateTime.parse(json["dob"]),
        address: json["address"],
        country: json["country"],
        city: json["city"],
        zip: json["zip"],
        paymentStatus: json["payment_status"],
        balance: json["balance"],
        membershipType: json["membership_type"],
        photo: json["photo"],
        user: ProfileUser.fromJson(json["user"]),
        hotelRoom: HotelRoom.fromJson(json["hotel_room"]),
        airline: Airline.fromJson(json["airline"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "dob":
            "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "address": address,
        "country": country,
        "city": city,
        "zip": zip,
        "payment_status": paymentStatus,
        "balance": balance,
        "membership_type": membershipType,
        "photo": photo,
        "user": user!.toJson(),
        "hotel_room": hotelRoom!.toJson(),
        "airline": airline!.toJson(),
      };
}

class Airline {
  Airline({
    this.id,
    this.departureAirport,
    this.arrivalAirport,
    this.departureDate,
    this.arrivalDate,
    this.departureTime,
    this.arrivalTime,
    this.flightName,
    this.flightNumber,
    this.stateDeparted,
    this.stateArrived,
  });

  int? id;
  String? departureAirport;
  String? arrivalAirport;
  DateTime? departureDate;
  DateTime? arrivalDate;
  String? departureTime;
  String? arrivalTime;
  String? flightName;
  String? flightNumber;
  String? stateDeparted;
  String? stateArrived;

  factory Airline.fromJson(Map<String, dynamic> json) => Airline(
        id: json["id"],
        departureAirport: json["departure_airport"],
        arrivalAirport: json["arrival_airport"],
        departureDate: DateTime.parse(json["departure_date"]),
        arrivalDate: DateTime.parse(json["arrival_date"]),
        departureTime: json["departure_time"],
        arrivalTime: json["arrival_time"],
        flightName: json["flight_name"],
        flightNumber: json["flight_number"],
        stateDeparted: json["state_departed"],
        stateArrived: json["state_arrived"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "departure_airport": departureAirport,
        "arrival_airport": arrivalAirport,
        "departure_date":
            "${departureDate!.year.toString().padLeft(4, '0')}-${departureDate!.month.toString().padLeft(2, '0')}-${departureDate!.day.toString().padLeft(2, '0')}",
        "arrival_date":
            "${arrivalDate!.year.toString().padLeft(4, '0')}-${arrivalDate!.month.toString().padLeft(2, '0')}-${arrivalDate!.day.toString().padLeft(2, '0')}",
        "departure_time": departureTime,
        "arrival_time": arrivalTime,
        "flight_name": flightName,
        "flight_number": flightNumber,
        "state_departed": stateDeparted,
        "state_arrived": stateArrived,
      };
}

class HotelRoom {
  HotelRoom({
    this.id,
    this.hotel,
    this.roomNumber,
    this.hotelRanking,
    this.priceLevel,
    this.location,
    this.lalitude,
    this.longitude,
    this.numberOfDaysAllocated,
    this.mealEntitled,
    this.cover,
  });

  int? id;
  String? hotel;
  String? roomNumber;
  String? hotelRanking;
  String? priceLevel;
  String? location;
  String? lalitude;
  String? longitude;
  String? numberOfDaysAllocated;
  String? mealEntitled;
  String? cover;

  factory HotelRoom.fromJson(Map<String, dynamic> json) => HotelRoom(
        id: json["id"],
        hotel: json["hotel"],
        roomNumber: json["room_number"],
        hotelRanking: json["hotel_ranking"],
        priceLevel: json["price_level"],
        location: json["location"],
        lalitude: json["lalitude"],
        longitude: json["longitude"],
        numberOfDaysAllocated: json["number_of_days_allocated"],
        mealEntitled: json["meal_entitled"],
        cover: json["cover"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "hotel": hotel,
        "room_number": roomNumber,
        "hotel_ranking": hotelRanking,
        "price_level": priceLevel,
        "location": location,
        "lalitude": lalitude,
        "longitude": longitude,
        "number_of_days_allocated": numberOfDaysAllocated,
        "meal_entitled": mealEntitled,
        "cover": cover,
      };
}

class ProfileUser {
  ProfileUser({
    this.id,
    this.password,
    this.lastLogin,
    this.isSuperuser,
    this.firstName,
    this.lastName,
    this.isStaff,
    this.isActive,
    this.dateJoined,
    this.username,
    this.phoneNumber,
    this.email,
    this.groups,
    this.userPermissions,
  });

  int? id;
  String? password;
  DateTime? lastLogin;
  bool? isSuperuser;
  String? firstName;
  String? lastName;
  bool? isStaff;
  bool? isActive;
  DateTime? dateJoined;
  String? username;
  String? phoneNumber;
  String? email;
  List<dynamic>? groups;
  List<dynamic>? userPermissions;

  factory ProfileUser.fromJson(Map<String, dynamic> json) => ProfileUser(
        id: json["id"],
        password: json["password"],
        lastLogin: DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        username: json["username"],
        phoneNumber: json["phone_number"],
        email: json["email"],
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions:
            List<dynamic>.from(json["user_permissions"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "last_login": lastLogin!.toIso8601String(),
        "is_superuser": isSuperuser,
        "first_name": firstName,
        "last_name": lastName,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined!.toIso8601String(),
        "username": username,
        "phone_number": phoneNumber,
        "email": email,
        "groups": List<dynamic>.from(groups!.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions!.map((x) => x)),
      };
}
