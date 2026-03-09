# Flutter Clean Architecture BLoC Product App

## Overview

This project is a Flutter mobile application built using **Clean Architecture** and **BLoC state management**.
The application fetches product data from a REST API and displays it in a **vertically scrollable image list** while handling **loading, success, and error states**.

Additionally, the app integrates **Firebase Cloud Messaging (FCM)** to receive push notifications in both **foreground and background** states.

---

# Architecture

The project follows **Clean Architecture**, separating the application into three main layers:

```
Presentation Layer
│
├── UI Screens
├── BLoC (State Management)
└── Widgets

Domain Layer
│
├── Entities
├── Repository Contracts
└── UseCases

Data Layer
│
├── Models
├── API Data Sources
└── Repository Implementations
```

### Flow of Data

```
UI → BLoC → UseCase → Repository → DataSource → REST API
```

This architecture improves:

* Maintainability
* Testability
* Separation of concerns
* Scalability

---

# Project Structure

```
lib/

core/
   network/
   error/

features/
   products/
      data/
         datasources/
         models/
         repositories/
      domain/
         entities/
         repositories/
         usecases/
      presentation/
         bloc/
         screens/
         widgets/

firebase/
   firebase_notification_service.dart

main.dart
firebase_options.dart
```

---

# State Management

The application uses **BLoC (Business Logic Component)** for managing state.

### BLoC States

* ProductInitial
* ProductLoading
* ProductLoaded
* ProductError

### Example Flow

```
FetchProducts Event
      ↓
ProductBloc
      ↓
ProductLoading
      ↓
API Request
      ↓
ProductLoaded / ProductError
```

---

# REST API Integration

Product data is fetched from the following API:

```
https://fakestoreapi.com/products
```

The API response is converted into models and then mapped to domain entities.

Example fields:

* id
* title
* description
* image
* price
* rating

---

# Vertical Image List

The application displays products using:

```
ListView.builder()
```

Features:

* Efficient rendering
* Network images
* Pull-to-refresh support
* Scrollable UI

Each item contains:

* Product Image
* Product Title
* Product Price

---

# Firebase Push Notifications

Firebase Cloud Messaging (FCM) is integrated to support push notifications.

### Implementation Steps

1. Firebase project created
2. Firebase added using **FlutterFire CLI**
3. `firebase_core` and `firebase_messaging` packages installed
4. Firebase initialized in `main.dart`
5. Notification service created
6. Foreground and background notifications handled

Example listeners:

```
FirebaseMessaging.onMessage
FirebaseMessaging.onBackgroundMessage
```

---

# Features

• Clean Architecture
• BLoC State Management
• REST API integration
• Vertical image list
• Pull-to-refresh
• Firebase push notifications
• Reusable widgets
• Error handling
• Maintainable folder structure

---

# Running the Project

### 1 Install dependencies

```
flutter pub get
```

### 2 Run the app

```
flutter run
```

---

# Build APK

To generate release APK:

```
flutter build apk
```

APK location:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

# Deliverables

The submission includes:

* GitHub repository containing source code
* APK file for installation
* Documentation explaining architecture and implementation

---

# Author

Flutter Developer Assignment
Clean Architecture + BLoC + Firebase Implementation

Vamsi Kosuri
