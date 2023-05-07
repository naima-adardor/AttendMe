class SanitaryIssues {
  int? id_sanitary;
  String? id_employee;
  String? report;
  String? certificate;

  SanitaryIssues({
    this.id_sanitary,
    this.id_employee,
    this.report,
    this.certificate,
  });

  factory SanitaryIssues.fromJson(Map<String, dynamic> json) {
    return SanitaryIssues(
      id_sanitary: json['sanitary_regulation']['id_sanitary'],
      id_employee: json['sanitary_regulation']['id_employee'],
      report: json['sanitary_regulation']['report'],
      certificate: json['sanitary_regulation']['certificate'] ?? "",
    );
  }
}
