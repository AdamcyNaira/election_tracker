// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
    Users({
        this.authToken,
        this.user,
        this.incidenceTypes,
        this.parties,
    });

    String? authToken;
    User? user;
    List<IncidenceType>? incidenceTypes;
    List<Party>? parties;

    factory Users.fromJson(Map<String, dynamic> json) => Users(
        authToken: json["authToken"],
        user: User.fromJson(json["user"]),
        incidenceTypes: List<IncidenceType>.from(json["incidenceTypes"].map((x) => IncidenceType.fromJson(x))),
        parties: List<Party>.from(json["parties"].map((x) => Party.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "authToken": authToken,
        "user": user!.toJson(),
        "incidenceTypes": List<dynamic>.from(incidenceTypes!.map((x) => x.toJson())),
        "parties": List<dynamic>.from(parties!.map((x) => x.toJson())),
    };
}

class IncidenceType {
    IncidenceType({
        this.incidenceCode,
        this.incidenceName,
        this.description,
    });

    String? incidenceCode;
    String? incidenceName;
    String? description;

    factory IncidenceType.fromJson(Map<String, dynamic> json) => IncidenceType(
        incidenceCode: json["incidence_code"],
        incidenceName: json["incidence_name"] ?? "",
        description: json["description"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "incidence_code": incidenceCode,
        "incidence_name": incidenceName,
        "description": description,
    };
}

class Party {
    Party({
        this.partyId,
        this.partyName,
    });

    String? partyId;
    String? partyName;

    factory Party.fromJson(Map<String, dynamic> json) => Party(
        partyId: json["party_id"],
        partyName: json["party_name"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "party_id": partyId,
        "party_name": partyName,
    };
}

class User {
    User({
        this.agentName,
        this.phoneNumber,
        this.permission,
        this.pollingUnit,
        this.loginStatus,
    });

    String? agentName;
    String? phoneNumber;
    String? permission;
    String? pollingUnit;
    String? loginStatus;

    factory User.fromJson(Map<String, dynamic> json) => User(
        agentName: json["agentName"] ?? "",
        phoneNumber: json["phoneNumber"] ?? "",
        permission: json["permission"] ?? "",
        pollingUnit: json["pollingUnit"] ?? "",
        loginStatus: json["login_status"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "agentName": agentName,
        "phoneNumber": phoneNumber,
        "permission": permission,
        "pollingUnit": pollingUnit,
        "login_status": loginStatus,
    };
}
