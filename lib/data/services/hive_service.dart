import 'package:github_user_explorer/domain/model/history_entry.dart';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';

abstract final class HiveService {
  static late Box<HistoryEntry> historyBox;

  static Future<void> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(HistoryEntryAdapter());
    historyBox = await Hive.openBox<HistoryEntry>('history');
  }
}
