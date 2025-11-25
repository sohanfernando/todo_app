// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get language => 'Español';

  @override
  String get appTitle => 'Lista de Tareas';

  @override
  String get todoHint => 'Añade una nueva tarea';

  @override
  String get snackTaskEmpty => 'La tarea no puede estar vacía';

  @override
  String snackDeleted(String task) {
    return 'Eliminado: $task';
  }

  @override
  String get snackUpdated => 'Tarea actualizada';

  @override
  String get updateTaskTitle => 'Actualizar tarea';

  @override
  String get editTaskHint => 'Edita tu tarea';

  @override
  String get cancel => 'Cancelar';

  @override
  String get save => 'Guardar';
}
