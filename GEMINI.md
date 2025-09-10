## Project Overview

This is a Flutter-based mobile application for managing a MedusaJS ecommerce store. It allows users to manage products, orders, customers, and other store settings from their iOS or Android devices. The app uses the `medusa_admin_dart_client` to interact with the MedusaJS backend. Key technologies include Flutter, Dart, and various state management and UI libraries.

## Building and Running

### Prerequisites

- Flutter SDK
- An accessible MedusaJS backend instance

### Key Commands

- **Install dependencies:**
  ```bash
  flutter pub get
  ```

- **Run code generation:**
  ```bash
  flutter pub run build_runner build
  ```

- **Run the app:**
  ```bash
  flutter run
  ```

- **Build APK (Android):**
  ```bash
  flutter build apk
  ```

- **Build IPA (iOS):**
  ```bash
  flutter build ipa
  ```

## Development Conventions

- **State Management:** The project uses `flutter_bloc` for state management.
- **Routing:** Navigation is handled by the `auto_route` package.
- **Dependency Injection:** `get_it` and `injectable` are used for dependency injection.
- **Code Style:** The project uses `sizzle_lints` for linting.
- **Firebase:** The project uses Firebase for analytics and crashlytics, so a `firebase_options.dart` file (generated from the Firebase CLI) is required.
