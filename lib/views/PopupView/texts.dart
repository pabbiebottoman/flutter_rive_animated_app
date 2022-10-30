// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

const SignInText = Text(
  'Sign in',
  style: TextStyle(
    color: Colors.black,
    fontFamily: 'Poppins Bold',
    fontSize: 34,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.none,
  ),
);

const PopupDescriptionText = Text(
  'Access to 240+ hours of content. '
  'Learn design and code, by building real '
  'apps with React and Swift.',
  style: TextStyle(
    color: Color.fromARGB(255, 130, 130, 130),
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    decoration: TextDecoration.none,
  ),
);

const EmailText = Text(
  'Email',
  style: TextStyle(
    color: Color.fromARGB(255, 130, 130, 130),
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    decoration: TextDecoration.none,
  ),
);

const PasswordText = Text(
  'Password',
  style: TextStyle(
    color: Color.fromARGB(255, 130, 130, 130),
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 16,
    decoration: TextDecoration.none,
  ),
);

const ORText = Padding(
  padding: EdgeInsets.symmetric(horizontal: 10),
  child: Text(
    'OR',
    style: TextStyle(
      color: Color.fromARGB(255, 130, 130, 130),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w600,
      fontSize: 16,
      decoration: TextDecoration.none,
    ),
  ),
);

const FooterText = Padding(
  padding: EdgeInsets.symmetric(vertical: 20),
  child: Text(
    'Sign up with Email,Apple, Google',
    style: TextStyle(
      color: Color.fromARGB(255, 130, 130, 130),
      fontFamily: 'Inter',
      fontWeight: FontWeight.w400,
      fontSize: 15,
      decoration: TextDecoration.none,
    ),
  ),
);
