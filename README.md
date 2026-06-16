# firebase_authentication_and_database
# DevelopersHub Internship - Week 5: Firebase Authentication & Cloud Firestore
A high-performance, architecture-driven Flutter application developed as the core deliverable for Week 5 of Phase 2 in the DevelopersHub training program. This milestone marks the architectural transition from local data storage into scalable Cloud Backend Services using the native Firebase Ecosystem.

## 🎯 Learning Objectives Achieved
- **Ecosystem Setup & Security:** Configured Firebase utilizing the modern `FlutterFire CLI` toolchain, avoiding legacy native configuration clutter. Secured project secrets by injecting `firebase_options.dart` directly into the `.gitignore` matrix.
- **Identity & Access Management (Auth):** Built safe client-side Email/Password Authentication pipelines to validate, register, and login remote users seamlessly.
- **Cloud Firestore Orchestration:** Developed dynamic transactional queries to store user metadata on registration, and pull individual records live using immutable Document IDs mapped precisely to the user's Firebase Security UUID (`uid`).
- **Clean Component Reusability (DRY):** Refactored the presentation views completely into abstract, state-aware reusable widgets (`CustomTextField`, `CustomButton` with reactive loaders, and `ProfileInfoTile`) to optimize maintenance and component life.

## 🏗️ Architectural Separation of Concerns
This project strictly enforces decoupling between Cloud Backend mutations and pure Presentation layouts:
```text
lib/
│├── data/
├── services/
│   ├── firebase_auth_service.dart   # Remote Identity & Auth Error Parsing
│   └── firestore_service.dart       # NoSQL Firestore Database Operations
│
├── presentation/
│   ├── widgets/
│   │   ├── custom_text_field.dart   # Unified Input Fields
│   │   ├── custom_button.dart       # Native Async Loading Button
│   │   └── profile_info_tile.dart   # Profile Row Data Presenter
│   └── screens/
│       ├── login_screen.dart        # Authentication Gateway View
│       ├── signup_screen.dart       # Account Generation View
│       └── profile_screen.dart      # Real-Time Cloud Profile Presenter
│
└── main.dart                        # Native Bootstrapper & Session Guard