// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/models/display.dart';
import 'package:m_score_board/scripts/firebase_scripts.dart';

class AddDisplayDialog extends HookConsumerWidget {
  const AddDisplayDialog({super.key, required this.newId});

  final int newId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    return AlertDialog(
      title: Text("スライドを追加"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: "タイトル",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 16),
          TextField(
            controller: descriptionController,
            decoration: InputDecoration(
              labelText: "説明",
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: () async {
            final newDisplay = Display(
              id: newId,
              nowDisplay: false,
              title: titleController.text,
              description: descriptionController.text,
              type: DisplayType.slideString,
            );
            await FirestoreScripts().addDisplay(newDisplay);
            Navigator.of(context).pop();
          },
          child: Text("追加"),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text("キャンセル"),
        ),
      ],
    );
  }
}
