import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = '/signup-screen';
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final bottomSize = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            SizedBox(
              height: height * 0.2,
              child: Stack(
                children: const [
                  Positioned(
                    top: -50,
                    child: Opacity(
                      opacity: 0.49,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(106, 224, 217, 1),
                        radius: 70,
                      ),
                    ),
                  ),
                  Positioned(
                    left: -50,
                    child: Opacity(
                      opacity: 0.49,
                      child: CircleAvatar(
                        backgroundColor: Color.fromRGBO(106, 224, 217, 1),
                        radius: 70,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: height * 0.1,
            ),
            const Text(
              'Welcome Onboard!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            const Text(
              'Ler\'s help you meet up your tasks',
              style: TextStyle(
                fontSize: 13,
              ),
            ),
            SizedBox(
              height: height * 0.049,
            ),
            Container(
              height: height * 0.07,
              // padding: EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Center(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: 'Enter your full name',
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.021,
            ),
            Container(
              height: height * 0.07,
              // padding: EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Center(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: 'Enter your email',
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.021,
            ),
            Container(
              height: height * 0.07,
              // padding: EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Center(
                child: TextFormField(
                  textInputAction: TextInputAction.next,
                  decoration: const InputDecoration(
                    enabledBorder: InputBorder.none,
                    border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(30))),
                    hintText: 'Enter password',
                    contentPadding: EdgeInsets.symmetric(horizontal: 15),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.021,
            ),
            Container(
              height: height * 0.07,
              // padding: EdgeInsets.symmetric(horizontal: 15),
              margin: const EdgeInsets.symmetric(
                horizontal: 25,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
              child: Center(
                child: Container(
                  child: TextFormField(
                    textInputAction: TextInputAction.done,
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.all(Radius.circular(30))),
                      hintText: 'Confirm password',
                      contentPadding: EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * 0.05,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(80, 194, 201, 1),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.35,
                    vertical: MediaQuery.of(context).size.height * 0.02,
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Register',
              ),
            ),
            SizedBox(
              height: height * 0.001,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Already have an account?',
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Sing In',
                    style: TextStyle(
                      color: Color.fromRGBO(80, 194, 201, 1),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
