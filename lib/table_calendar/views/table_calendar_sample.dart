import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sample_flutter/table_calendar/providers/table_calendar_event_provider.dart';
import 'package:table_calendar/table_calendar.dart';

class TableCalendarSample extends HookConsumerWidget {
  const TableCalendarSample({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusedDayState = useState(DateTime.now());
    final selectedDayState = useState(DateTime.now());
    final selectedEventsState = useState([]);
    final eventProvider = ref.watch(tableCalendarEventControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('カレンダー'),
      ),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 1, 1),
            lastDay: DateTime.utc(2030, 1, 1),
            focusedDay: DateTime.now(),
            locale: 'ja_JP',
            selectedDayPredicate: (day) {
              return isSameDay(selectedDayState.value, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              List<Event> selectedEventList = [];
              for (var event in eventProvider) {
                if (event.dateTime == selectedDay) {
                  selectedEventList.add(event);
                }
              }
              selectedDayState.value = selectedDay;
              focusedDayState.value = focusedDay;
              selectedEventsState.value = selectedEventList;
            },
            onDayLongPressed: (selectedDay, focusedDay) async {
              await showAddEventDialog(context, selectedDay, ref);
            },
            eventLoader: (date) {
              List<Event> selectedEventList = [];
              for (var event in eventProvider) {
                if (event.dateTime == date) {
                  selectedEventList.add(event);
                }
              }
              return selectedEventList;
            },
          ),
          Expanded(
            child: ListView.builder(
              itemCount: selectedEventsState.value.length,
              itemBuilder: (context, index) {
                final event = selectedEventsState.value[index];
                return Card(
                  child: ListTile(
                    title: Text(event.title),
                    subtitle: event.description == null
                        ? null
                        : Text(event.description!),
                    trailing: IconButton(
                      onPressed: () {
                        ref
                            .read(tableCalendarEventControllerProvider.notifier)
                            .deleteEvent(event: event);
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showAddEventDialog(
      BuildContext context, DateTime selectedDay, WidgetRef ref) async {
    final titleController = TextEditingController();
    final descriptionController = TextEditingController();

    await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('イベントの追加', style: TextStyle(fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(), hintText: 'タイトル'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    maxLines: 3,
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                        border: OutlineInputBorder(), hintText: '詳細'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          'キャンセル',
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          ref
                              .watch(tableCalendarEventControllerProvider.notifier)
                              .addEvent(
                                  dateTime: selectedDay,
                                  title: titleController.text,
                                  description: descriptionController.text);
                          Navigator.pop(context);
                        },
                        child: const Text(
                          '追加',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}