import 'dart:convert';

Incidence incidenceFromJson(String str) => Incidence.fromJson(json.decode(str));

String incidenceToJson(Incidence data) => json.encode(data.toJson());

class Incidence {
    Incidence({
        this.id,
        this.description,
        this.timestamp,
        this.summary,
    });

    String? id;
    String? description;
    DateTime? timestamp;
    String? summary;

    factory Incidence.fromJson(Map<String, dynamic> json) => Incidence(
        id: json["id"],
        description: json["description"] ?? "",
        timestamp: DateTime.parse(json["timestamp"] ?? DateTime.now()),
        summary: json["summary"] ?? "",
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "timestamp": timestamp!.toIso8601String(),
        "summary": summary,
    };
}
