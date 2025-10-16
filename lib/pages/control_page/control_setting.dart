part of 'control_page.dart';

class ControlSetting extends ConsumerWidget {
  const ControlSetting({
    super.key,
    required this.backButton,
    required this.display,
  });

  final void Function() backButton;
  final Display display;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border:
            (display.nowDisplay)
                ? Border.all(color: Colors.pinkAccent, width: 4)
                : null,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text("設定-${display.title}"),
          leading: IconButton(
            onPressed: backButton,
            icon: Icon(Icons.arrow_back),
          ),
          actions: [
            if (display.id != 0)
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  await FirestoreScripts().deleteDisplay(display);
                  backButton();
                },
                tooltip: "このスライドを削除",
              ),
            Switch(
              activeTrackColor: Colors.pinkAccent,
              value: (display.nowDisplay),
              onChanged: (value) {
                if (value) {
                  FirestoreScripts().changeDisplay(display.id);
                }
              },
            ),
            SizedBox(width: 16),
          ],
        ),
        body:
            (display.id == 0)
                ? RankAddPointContainer(display: display)
                : OtherDisplayContainer(display: display),
      ),
    );
  }
}

class OtherDisplayContainer extends HookConsumerWidget {
  const OtherDisplayContainer({super.key, required this.display});

  final Display display;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleController = useTextEditingController(text: display.title);
    final descriptionController = useTextEditingController(
      text: display.description,
    );

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 16),
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
              minLines: 1,
              maxLines: 10,
            ),
            SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: () async {
                  await FirestoreScripts().updateDisplay(
                    display.copyWith(
                      title: titleController.text,
                      description: descriptionController.text,
                    ),
                  );

                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("変更を適応しました"),
                      backgroundColor: Colors.pinkAccent,
                    ),
                  );
                },
                child: Text("変更を適用"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
