import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:plaform_channel/counter.dart';

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
                  onPressed: () async {
                    try {
                      Counter.increment(counterValue: count).then((value) {
                        setState(() => count = value);
                      });
                    } catch (error) {
                      showErrorMessage(
                          context, (error as PlatformException).message);
                    }
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('Increment')),
              ElevatedButton.icon(
                onPressed: () async {
                  try {
                    Counter.decrement(counterValue: count).then((value) {
                      setState(() => count = value);
                    });
                  } catch (error) {
                    showErrorMessage(
                        context, (error as PlatformException).message);
                  }
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

  void showErrorMessage(context, errorMessage) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(errorMessage)));
  }
}
