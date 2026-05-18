import 'package:hive_ce/hive.dart';

part 'history_entry.g.dart';

@HiveType(typeId: 0)
class HistoryEntry extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String login;

  @HiveField(2)
  final String avatarUrl;

  @HiveField(3)
  final String htmlUrl;

  @HiveField(4)
  final DateTime visitedAt;

  HistoryEntry({
    required this.id,
    required this.login,
    required this.avatarUrl,
    required this.htmlUrl,
    required this.visitedAt,
  });
}
