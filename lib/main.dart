import 'package:flutter/material.dart';

import 'package:tree/model/event_model.dart';
import 'package:tree/model/event_tree.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tree',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Flutter Tree Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key, required this.title});

  final String title;

  final hiddenRoot = EventTree.root(WizardEventModel.blank('Root'));

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: EventTreeWidget(event: widget.hiddenRoot),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              widget.hiddenRoot.addChild(
                EventTree(
                  WizardEventModel.blank(
                    'Root_${widget.hiddenRoot.children.length}',
                  ),
                ),
              );
              setState(() {});
            },
            child: const Icon(Icons.add),
          ),
          const SizedBox(width: 16, height: 16),
          FloatingActionButton(
            onPressed: () {
              print(widget.hiddenRoot.toJson());
            },
            child: const Icon(Icons.print),
          ),
        ],
      ),
    );
  }
}

class EventTreeWidget extends StatefulWidget {
  const EventTreeWidget({
    super.key,
    required this.event,
  });

  final EventTree event;

  @override
  State<EventTreeWidget> createState() => _EventTreeWidgetState();
}

class _EventTreeWidgetState extends State<EventTreeWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widget.event.level * 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.event.level > 0)
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.lightBlue[50],
                  ),
                  child: Text(widget.event.value.title),
                ),
                IconButton(
                  onPressed: () {
                    widget.event.addChild(
                      EventTree(
                        WizardEventModel.blank(
                          'Node_${widget.event.level}${widget.event.children.length}',
                        ),
                      ),
                    );
                    setState(() {});
                  },
                  icon: const Icon(Icons.add),
                )
              ],
            ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: widget.event.children.length,
            itemBuilder: (context, index) {
              return EventTreeWidget(
                event: widget.event.children[index] as EventTree,
              );
            },
          ),
        ],
      ),
    );
  }
}
