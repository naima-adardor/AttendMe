class Presence {
  int? id_presence;
  String? id_elevator;
  String? id_employee;
  String? check_in;
  String? check_out;
  DateTime? attendance_day;
  String? qrcode;
  String? selfie;

  Presence({
    this.id_presence,
    this.id_elevator,
    this.id_employee,
    this.check_in,
    this.check_out,
    this.attendance_day,
    this.qrcode,
    this.selfie,
  });

  factory Presence.fromJson(Map<String, dynamic> json) {
    return Presence(
      id_presence: json['id_presence'],
      id_elevator: json['id_elevator'].toString(),
      id_employee: json['id_employee'].toString(),
      check_in: json['check_in'],
      check_out: json['check_out'],
      attendance_day: DateTime.parse(json['attendance_day']),
      qrcode: json['qrcode'],
      selfie: json['selfie'],
    );
  }
}
