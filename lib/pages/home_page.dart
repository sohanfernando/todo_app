import 'package:flutter/material.dart';
import 'package:todo_app/utils/todo_list.dart';
import '../l10n/l10n.dart';
import '../l10n/app_localizations.dart';

class Todo {
  final String title;
  final bool isCompleted;

  const Todo({required this.title, this.isCompleted = false});

  Todo copyWith({String? title, bool? isCompleted}) {
    return Todo(
      title: title ?? this.title,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.onChangeLocale});

  final void Function(Locale) onChangeLocale;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();

  final List<Todo> _todos = [
    const Todo(title: 'Learn Flutter'),
    const Todo(title: 'Drink Coffee'),
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleTodo(int index) {
    setState(() {
      final todo = _todos[index];
      _todos[index] = todo.copyWith(isCompleted: !todo.isCompleted);
    });
  }

  void _saveNewTask() {
    final l10n = AppLocalizations.of(context)!;
    final text = _controller.text.trim();

    if (text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.snackTaskEmpty)));
      return;
    }

    setState(() {
      _todos.add(Todo(title: text));
      _controller.clear();
    });
  }

  void _deleteTask(int index) {
    final l10n = AppLocalizations.of(context)!;
    final removedTitle = _todos[index].title;

    setState(() {
      _todos.removeAt(index);
    });

    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(l10n.snackDeleted(removedTitle))));
  }

  Future<void> _editTask(int index) async {
    final l10n = AppLocalizations.of(context)!;
    final initialText = _todos[index].title;
    final controller = TextEditingController(text: initialText);

    final updatedText = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (ctx) {
        return Padding(
          padding: EdgeInsets.only(
            left: 20,
            right: 20,
            top: 20,
            bottom: MediaQuery.of(ctx).viewInsets.bottom + 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                height: 4,
                width: 48,
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade100,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Text(
                l10n.updateTaskTitle,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.deepPurple.shade800,
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: controller,
                autofocus: true,
                textInputAction: TextInputAction.done,
                onSubmitted: (_) => Navigator.pop(ctx, controller.text.trim()),
                decoration: InputDecoration(
                  hintText: l10n.editTaskHint,
                  filled: true,
                  fillColor: Colors.deepPurple.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: const BorderSide(color: Colors.deepPurple),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide(color: Colors.deepPurple.shade200),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                    borderSide: BorderSide(
                      color: Colors.deepPurple,
                      width: 1.4,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(ctx),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(l10n.cancel),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton.icon(
                      onPressed: () {
                        final text = controller.text.trim();
                        if (text.isEmpty) {
                          Navigator.pop(ctx);
                        } else {
                          Navigator.pop(ctx, text);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        backgroundColor: Colors.deepPurple,
                        foregroundColor: Colors.white,
                      ),
                      icon: const Icon(Icons.check),
                      label: Text(l10n.save),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );

    if (updatedText != null &&
        updatedText.isNotEmpty &&
        updatedText != initialText) {
      setState(() {
        _todos[index] = _todos[index].copyWith(title: updatedText);
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(l10n.snackUpdated)));
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.appTitle),
        actions: [
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language),
            onSelected: widget.onChangeLocale,
            itemBuilder: (context) {
              return L10n.all.map((locale) {
                final code = locale.languageCode;
                return PopupMenuItem<Locale>(
                  value: locale,
                  child: Text('${L10n.getFlag(code)}  ${code.toUpperCase()}'),
                );
              }).toList();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 4),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      textInputAction: TextInputAction.done,
                      onSubmitted: (_) => _saveNewTask(),
                      decoration: InputDecoration(
                        hintText: l10n.todoHint,
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: Colors.deepPurple.shade200,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide(
                            color: Colors.deepPurple.shade200,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(
                            color: Colors.deepPurple,
                            width: 1.4,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  FloatingActionButton.small(
                    heroTag: 'add_btn',
                    onPressed: _saveNewTask,
                    child: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 24),
              itemCount: _todos.length,
              itemBuilder: (BuildContext context, int index) {
                final todo = _todos[index];
                return TodoList(
                  taskName: todo.title,
                  taskCompleted: todo.isCompleted,
                  onChanged: (_) => _toggleTodo(index),
                  deleteFunction: (ctx) => _deleteTask(index),
                  editFunction: (ctx) => _editTask(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
