// ----- STRINGS ------
import 'package:flutter/material.dart';

const baseURL = 'http://192.168.43.244:8000/api';
const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURL = baseURL + '/logout';
const userURL = baseURL + '/user';
const passwordURL = baseURL + '/changePassword';
const passwordURL2 = baseURL + '/changePassword2';
const addAttIssuesURL = baseURL + '/addAttIssues';
const addSanitaryURL = baseURL + '/addSanitary';
const sendOtpURL = baseURL + '/sendOTP';
const verifyOtpURL = baseURL + '/verifyOTP';
const assignmentURL = baseURL + '/getAssignmentElevator';
const PresenceURL = baseURL + '/getPresence';
const addPresence = baseURL + '/addPresence';
const updatePresence = baseURL + '/updatePresence';
const getIdPresence = baseURL + '/getIdPresence';

// ----- Errors -----
const serverError = 'Server error';
const unauthorized = 'Unauthorized';
const somethingWentWrong = 'Something went wrong, try again!';
