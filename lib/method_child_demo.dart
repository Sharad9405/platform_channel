import 'package:flutter/material.dart';

class MethodChannelDemo extends StatefulWidget {
  const MethodChannelDemo({Key key}) : super(key: key);

  @override
  _MethodChannelDemoState createState() => _MethodChannelDemoState();
}

class _MethodChannelDemoState extends State<MethodChannelDemo> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Channel Method Demo'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Value of count is $count',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: 16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton.icon(
                  onPressed: () {
                    try {} catch (error) {}
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Increment')),
              ElevatedButton.icon(
                onPressed: () async {
                  try {} catch (error) {}
                },
                icon: const Icon(Icons.remove),
                label: const Text('Decrement'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
