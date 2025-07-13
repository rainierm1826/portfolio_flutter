import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  ContactState createState() => ContactState();
}

class ContactState extends State<Contact> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Message sent"), duration: Durations.extralong4),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: Text(
                "Contact Me",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Rowdies",
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 32),
                  TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                      labelText: "Name",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                      hintText: "Enter your name",
                    ),
                    validator: (name) {
                      if (name == null || name.isEmpty) {
                        return "Empty Name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: "Email",
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      hintText: "Enter your email",
                    ),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return "Empty email";
                      }

                      if (!email.contains('@')) {
                        return "Invalid Email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  TextFormField(
                    controller: _messageController,
                    maxLines: null,
                    minLines: 5,
                    decoration: InputDecoration(
                      labelText: "Message",
                      border: OutlineInputBorder(),
                      hintText: "Enter your message",
                      alignLabelWithHint: true,
                    ),
                    validator: (message) {
                      if (message == null || message.isEmpty) {
                        return "Empty Message";
                      }

                      List<String> words = message.split(RegExp(r'[ ,.!]+'));
                      int wordCount = words
                          .where((word) => word.isNotEmpty)
                          .length;

                      if (wordCount < 10) {
                        return 'Message must be 10 words longer';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                    ),
                    onPressed: () {
                      _submitForm();
                    },

                    child: Text("Send"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
