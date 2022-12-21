import 'dart:convert';

PolingUnit polingUnitFromJson(String str) => PolingUnit.fromJson(json.decode(str));

String polingUnitToJson(PolingUnit data) => json.encode(data.toJson());

class PolingUnit {
    PolingUnit({
        this.status,
        this.pollingUnits,
    });

    bool? status;
    List<PollingData>? pollingUnits;

    factory PolingUnit.fromJson(Map<String, dynamic> json) => PolingUnit(
        status: json["status"],
        pollingUnits: List<PollingData>.from(json["pollingUnits"].map((x) => PollingData.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "pollingUnits": List<dynamic>.from(pollingUnits!.map((x) => x.toJson())),
    };
}

class PollingData {
    PollingData({
        this.puCode,
        this.puName,
        this.noOfVoters,
        this.raName,
        this.lgaName,
    });

    String? puCode;
    String? puName;
    String? noOfVoters;
    String? raName;
    String? lgaName;

    factory PollingData.fromJson(Map<String, dynamic> json) => PollingData(
        puCode: json["pu_code"] ?? "N/A",
        puName: json["pu_name"] ?? "N/A",
        noOfVoters: json["no_of_voters"] ?? "N/A",
        raName: json["ra_name"] ?? "N/A",
        lgaName: json["lga_name"] ?? "N/A",
    );

    Map<String, dynamic> toJson() => {
        "pu_code": puCode,
        "pu_name": puName,
        "no_of_voters": noOfVoters,
        "ra_name": raName,
        "lga_name": lgaName,
    };
}