// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get language => 'Deutsch';

  @override
  String get appTitle => 'Einfache Aufgabenliste';

  @override
  String get todoHint => 'Neue Aufgabe hinzufügen';

  @override
  String get snackTaskEmpty => 'Aufgabe darf nicht leer sein';

  @override
  String snackDeleted(String task) {
    return 'Gelöscht: $task';
  }

  @override
  String get snackUpdated => 'Aufgabe aktualisiert';

  @override
  String get updateTaskTitle => 'Aufgabe bearbeiten';

  @override
  String get editTaskHint => 'Bearbeite deine Aufgabe';

  @override
  String get cancel => 'Abbrechen';

  @override
  String get save => 'Speichern';
}
