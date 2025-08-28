import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos_mobile/enum/pos_text_formfield_validation_rule.dart';
import 'package:pos_mobile/helper/pos_text_formfield.dart';
import 'package:pos_mobile/helper/social_button.dart';
import 'package:pos_mobile/helper/style.dart';
import 'package:pos_mobile/screens/main_screen.dart';
import 'package:pos_mobile/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPassword = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final TapGestureRecognizer _recognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignupScreen()),
        );
      };
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        backgroundColor: StyleColor.secondary,
        body: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.all(20),
            children: [
              SizedBox(height: 10),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(
                    fontSize: 32,
                    color: StyleColor.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Center(
                child: Text(
                  'Welcome back! Please login to your account.',
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Row(
                children: [
                  // Facebook Button
                  Expanded(
                    child: SocialButton(
                      onPressed: () {
                        // print('login with facebook');
                      },
                      label: 'Facebook',
                      icon: 'assets/images/facebook_icon.png',
                    ),
                  ),
                  SizedBox(width: 16),
                  // Google Button
                  Expanded(
                    child: SocialButton(
                      onPressed: () {
                        // print('login with google');
                      },
                      label: 'Google',
                      icon: 'assets/images/google_icon.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Divider(color: HexColor('#D6D6D6'), endIndent: 8),
                  ),
                  Text(
                    'Or',
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: Divider(color: HexColor('#D6D6D6'), indent: 8),
                  ),
                ],
              ),
              SizedBox(height: 24),
              PosTextFormfield(
                placeholder: 'Email',
                rule: PosTextFormfieldValidationRule.email,
                onChanged: (p0) => setState(() {}),
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please enter your email';
                  }
                  RegExp emailRegex = RegExp(
                    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                  );
                  if (!emailRegex.hasMatch(p0)) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
              ),
              SizedBox(height: 24),
              PosTextFormfield(
                placeholder: 'Password',
                isObscure: isPassword,
                rule: PosTextFormfieldValidationRule.password,
                onChanged: (p0) => setState(() {}),
                validator: (p0) {
                  RegExp passwordRegex = RegExp(
                    r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{6,}$',
                  );
                  if (p0 == null || p0.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  if (!passwordRegex.hasMatch(p0)) {
                    return 'Password must contain uppercase, lowercase, number, and special character';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    isPassword = !isPassword;
                    setState(() {});
                  },
                  icon: Icon(
                    isPassword ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
                  ),
                ),
              ),
              SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Forgot Password?',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),
              SizedBox(height: 32),
              TextButton(
                onPressed: (_formKey.currentState?.validate() ?? false)
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainScreen()),
                        );
                      }
                    : null,
                style: ButtonStyle(
                  elevation: WidgetStatePropertyAll(30),
                  shadowColor: WidgetStatePropertyAll(
                    StyleColor.primary.withValues(alpha: 0.25),
                  ),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  padding: WidgetStatePropertyAll(EdgeInsets.all(18)),
                  backgroundColor: WidgetStateColor.resolveWith(
                    (states) => states.contains(WidgetState.disabled)
                        ? StyleColor.primary.withValues(alpha: 0.5)
                        : StyleColor.primary,
                  ),
                ),
                child: Text(
                  'Log In',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: StyleColor.secondary,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Don\'t have an account?',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' Sign Up',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: StyleColor.primary,
                        ),
                        recognizer: _recognizer,
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
