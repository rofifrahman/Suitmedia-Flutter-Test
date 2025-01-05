import 'package:flutter/material.dart';
import 'second_screen.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _palindromeController = TextEditingController();

  bool _isPalindrome(String input) {
    final cleanedInput = input.replaceAll(' ', '').toLowerCase();
    final length = cleanedInput.length;

    for (int i = 0; i < length / 2; i++) {
      if (cleanedInput[i] != cleanedInput[length - 1 - i]) {
        return false;
      }
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  'assets/images/background_first_screen.png'
              ),
              fit: BoxFit.cover,
            ),
        ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/ic_photo.png',
              height: 150,
            ),
            const SizedBox(height: 50),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                hintText: 'Name',
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6867775C),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _palindromeController,
              decoration: InputDecoration(
                hintText: 'Palindrome',
                hintStyle: const TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF6867775C),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
              style: const TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2B637B),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 165,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (_palindromeController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Palindrome cannot be empty')),
                  );
                } else {
                  final isPalindrome =
                  _isPalindrome(_palindromeController.text);
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                          isPalindrome ?
                          "${_palindromeController.text} isPalindrome" :
                          "${_palindromeController.text} not palindrome"
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text("OK"),
                        ),
                      ],
                    ),
                  );
                }
              },
              child: const Text(
                'CHECK',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                    color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF2B637B),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 170,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                if (_nameController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Name cannot be empty')),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondScreen(
                        name: _nameController.text,
                      ),
                    ),
                  );
                }
              },
              child: const Text(
                'NEXT',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
      ),
    );
  }
}


