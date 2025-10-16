part of 'select_page.dart';

class SelectPhonePage extends HookConsumerWidget {
  const SelectPhonePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
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
                  () => Navigator.of(context).pushNamed(AppRoute.display.path),
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
                  () => Navigator.of(context).pushNamed(AppRoute.control.path),
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
    );
  }
}
