class AttendanceIssues {
  int? id_presence_regulation;
  String? check_in;
  String? check_out;
  String? attendance_day;
  String? issue_type;
  String? status;
  String? report;
  String? id_employee;

  AttendanceIssues({
    this.id_presence_regulation,
    this.check_in,
    this.check_out,
    this.attendance_day,
    this.issue_type,
    this.status,
    this.report,
    this.id_employee,
  });

  factory AttendanceIssues.fromJson(Map<String, dynamic> json) {
    return AttendanceIssues(
      id_presence_regulation: json['presence_regulation']
          ['id_presence_regulation'],
      check_in: json['presence_regulation']['check_in'],
      check_out: json['presence_regulation']['check_out'],
      attendance_day: json['presence_regulation']['attendance_day'],
      issue_type: json['presence_regulation']['issue_type'],
      status: json['presence_regulation']['status'],
      report: json['presence_regulation']['report'],
      id_employee: json['presence_regulation']['id_employee'],
    );
  }
}
