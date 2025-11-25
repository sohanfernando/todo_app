// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Sinhala Sinhalese (`si`).
class AppLocalizationsSi extends AppLocalizations {
  AppLocalizationsSi([String locale = 'si']) : super(locale);

  @override
  String get language => 'සිංහල';

  @override
  String get appTitle => 'සරල කාර්ය ලැයිස්තුව';

  @override
  String get todoHint => 'අලුත් කාර්යයක් එක් කරන්න';

  @override
  String get snackTaskEmpty => 'කාර්යය හිස්ව තැබිය නොහැක';

  @override
  String snackDeleted(String task) {
    return 'කාර්යය මකා දමන ලදි: $task';
  }

  @override
  String get snackUpdated => 'කාර්යය යාවත්කාලීන කරන ලදි';

  @override
  String get updateTaskTitle => 'කාර්යය යාවත්කාලීන කරන්න';

  @override
  String get editTaskHint => 'ඔබගේ කාර්යය සංස්කරණය කරන්න';

  @override
  String get cancel => 'අවලංගු කරන්න';

  @override
  String get save => 'සුරකින්න';
}
