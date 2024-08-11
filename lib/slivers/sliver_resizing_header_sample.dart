import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:table_calendar/table_calendar.dart';

/// SliverResizingHeader: https://api.flutter.dev/flutter/widgets/SliverResizingHeader-class.html

class SliverResizingHeaderSample extends HookWidget {
  const SliverResizingHeaderSample({super.key});

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();

    useEffect(() {
      return scrollController.dispose;
    }, [scrollController]);

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: scrollController,
          slivers: <Widget>[
            SliverResizingHeader(
              minExtentPrototype: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Calendar',
                ),
              ),
              maxExtentPrototype: SingleChildScrollView(
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        'Calendar',
                      ),
                    ),
                    TableCalendar(
                      firstDay:
                          DateTime.now().subtract(const Duration(days: 365)),
                      lastDay: DateTime.now().add(const Duration(days: 365)),
                      focusedDay: DateTime.now(),
                    ),
                    const Gap(4),
                  ],
                ),
              ),
              child: SingleChildScrollView(
                child: Container(
                  color: Theme.of(context).colorScheme.surface,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Calendar',
                        ),
                      ),
                      TableCalendar(
                        firstDay: DateTime.now()
                            .subtract(const Duration(days: 365)),
                        lastDay:
                            DateTime.now().add(const Duration(days: 365)),
                        focusedDay: DateTime.now(),
                      ),
                      const Gap(4),
                    ],
                  ),
                ),
              ),
            ),
            const ItemList(),
          ],
        ),
      ),
    );
  }
}

class ItemList extends StatelessWidget {
  const ItemList({
    super.key,
    this.itemCount = 50,
  });

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (BuildContext context, int index) {
          return Card(
            color: colorScheme.onSecondary,
            child: ListTile(
              textColor: colorScheme.secondary,
              title: Text('Item $index'),
            ),
          );
        },
        childCount: itemCount,
      ),
    );
  }
}
