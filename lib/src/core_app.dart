import 'package:flutter/material.dart';
import 'widgets/focus_box_item.dart';

const int columns = 50;
const int rows = 5;

class CoreApp extends StatelessWidget {
  const CoreApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Focus Tools'),
      ),
      body: RawKeyboardListener(
        focusNode: FocusNode(),
        onKey: (RawKeyEvent event) {
          debugPrint('RawKeyboardListener $event ');
        },
        child: Padding(
          padding: const EdgeInsets.all(50.0),
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100.0), border: Border.all(color: Colors.blueGrey, width: 4)),
              child: SingleChildScrollView(
                child: FocusScope(
                  node: FocusScopeNode(),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    for (int idx = 0; idx < columns; idx++)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FocusBoxItem(name: 'main $idx ', autoFocus: idx == 4, focusNode: FocusNode()),
                          const SizedBox(width: 10),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int jdx = 0; jdx < rows; jdx++)
                                FocusBoxItem(
                                  name: '$idx sub $jdx ',
                                  focusNode: FocusNode(),
                                  skipTraversal: jdx == 3,
                                )
                            ],
                          )
                        ],
                      )
                  ]),
                ),
              )),
        ),
      ),
    );
  }
}
