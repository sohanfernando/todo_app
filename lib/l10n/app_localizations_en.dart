// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get language => 'English';

  @override
  String get appTitle => 'Simple Todo';

  @override
  String get todoHint => 'Add a new todo item';

  @override
  String get snackTaskEmpty => 'Task cannot be empty';

  @override
  String snackDeleted(String task) {
    return 'Deleted: $task';
  }

  @override
  String get snackUpdated => 'Task updated';

  @override
  String get updateTaskTitle => 'Update Task';

  @override
  String get editTaskHint => 'Edit your task';

  @override
  String get cancel => 'Cancel';

  @override
  String get save => 'Save';
}
