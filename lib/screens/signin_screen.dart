import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  static const routeName = '/auth-screen';
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: const Color.fromRGBO(229, 229, 229, 1),
      body: Column(
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
            height: height * 0.15,
          ),
          const Text(
            'Welcome Back!',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: height * 0.04,
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
                autofocus: true,
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
                textInputAction: TextInputAction.done,
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
            height: height * 0.025,
          ),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Forgot Password',
              style: TextStyle(
                letterSpacing: 0.4,
                fontSize: 16,
                color: Color.fromRGBO(80, 194, 201, 1),
              ),
            ),
          ),
          SizedBox(
            height: height * 0.01,
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
              'Sign in',
            ),
          ),
          SizedBox(
            height: height * 0.001,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Don\'t have an account?',
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Sing Up',
                  style: TextStyle(
                    color: Color.fromRGBO(80, 194, 201, 1),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
