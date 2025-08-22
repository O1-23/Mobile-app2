import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StudentHomePage(),
    );
  }
}

class StudentHomePage extends StatefulWidget {
  @override
  _StudentHomePageState createState() => _StudentHomePageState();
}

class _StudentHomePageState extends State<StudentHomePage> {
  int studentCount = 0; // For counter
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Student Info Manager")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // (a) Welcome Dashboard
            Text(
              "Issah Abdul-Salim\nBSc. Information Technology\nUniversity of Energy and Natural Resources",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // (b) Interactive Notification
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        "Hello, Issah! Welcome to the Student Info Manager."),
                  ),
                );
              },
              child: Text("Show Alert"),
            ),
            SizedBox(height: 20),

            // (c) Student Counter+
            Text(
              "Students Enrolled: $studentCount",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    setState(() {
                      studentCount++;
                    });
                  },
                  icon: Icon(Icons.add, size: 30),
                ),
                IconButton(
                  onPressed: () {
                    if (studentCount > 0) {
                      setState(() {
                        studentCount--;
                      });
                    }
                  },
                  icon: Icon(Icons.remove, size: 30),
                ),
              ],
            ),
            SizedBox(height: 20),

            // (d) Student Login Form
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Password",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  String email = emailController.text;
                  String password = passwordController.text;

                  if (!email.contains("@")) {
                    errorMessage = "Invalid Email: Must contain '@'";
                  } else if (password.length < 6) {
                    errorMessage =
                    "Password must be at least 6 characters long";
                  } else {
                    errorMessage = "Login Successful!";
                  }
                });
              },
              child: Text("Login"),
            ),
            Text(
              errorMessage,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),

            // (e) Profile Picture Display
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                "https://i.pravatar.cc/150?img=3",
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}