import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Reminder Prototype',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: ReminderListDisplay(title: 'Random Reminder Prototype Home Page'),
    );
  }
}

class ReminderListDisplay extends StatefulWidget {
  const ReminderListDisplay({ Key? key, required this.title }) : super(key: key);

  final String title;

  @override
  _ReminderListDisplayState createState() => _ReminderListDisplayState();
}

class _ReminderListDisplayState extends State<ReminderListDisplay> {

  final reminders = <Reminder>[];
  
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    reminders.add(
      Reminder(
        name: 'reminder ' + _counter.toString(),
        route: '/test',
      )
    );
  }

  void _pushTile(String reminderTitle) {
  Navigator.of(context).push(
    MaterialPageRoute<void>(
      builder: (BuildContext context) {
        return Scaffold(
            appBar: AppBar(
              title: Text(reminderTitle),
            ),
            body: Text(
              'You are on a reminder details page',
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: reminders.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Entry ${reminders[index].name}'),
            onTap: () => _pushTile('${reminders[index].name}'),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}

class Reminder {
  final String name;
  final String route;
  // final WidgetBuilder builder;

  const Reminder({required this.name, required this.route
  // , this.builder
  });
}
class ReminderTile extends StatelessWidget {
  final Reminder reminder;

  const ReminderTile({required this.reminder, required Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(reminder.name),
      onTap: () {
        Navigator.pushNamed(context, reminder.route);
      },
    );
  }
}