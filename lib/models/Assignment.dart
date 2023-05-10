class Assignment {
  int? id_assignment_elevator;
  String? id_elevator;
  String? id_employee;
  DateTime? start_date;
  DateTime? end_date;
  String? time_in;
  String? time_out;

  Assignment({
    this.id_assignment_elevator,
    this.id_elevator,
    this.id_employee,
    this.start_date,
    this.end_date,
    this.time_in,
    this.time_out,
  });

  factory Assignment.fromJson(Map<String, dynamic> json) {
    return Assignment(
      id_assignment_elevator: json['id_assignment_elevator'],
      id_elevator: json['id_elevator'].toString(),
      id_employee: json['id_employee'].toString(),
      start_date: DateTime.parse(json['start_date']),
      end_date: DateTime.parse(json['end_date']),
      time_in: json['time_in'],
      time_out: json['time_out'],
    );
  }
}
