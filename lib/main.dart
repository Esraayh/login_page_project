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
      title: 'login page',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 64, 183, 58)),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 64, 183, 58),
        centerTitle: true,
        title: const Text(
          "Welcome!",
          style: TextStyle(fontSize: 30, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTy-evO2zspn-hP-gDQ706gy8ePig09CjnVF_xHUQtWIp-TZQPD521LntlCgnhlhmcYFAo&usqp=CAU',
              height: 350,
              width: 350,
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Enter Email"),
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      label: Text("Enter Password"),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      label: Text("Confirm Password"),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: Icon(Icons.remove_red_eye),
                      border: OutlineInputBorder(borderSide: BorderSide()),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Implement "Forgot Password" functionality
                          showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text('Forgot Password'),
                              content: const Text(
                                  'Please enter your email to reset your password.'),
                              actions: [
                                TextFormField(
                                  decoration: const InputDecoration(
                                    label: Text("Enter Email"),
                                    prefixIcon: Icon(Icons.email),
                                    border: OutlineInputBorder(
                                        borderSide: BorderSide()),
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                    // Implement reset password functionality
                                    Navigator.of(context).pop();
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('Reset password functionality not implemented yet.'),
                                      ),
                                    );
                                  },
                                  child: const Text('Reset Password'),
                                ),
                              ],
                            ),
                          );
                        },
                        child: const Text('Forgot Password?'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      // Implement "Login" functionality
                      if (_passwordController.text ==
                          _confirmPasswordController.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                'Login functionality not implemented yet.'),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Passwords do not match.'),
                          ),
                        );
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 87, 183, 58),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.login,
                            color: Colors.white,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Login to Your Account",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      // Implement "Sign Up" functionality
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                              'Sign Up functionality not implemented yet.'),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.app_registration,
                            color: Colors.black,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Don't have an account? Sign Up",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}