// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:qr_flutter/qr_flutter.dart';

// Project imports:
import 'package:m_score_board/main.dart';

class SelectPage extends StatefulWidget {
  const SelectPage({super.key});

  @override
  State<SelectPage> createState() => _SelectPageState();
}

class _SelectPageState extends State<SelectPage> {
  @override
  Widget build(BuildContext context) {
    String currentUrl = Uri.base.toString();

    return Scaffold(
      appBar: AppBar(title: Text("モードを選択"), centerTitle: true),
      body:
          (MediaQuery.of(context).size.width > 640)
              ? Row(
                children: [
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.2,
                        // height: MediaQuery.of(context).size.width * 0.1,
                        child: FilledButton.icon(
                          onPressed:
                              () => Navigator.of(
                                context,
                              ).pushNamed(AppRoute.display.path),
                          icon: Icon(Icons.arrow_forward),
                          label: Text("得点表へ"),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: SizedBox.square(
                        dimension: MediaQuery.of(context).size.width * 0.25,
                        child: QrImageView(data: "$currentUrl#/control"),
                      ),
                    ),
                  ),
                ],
              )
              : Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(32),
                      padding: EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: InkWell(
                        onTap:
                            () => Navigator.of(
                              context,
                            ).pushNamed(AppRoute.display.path),
                        child: Center(
                          child: Text(
                            "得点表",
                            style: TextStyle(
                              fontSize: 32,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(32),
                      padding: EdgeInsets.all(32),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32),
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      child: InkWell(
                        onTap:
                            () => Navigator.of(
                              context,
                            ).pushNamed(AppRoute.control.path),
                        child: Center(
                          child: Text(
                            "コントローラー",
                            style: TextStyle(
                              fontSize: 32,
                              color: Theme.of(context).colorScheme.onSecondary,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
    );
  }
}
