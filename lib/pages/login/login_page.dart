import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../components/constants.dart';
import 'components/my_login_button.dart';
import 'components/my_textfield.dart';
import 'components/square_tile.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;

  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //text editing controller
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signUserIn() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
    } catch (e) {
      String errorMessage = 'An error occurred.';

      if (e is FirebaseAuthException) {
        if (e.code == 'user-not-found') {
          errorMessage = 'User not found.';
        } else if (e.code == 'wrong-password') {
          errorMessage = 'Wrong password.';
        }
        // Diğer hata durumlarını da buraya ekleyebilirsiniz.
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Error'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/login/logo.png',
                color: Theme.of(context).colorScheme.primary,
                height: 200,
              ),
              const Text(
                'Welcome back you\'ve been missed!',
                style: kLabelTextStyle,
              ),
              const SizedBox(height: 25),
              //mail textfiled
              MyTextField(
                controller: _emailController,
                hintText: 'Mail',
                obscureText: false,
              ),
              const SizedBox(height: 10),
              //password textfiled
              MyTextField(
                controller: _passwordController,
                hintText: 'Password',
                obscureText: true,
              ),
              const SizedBox(height: 10),
              //forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text('Forgot Password?', style: kLabelTextStyle),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              //sign in button
              MyButton(
                onTap: signUserIn,
                text: 'Sign In',
                color: Colors.limeAccent[400],
              ),
              const SizedBox(height: 50),

              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  const Text(
                    'Or continue with',
                    style: kLabelTextStyle,
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 0.5,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              // google + apple icon
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SquareTile(
                      onTap: () {
                        signInWithGoogle();
                      },
                      imagePath: 'assets/login/google.png'),
                  const SizedBox(width: 12),
                  SquareTile(onTap: () {}, imagePath: 'assets/login/apple.png'),
                ],
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Not a member?',
                    style: kLabelTextStyle,
                  ),
                  const SizedBox(width: 4),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                    child: const Text(
                      'Register now',
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20,
                          fontFamily: 'BebasNeue'),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
