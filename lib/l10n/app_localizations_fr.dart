// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get language => 'Français';

  @override
  String get appTitle => 'Liste de tâches';

  @override
  String get todoHint => 'Ajouter une nouvelle tâche';

  @override
  String get snackTaskEmpty => 'La tâche ne peut pas être vide';

  @override
  String snackDeleted(String task) {
    return 'Supprimé : $task';
  }

  @override
  String get snackUpdated => 'Tâche mise à jour';

  @override
  String get updateTaskTitle => 'Modifier la tâche';

  @override
  String get editTaskHint => 'Modifiez votre tâche';

  @override
  String get cancel => 'Annuler';

  @override
  String get save => 'Enregistrer';
}
