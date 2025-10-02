// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// Project imports:
import 'package:m_score_board/display_stream_provider.dart';
import 'package:m_score_board/models/display.dart';
import 'package:m_score_board/pages/control_page/add_display_dialog.dart';
import 'package:m_score_board/pages/control_page/preview_app.dart';
import 'package:m_score_board/pages/control_page/rank_add_point_container.dart';
import 'package:m_score_board/scripts/firebase_scripts.dart';

part 'control_setting.dart';

class ControlPage extends HookConsumerWidget {
  const ControlPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backColor = Color(0xFF141218);

    return Scaffold(
      backgroundColor: backColor,
      appBar: AppBar(
        title: Text("コントローラー"),
        centerTitle: true,
        backgroundColor: backColor,
        foregroundColor: Theme.of(context).colorScheme.surface,
      ),
      body: Column(
        children: [PreviewApp(), Expanded(child: ControllerWidget())],
      ),
    );
  }
}

class ControllerWidget extends HookConsumerWidget {
  const ControllerWidget({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listSelected = useState<int?>(null);

    final displayStream = ref.watch(displayStreamProvider);

    return Container(
      constraints: BoxConstraints(minHeight: 500),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
        color: Theme.of(context).colorScheme.surface,
      ),
      padding: EdgeInsets.all(16),
      child: displayStream.when(
        data: (data) {
          return (listSelected.value != null)
              ? ControlSetting(
                display: data[listSelected.value!],
                backButton: () {
                  listSelected.value = null;
                },
              )
              : Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        final displayData = data[index];
                        return Container(
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            border:
                                (displayData.nowDisplay)
                                    ? Border.all(
                                      color: Colors.pinkAccent,
                                      width: 4,
                                    )
                                    : Border.all(
                                      color:
                                          Theme.of(
                                            context,
                                          ).colorScheme.onSurface,
                                    ),
                          ),
                          width: double.infinity,
                          child: ListTile(
                            onTap: () {
                              listSelected.value = index;
                            },
                            title: Text(displayData.title),
                            trailing: Switch(
                              activeTrackColor: Colors.pinkAccent,
                              value: (displayData.nowDisplay),
                              onChanged: (value) {
                                if (value) {
                                  FirestoreScripts().changeDisplay(index);
                                }
                              },
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16);
                      },
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: FilledButton.icon(
                      onPressed:
                          () => showDialog(
                            context: context,
                            builder: (context) {
                              return AddDisplayDialog(newId: data.length);
                            },
                          ),
                      icon: Icon(Icons.add),
                      label: Text("新しいスライドを追加"),
                    ),
                  ),
                ],
              );
        },
        error: (error, stackTrace) {
          return Center(child: Text("$error"));
        },
        loading: () => Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
