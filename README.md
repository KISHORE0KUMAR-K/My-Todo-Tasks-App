# My Todo Tasks App

A cross-platform Todo Task Management Mobile Application developed using Flutter and Firebase. This app allows users to sign in securely with Google and manage their personal tasks efficiently with features such as task creation, editing, deletion, reminders, and filtering by status and priority.

---

## Table of Contents
- [Overview](#overview)
- [Features](#features)
- [Assumptions](#assumptions)
- [Tech Stack](#tech-stack)
- [Installation and Setup](#installation-and-setup)
- [Screenshots](#screenshots)
- [Developer Info](#developer-info)
- [Final Notes](#final-notes)

 ## 📦 Download & Try

[![Download](https://img.shields.io/badge/Download-APK-blue.svg)](https://github.com/KISHORE0KUMAR-K/My-Todo-Tasks-App/releases/download/v1.0/app-release.apk)

---


---

## Overview

**My Todo Tasks App** is designed to help users stay organized by keeping track of their daily tasks. The app is fully responsive, supports both Android and Web platforms, and ensures real-time synchronization of tasks via Firebase. It is developed as part of a hackathon hosted by [katomaran.com](https://www.katomaran.com).

---

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

---

## Assumptions

- The user requires only Google Sign-In for authentication.
- Tasks are only personal and not shared between users.
- Task notifications are assumed to be local, not push-based.
- Offline support will be limited to cached data and not full sync.


## Tech Stack

- **Flutter** – Frontend and UI development  
- **Dart** – Programming language for Flutter  
- **Firebase Authentication** – Secure login with Google  
- **Firebase Cloud Firestore** – NoSQL database for task storage  
- **flutter_local_notifications** – Local notifications for reminders  
- **VS Code** – Development environment  

---

## Installation and Setup

### 1. Clone the repository
```bash
git clone https://github.com/KISHORE0KUMAR-K/My-Todo-Tasks-App.git
cd My-Todo-Tasks-App
```

### 2. Install dependencies
```bash
flutter pub get
```

### 3. Configure Firebase

- Set up a Firebase project at [https://console.firebase.google.com](https://console.firebase.google.com)
- Enable Firebase Authentication and configure Google Sign-In
- Create a Cloud Firestore database
- Download `google-services.json` (for Android) and place it in `android/app/`
- For Web, copy the Firebase configuration and replace it inside `web/index.html`

### 4. Run the app
```bash
# For Android
flutter run

# For Web
flutter run -d chrome
```

---

## Screenshots

### UI Screenshots:
-<img width="1464" height="764" alt="TODO APP LOGIN PAGE" src="https://github.com/user-attachments/assets/c52ee1f7-9a24-4af9-9f14-0e670f298b20" />

<img width="1278" height="982" alt="TODO APP MAIN SCREEN" src="https://github.com/user-attachments/assets/319d17cd-d046-485b-afd6-cbad932a8961" />


### Demo Video:
[Screen Recording of the App in Action](https://github.com/user-attachments/assets/5e75fba0-0c3d-4304-bc1b-c260147787b2)

---

## Developer Info

- **Name**: Kishore Kumar K  
- **Email**: kkishorekumar2004@gmail.com  
- **LinkedIn**: [www.linkedin.com/in/kishorekumark07](https://www.linkedin.com/in/kishorekumark07)  

---

## Final Notes

This project was developed in under 48 hours as part of a hackathon hosted by [katomaran.com](https://www.katomaran.com).  
The goal was to build a cross-platform Todo Task Management App with Firebase integration, social login, offline support, notifications, and clean UI.  
The app is designed for scalability and real-world usability, focusing on user experience and clean, maintainable code.  
Special attention was given to real-time updates, intuitive task management, and responsive design for both mobile and web.

This project is a part of a hackathon run by https://www.katomaran.com

