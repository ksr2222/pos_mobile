import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:pos_mobile/enum/pos_text_formfield_validation_rule.dart';
import 'package:pos_mobile/helper/pos_text_formfield.dart';
import 'package:pos_mobile/helper/social_button.dart';
import 'package:pos_mobile/helper/style.dart';
import 'package:pos_mobile/screens/login_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isPassword = true;
  bool isconfirmPassword = true;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final TapGestureRecognizer _recognizer = TapGestureRecognizer()
      ..onTap = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
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
                  'Sign Up',
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
                  'Create your account to continue',
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
                placeholder: 'Phone Number',
                rule: PosTextFormfieldValidationRule.digitNumber,
                onChanged: (p0) => setState(() {}),
                validator: (p0) {
                  RegExp phoneRegex = RegExp(r'^\d{8,}$');
                  if (p0 == null || !phoneRegex.hasMatch(p0)) {
                    return 'Phone number must be at least 8 digits';
                  }
                  return null;
                },
              ),
              SizedBox(height: 12),
              PosTextFormfield(
                controller: passwordController,
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
              PosTextFormfield(
                placeholder: 'Confirm Password',
                isObscure: isconfirmPassword,
                rule: PosTextFormfieldValidationRule.password,
                onChanged: (p0) => setState(() {}),
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (p0 != passwordController.text.trim()) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                suffixIcon: IconButton(
                  onPressed: () {
                    isconfirmPassword = !isconfirmPassword;
                    setState(() {});
                  },
                  icon: Icon(
                    isconfirmPassword
                        ? CupertinoIcons.eye_slash
                        : CupertinoIcons.eye,
                  ),
                ),
              ),
              SizedBox(height: 12),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "I'm agree to the",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: ' Terms & Conditions',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: StyleColor.primary,
                      ),
                    ),
                    TextSpan(
                      text: " and",
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                    TextSpan(
                      text: ' Privacy Policy',
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: StyleColor.primary,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 32),
              TextButton(
                onPressed: (_formKey.currentState?.validate() ?? false)
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
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
                  'Create Account',
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
                        text: 'Already have an account?',
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                      TextSpan(
                        text: ' Login',
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
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
