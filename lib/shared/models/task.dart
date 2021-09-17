class Task {
  final bool approved;
  final Map<String, dynamic>? attachment;
  final String comment;
  final String dateEnd;
  final String dateStart;
  final String employee;
  final String employeeCreated;
  final String type;
  final String? id;
  final String dtCreated;

  Task(
      {required this.id,
      required this.dateStart,
      required this.dateEnd,
      required this.approved,
      required this.attachment,
      required this.comment,
      required this.employee,
      required this.employeeCreated,
      required this.type,
      required this.dtCreated});
}
