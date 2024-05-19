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
      home: const MyHomePage(title: 'Flutter Tree Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final root = EventTree.root(WizardEventModel.blank('Root'));
    final node = EventTree.node(
      WizardEventModel.blank('Node'),
      parent: root,
    );
    final node1 = EventTree.node(
      WizardEventModel.blank('Node 1'),
      parent: node,
    );
    final node2 = EventTree.node(
      WizardEventModel.blank('Node 2'),
      parent: root,
    );
    final node3 = EventTree.node(
      WizardEventModel.blank('Node 3'),
      parent: node2,
    );

    root.printTree();

    print(root.toJson());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: EventTreeWidget(event: root),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }
}

class EventTreeWidget extends StatelessWidget {
  const EventTreeWidget({
    super.key,
    required this.event,
  });

  final EventTree event;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: event.level * 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.lightBlue[50],
            ),
            child: Text(event.value.title),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            itemCount: event.children.length,
            itemBuilder: (context, index) {
              return EventTreeWidget(event: event.children[index] as EventTree);
            },
          ),
        ],
      ),
    );
  }
}
