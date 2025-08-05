import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

final GoogleSignIn googleSignIn = GoogleSignIn(
  clientId: '633725393991-ltc6fsbummjh8kitojkvcvreeavt7nag.apps.googleusercontent.com',
);

Future<void> signInWithGoogle() async {
  try {
    if (kIsWeb) {
      GoogleAuthProvider googleProvider = GoogleAuthProvider();
      await FirebaseAuth.instance.signInWithPopup(googleProvider);
    } else {
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) return;
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      await FirebaseAuth.instance.signInWithCredential(credential);
    }
  } catch (e) {
    print('Error signing in with Google: $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: const FirebaseOptions(
        apiKey: "AIzaSyBJwd3QtWIa1pUcIXVA-YBS5sAmtiZ-tgA",
        authDomain: "mytodotasks-f7029.firebaseapp.com",
        projectId: "mytodotasks-f7029",
        storageBucket: "mytodotasks-f7029.appspot.com",
        messagingSenderId: "633725393991",
        appId: "1:633725393991:web:4a2266285165028d7aa562",
      )
    );
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MY TODO TASKS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.poppinsTextTheme().copyWith(
          bodyLarge: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          bodyMedium: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      home: const AuthGate(),
    );
  }
}

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasData) {
          return const TodoHome();
        } else {
          return const SignInPage();
        }
      },
    );
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
  "MY TODO TASKS",
  style: GoogleFonts.bebasNeue(
    fontSize: 46,
    color: const Color.fromARGB(255, 0, 0, 0),
    letterSpacing: 1.5,
  ),
),

              const SizedBox(height: 40),
              InkWell(
                onTap: signInWithGoogle,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [BoxShadow(color: Colors.grey.shade300, blurRadius: 6)],
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        'https://upload.wikimedia.org/wikipedia/commons/4/4a/Logo_2013_Google.png',
                        height: 24,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Sign in with Google',
                        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                    ],
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

class TodoHome extends StatefulWidget {
  const TodoHome({super.key});
  @override
  State<TodoHome> createState() => _TodoHomeState();
}

class _TodoHomeState extends State<TodoHome> {
  final TextEditingController taskController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  DateTime? dueDate;
  String priority = 'Low';
  final List<Map<String, dynamic>> todoItems = [];

  void addTodo() {
    if (taskController.text.trim().isNotEmpty) {
      setState(() {
        todoItems.add({
          'task': taskController.text.trim(),
          'description': descController.text.trim(),
          'dueDate': dueDate != null ? DateFormat('dd/MM/yyyy').format(dueDate!) : '',
          'priority': priority,
          'completed': false,
        });
        taskController.clear();
        descController.clear();
        dueDate = null;
        priority = 'Low';
      });
    }
  }

  void removeTodo(int index) {
    setState(() {
      todoItems.removeAt(index);
    });
  }

  void toggleCompletion(int index) {
    setState(() {
      todoItems[index]['completed'] = !todoItems[index]['completed'];
    });
  }

  Color _getPriorityColor(String priority) {
    switch (priority) {
      case 'High':
        return Colors.red;
      case 'Medium':
        return Colors.orange;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "MY TODO TASKS",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.task_alt, color: Colors.teal),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.black),
            onPressed: () async {
              await googleSignIn.signOut();
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: taskController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.description),
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.calendar_today),
                    label: Text(dueDate == null ? 'Pick Due Date' : DateFormat('dd/MM/yyyy').format(dueDate!)),
                    onPressed: () async {
                      final pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      );
                      if (pickedDate != null) {
                        setState(() => dueDate = pickedDate);
                      }
                    },
                  ),
                ),
                const SizedBox(width: 10),
                DropdownButton<String>(
                  value: priority,
                  items: ['Low', 'Medium', 'High'].map((e) => DropdownMenuItem(value: e, child: Row(
                    children: [
                      const Icon(Icons.priority_high, size: 16),
                      const SizedBox(width: 4),
                      Text(e),
                    ],
                  ))).toList(),
                  onChanged: (val) => setState(() => priority = val!),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: addTodo,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
              ),
              child: Text('Add Task', style: GoogleFonts.poppins(color: Colors.black, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: todoItems.length,
                itemBuilder: (context, index) {
                  final task = todoItems[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: task['completed'],
                        onChanged: (_) => toggleCompletion(index),
                      ),
                      title: Text(task['task'], style: GoogleFonts.poppins(fontWeight: FontWeight.bold)),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.description, size: 16),
                              const SizedBox(width: 4),
                              Expanded(child: Text(task['description'], style: GoogleFonts.poppins())),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.calendar_today, size: 16),
                              const SizedBox(width: 4),
                              Text(task['dueDate'], style: GoogleFonts.poppins()),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              const Icon(Icons.flag, size: 16),
                              const SizedBox(width: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: _getPriorityColor(task['priority']),
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  task['priority'],
                                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 12),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.red),
                        onPressed: () => removeTodo(index),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}