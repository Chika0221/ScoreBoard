// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:qr_flutter/qr_flutter.dart';

// Project imports:
import 'package:m_score_board/main.dart';

part 'select_pc_page.dart';
part 'select_phone_page.dart';

class SelectPage extends HookConsumerWidget {
  const SelectPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("モードを選択"), centerTitle: true),
      body:
          (MediaQuery.of(context).size.width > 640)
              ? SelectPcPage()
              : SelectPhonePage(),
    );
  }
}
