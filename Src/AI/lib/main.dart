import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: const CircleAvatar( // Added const here
            radius: 30.0,
            backgroundImage: AssetImage("images/logoai.jpg"),
          ),
        ),
        body: Column( // Added const here
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Corrected: Center widget should wrap its child directly
            Center(
                child: CircleAvatar(
                  radius: 100.0,
                  backgroundImage: AssetImage("images/logoai.jpg"),
                )
            )
            Text(
              "AI",
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            )
          ],
        ),
        bottomNavigationBar: Padding(
          padding: EdgeInsets.only(
            // bottom: MediaQuery.of(context).viewInsets.bottom,
            left: 8.0,
            right: 8.0,
            top: 8.0,
            bottom: 8.0,
          ),
          child: const MyHoverableInputField(), // Use our new Stateful widget
        ),
      ),
    );
  }
}

// Create a StatefulWidget to manage the hover state
class MyHoverableInputField extends StatefulWidget {
  const MyHoverableInputField({super.key});

  @override
  State<MyHoverableInputField> createState() => _MyHoverableInputFieldState();
}

class _MyHoverableInputFieldState extends State<MyHoverableInputField> {
  // Define the current color of the icon
  Color _iconColor = Colors.green;

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue)
        ),
        hintText: "Ask anything",
        suffixIcon: MouseRegion( // Use MouseRegion to detect hover events
          onEnter: (event) {
            setState(() {
              _iconColor = Colors.red; // Change to red on hover enter
            });
          },
          onExit: (event) {
            setState(() {
              _iconColor = Colors.green; // Change back to green on hover exit
            });
          },
          child: IconButton(
            icon: Icon(
              Icons.send,
              color: _iconColor, // Set the icon color based on state
            ),
            onPressed: () {
              // Action when the button is pressed
              print('Send icon button pressed!');
            },
          ),
        ),
      ),
    );
  }
}