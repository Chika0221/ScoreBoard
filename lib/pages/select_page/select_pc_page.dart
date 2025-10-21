part of 'select_page.dart';

class SelectPcPage extends HookConsumerWidget {
  const SelectPcPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    late String currentUrl;

    useEffect(() {
      currentUrl = Uri.base.toString();
      return () {};
    }, []);

    return Row(
      children: [
        Expanded(
          child: Center(
            child: Focus(
              autofocus: true,
              onKeyEvent: (node, event) {
                final key = event.logicalKey;
                if (event is KeyDownEvent) {
                  if (key == LogicalKeyboardKey.arrowRight) {
                    Navigator.of(context).pushNamed(AppRoute.display.path);
                  }
                }

                return KeyEventResult.ignored;
              },
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
        ),
        Expanded(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox.square(
                  dimension: MediaQuery.of(context).size.width * 0.25,
                  child: QrImageView(data: "$currentUrl#/control"),
                ),
                SizedBox(height: 8),
                Text(
                  "スマートフォンで読み取ってコントロール",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
