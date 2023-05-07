// ----- STRINGS ------
import 'package:flutter/material.dart';

const baseURL = 'http://192.168.0.180:8000/api';
const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURL = baseURL + '/logout';
const userURL = baseURL + '/user';
const passwordURL = baseURL + '/changePassword';
const addAttIssuesURL = baseURL + '/addAttIssues';
const addSanitaryURL = baseURL + '/addSanitary';
const sendOtpURL = baseURL + '/sendOTP';
const verifyOtpURL = baseURL + '/verifyOTP';

// ----- Errors -----
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';
