import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Balanced Substrings',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const BalancedSubstringScreen(),
    );
  }
}

class BalancedSubstringScreen extends StatefulWidget {
  const BalancedSubstringScreen({super.key});

  @override
  _BalancedSubstringScreenState createState() =>
      _BalancedSubstringScreenState();
}

class _BalancedSubstringScreenState extends State<BalancedSubstringScreen> {
  final TextEditingController _inputController = TextEditingController();
  List<String> balancedSubstrings = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Balanced Substrings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(
                labelText: 'Enter string',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  String input = _inputController.text;
                  balancedSubstrings = getBalancedSubstrings(input);
                });
              },
              child: const Text('Find Balanced Substrings'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Longest Balanced Substrings:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: balancedSubstrings
                  .map((substring) => Text('- $substring'))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  List<String> getBalancedSubstrings(String S) {
    List<String> result = [];
    int maxLength = 0;

    for (int i = 0; i < S.length; i++) {
      int count1 = 0;
      int count2 = 0;

      for (int j = i; j < S.length; j++) {
        if (S[j] == S[i]) {
          count1++;
        } else {
          count2++;
        }

        if (count1 == count2) {
          int windowLength = j - i + 1;
          if (windowLength > maxLength) {
            maxLength = windowLength;
            result = [S.substring(i, j + 1)];
          } else if (windowLength == maxLength) {
            result.add(S.substring(i, j + 1));
          }
        }
      }
    }

    return result;
  }
}
