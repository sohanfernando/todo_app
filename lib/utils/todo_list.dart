import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
    required this.editFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;
  final Function(BuildContext)? editFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
      child: Slidable(
        key: ValueKey(taskName),
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: editFunction,
              icon: Icons.edit,
              label: 'Edit',
              backgroundColor: Colors.amber.shade600,
              foregroundColor: Colors.black87,
              borderRadius: BorderRadius.circular(14),
            ),
            const SizedBox(width: 8),
            SlidableAction(
              onPressed: deleteFunction,
              icon: Icons.delete,
              label: 'Delete',
              backgroundColor: Colors.red.shade600,
              foregroundColor: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
          ],
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.deepPurple.withOpacity(0.08),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
            border: Border.all(color: Colors.deepPurple.shade100),
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                checkColor: Colors.white,
                activeColor: Colors.deepPurple,
                side: BorderSide(color: Colors.deepPurple.shade300),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  taskName,
                  style: TextStyle(
                    color: Colors.deepPurple.shade900,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    decoration: taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                    decorationColor: Colors.deepPurple.shade300,
                    decorationThickness: 2,
                  ),
                ),
              ),
              // Quick inline edit icon (optional tap)
              IconButton(
                tooltip: 'Edit',
                onPressed: () => editFunction?.call(context),
                icon: const Icon(Icons.edit_outlined),
                color: Colors.deepPurple,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
