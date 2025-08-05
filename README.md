# My Todo Tasks App

A cross-platform Todo Task Management Mobile Application developed using Flutter and Firebase. This app allows users to sign in securely with Google and manage their personal tasks efficiently with features such as task creation, editing, deletion, reminders, and filtering by status and priority.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Tech Stack](#tech-stack)
- [Installation and Setup](#installation-and-setup)
- [Screenshots](#screenshots)
- [Developer Info](#developer-info)
- [Final Notes](#final-notes)

## Overview

**My Todo Tasks App** is designed to help users stay organized by keeping track of their daily tasks. The app is fully responsive, supports both Android and Web platforms, and ensures real-time synchronization of tasks via Firebase. It is developed as part of a hackathon hosted by [katomaran.com](https://www.katomaran.com).

## Features

- Google Sign-In using Firebase Authentication
- Create, edit, delete tasks
- Add description, due date, and priority to tasks
- Mark tasks as complete or incomplete
- View tasks under tabs: All, Completed, Pending
- Real-time search functionality
- Local notifications for due tasks
- Smooth UI animations and transitions
- Fully responsive for mobile and web
- Secure and scalable backend using Firebase Firestore

## Tech Stack

- **Flutter** – Frontend and UI development
- **Dart** – Programming language for Flutter
- **Firebase Authentication** – Secure login with Google
- **Firebase Cloud Firestore** – NoSQL database for task storage
- **flutter_local_notifications** – Local notifications for reminders
- **VS Code** – Development environment

## Installation and Setup

1. **Clone the repository**

   ```bash
   git clone https://github.com/KISHORE0KUMAR-K/My-Todo-Tasks-App.git
   cd My-Todo-Tasks-App

2. **Install dependencies**

   ```bash
   flutter pub get

3. **Configure Firebase**

Set up a Firebase project at https://console.firebase.google.com

Enable Firebase Authentication and configure Google Sign-In

Create a Cloud Firestore database

Download google-services.json (for Android) and place it in android/app/

For Web, copy the Firebase configuration and replace it inside web/index.html

4. **Run the app**

For Android:
   flutter run
For Web:
   flutter run -d chrome

**SCREENSHOTS OF MY TODO TASKS APP**
<img width="1464" height="764" alt="Screenshot 2025-08-06 004005" src="https://github.com/user-attachments/assets/503a22f1-12cf-47f4-b4d9-c7203c97de75" />
<img width="1278" height="982" alt="Screenshot 2025-08-05 223705" src="https://github.com/user-attachments/assets/881cbc76-12d4-41e9-8b47-b9f8091c16d9" />

**SCREEN RECORD OF THE WORKING OF APPLICATION**
https://github.com/user-attachments/assets/5e75fba0-0c3d-4304-bc1b-c260147787b2

**Developer Info**

Name: Kishore Kumar K  - 
Email: kkishorekumar2004@gmail.com:  - 
LinkedIn: linkedin.com/in/kishorekumark07

**Final Notes**-
This project was developed in under 48 hours as part of a hackathon hosted by katomaran.com.

The goal was to build a cross-platform Todo Task Management App with Firebase integration, social login, offline support, notifications, and clean UI.

The app is designed for scalability and real-world usability, focusing on user experience and clean, maintainable code.

Special attention was given to real-time updates, intuitive task management, and responsive design for both mobile and web.

