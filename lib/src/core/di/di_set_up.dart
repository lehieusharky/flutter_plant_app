import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

ThemeData theme(BuildContext context) => Theme.of(context);

FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
