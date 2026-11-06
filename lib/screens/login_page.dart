import 'package:flutter/material.dart';
import 'package:demo_sdk/demo_sdk.dart';
import '../widgets/custom_button.dart';
import 'home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  bool isPasswordVisible = false;
  bool isLoading = false;

  // Login Function using SDK
  Future<void> login() async {

    String username = usernameController.text.trim();
    String password = passwordController.text;

    // Validate Username using SDK
    final usernameError = LoginSdk.validateUsername(username);

    if (usernameError != null) {
      showMessage(usernameError);
      return;
    }

    // Validate Password using SDK
    final passwordError = LoginSdk.validatePassword(password);

    if (passwordError != null) {
      showMessage(passwordError);
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {

      // Call SDK Login Function
      final result = await LoginSdk.login(
        username: username,
        password: password,
      );
 // This means the SDK checks the actual credentials before allowing navigation.

      if (!mounted) return;

      if (result) {

        // Get logged-in user from SDK
        final user = LoginSdk.currentUser;

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(
              username: user!.username, //Passes the actual logged-in username to the Home Page.
            ),
          ),
        );

      } else {

        showMessage('Invalid username or password');

      }

    } catch (e) {

      if (mounted) {
        showMessage('Login failed: $e');
      }

    } finally {

      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }

    }
  }

  // Display Message
  void showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  void dispose() {
    usernameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [

              const Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.blue,
              ),

              const SizedBox(height: 20),

              const Text(
                'Welcome Back!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Please login to continue',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),

              const SizedBox(height: 35),

              // Username Field
              TextField(
                controller: usernameController,

                decoration: const InputDecoration(
                  labelText: 'Username',
                  hintText: 'Enter your username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // Password Field
              TextField(
                controller: passwordController,
                obscureText: !isPasswordVisible,

                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Enter your password',

                  prefixIcon: const Icon(Icons.lock),

                  suffixIcon: IconButton(
                    icon: Icon(
                      isPasswordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),

                    onPressed: () {
                      setState(() {
                        isPasswordVisible = !isPasswordVisible;
                      });
                    },
                  ),

                  border: const OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 30),

              // Login Button
              isLoading
                  ? const CircularProgressIndicator()
                  : CustomButton(
                text: 'LOGIN',
                onPressed: login,
              ),
            ],
          ),
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import '../widgets/custom_button.dart';
// import 'home_page.dart';
//
// class LoginPage extends StatefulWidget {
//
//   const LoginPage({super.key});
//
//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }
//
// class _LoginPageState extends State<LoginPage> {
//   final usernameController = TextEditingController();
//   final passwordController = TextEditingController();
//
//   bool isPasswordVisible = false;
//
//   // Login Function
//   void login() {
//
//     String username = usernameController.text.trim();
//     String password = passwordController.text;
//
//     if (username.isEmpty || password.isEmpty) {
//
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please enter username and password'),
//         ),
//       );
//
//     } else {
//
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(
//           builder: (context) => HomePage(username: username),
//         ),
//       );
//
//     }
//   }
//
//   @override
//   void dispose() {
//     usernameController.dispose();
//     passwordController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(25),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(
//                 Icons.account_circle,
//                 size: 100,
//                 color: Colors.blue,
//               ),
//
//               const SizedBox(height: 20),
//
//               const Text(
//                 'Welcome Back!',
//                 style: TextStyle(
//                   fontSize: 28,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//
//               const SizedBox(height: 10),
//
//               const Text(
//                 'Please login to continue',
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey,
//                 ),
//               ),
//
//               const SizedBox(height: 35),
//
//               // Username Field
//
//               TextField(
//                 controller: usernameController,
//                 decoration: const InputDecoration(
//                   labelText: 'Username',
//                   hintText: 'Enter your username',
//                   prefixIcon: Icon(Icons.person),
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//
//               const SizedBox(height: 20),
//
//               // Password Field
//               TextField(
//                 controller: passwordController,
//                 obscureText: !isPasswordVisible,
//
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                   hintText: 'Enter your password',
//                   prefixIcon: const Icon(Icons.lock),
//                   suffixIcon: IconButton(
//                     icon: Icon(
//                       isPasswordVisible
//                           ? Icons.visibility
//                           : Icons.visibility_off,
//                     ),
//
//                     onPressed: () {
//                       setState(() {
//                         isPasswordVisible = !isPasswordVisible;
//                       });
//                     },
//                   ),
//
//                   border: const OutlineInputBorder(),
//                 ),
//               ),
//
//               const SizedBox(height: 30),
//
//               // Custom Login Button
//               CustomButton(
//                 text: 'LOGIN',
//                 onPressed: login,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }