# AUVNET Flutter Internship Assessment

## Overview

This project is a simple e-commerce Flutter app developed using **Clean Architecture** and **BLoC pattern** for state management. It leverages **Supabase** as a backend service for authentication and data management, and uses **Hive** for local caching to support offline usage.

---

## Installation & Setup

### Prerequisites

- Flutter SDK (stable and up-to-date version)
- Internet connection for authentication and fetching data (with local cache fallback)
- Supabase project configured and connected (Supabase client initialized)
- Hive package for local data caching

### Steps to Run

1. **Clone the repository**

   ```bash
   git clone https://github.com/YourUsername/AUVNET-Flutter-Internship-Assessment.git
   cd AUVNET-Flutter-Internship-Assessment
   flutter pub get
   flutter run
2. **Project Structure**
lib/
├── app/
│   ├── app_colors.dart
│   ├── app_fonts.dart
│   └── app_themes.dart
├── core/
│   ├── di/
│   │   └── injection.dart
│   ├── error/
│   │   └── failure.dart
│   ├── network/
│   │   ├── network_constants.dart
│   │   └── network.dart
│   └── widgets/
│       ├── custom_button.dart
│       ├── custom_nav_bar.dart
│       └── custom_text_form_field.dart
├── features/
│   ├── auth/
│   │   ├── data/
│   │   │   ├── auth_repository_impl.dart
│   │   │   └── auth_repository.dart
│   │   ├── domain/
│   │   │   ├── repositories/
│   │   │   │   └── auth_repository.dart
│   │   │   └── usecases/
│   │   │       ├── login_usecase.dart
│   │   │       └── signup_usecase.dart
│   │   └── presentation/
│   │       ├── bloc/
│   │       │   ├── auth_bloc.dart
│   │       │   ├── auth_event.dart
│   │       │   └── auth_state.dart
│   │       ├── login/
│   │       │   ├── widget/
│   │       │   └── login_page.dart
│   │       └── sign_up/
│   │           ├── widget/
│   │           ├── sign_up_page_body.dart
│   │           └── sign_up_page.dart
│   ├── home/
│   │   ├── data/
│   │   │   ├── model/
│   │   │   └── repositories/
│   │   ├── domain/
│   │   │   ├── repositories/
│   │   │   └── usecases/
│   │   └── presentation/
│   │       ├── bloc/
│   │       ├── widget/
│   │       ├── home_layout.dart
│   │       └── home_page.dart
│   ├── onboarding/
│   │   ├── widget/
│   │   └── onboarding_page.dart
│   └── splash/
│       ├── widget/
│       └── splash_page.dart
└── main.dart


