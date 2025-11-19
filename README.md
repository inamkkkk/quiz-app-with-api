# Quiz App

A Flutter quiz application that fetches trivia questions from a public API.

## Features

*   Fetches trivia questions from an API.
*   Displays questions with multiple-choice answers.
*   Allows users to select answers.
*   Tracks user scores.
*   Provides a summary screen with the final score.

## Technologies Used

*   Flutter
*   Dart
*   HTTP package (for API calls)
*   Provider (for state management)

## Folder Structure


lib/
├── main.dart
├── models/
│   └── question.dart
├── screens/
│   ├── quiz_screen.dart
│   └── result_screen.dart
├── services/
│   └── api_service.dart
