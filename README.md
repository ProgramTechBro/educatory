# Educatory
 
A full-scale Flutter live-tutoring and on-demand-courses app — pixel-matched from Figma, built with Clean Architecture.
 
> **Status:** UI complete. This repo currently contains a fully built, pixel-perfect front-end only — no backend integration yet. A `chat` module scaffold is included as a starting point for the real-time messaging + audio/video calling feature (built as a separate dedicated project and to be wired in later).
 
---
 
## Features
 
### Onboarding & Authentication
- Role selection
- Phone/OTP verification
- Profile setup with photo upload
### Home & Discovery
- Home dashboard with course and tutor discovery
- Shared search-and-filter experience
### Course Commerce
- Course detail screen (About / Reviews / Author tabs)
- Order summary
- Card and PayPal checkout
- Celebratory success screens
### Learning Experience (Post-Purchase)
- My Courses
- In-app video player
- Article reading
- Full quiz engine — scoring, results, and answer review
### Live Tutoring
- Browse live subjects
- Tutor profiles (reviews, education history)
- Schedule a future session (custom calendar + time-slot picker)
- Request an instant session (live countdown)
- Incoming-call and video-call screens
- Post-session ratings
### Chat / Messaging
- Real-time-style chat/messaging module (UI scaffold — backend not yet implemented)
### Account & Settings
- Personal info
- Payment methods
- Support tickets
- Login security with two-factor verification
- Privacy policy & terms
- Account deletion
---
 
## Architecture
 
Built using **Clean Architecture** with strict separation of concerns:
 
```
lib/
 ├── core/              # Shared utilities, constants, themes, base classes
 ├── features/
 │   ├── auth/
 │   ├── onboarding/
 │   ├── courses/
 │   ├── learning/
 │   ├── search/
 │   ├── live_tutoring/
 │   ├── scheduling/
 │   ├── session/
 │   ├── chat/          # 🔧 scaffold only — dummy structure for future implementation
 │   ├── profile/
 │   └── cart_payment/
 └── main.dart
```
 
Each feature module follows the standard 3-layer split:
 
```
feature_name/
 ├── data/              # Models, data sources, repository implementations
 ├── domain/            # Entities, repository interfaces, use cases
 └── presentation/      # Screens, widgets, Bloc/Cubit (state management)
```
 
This structure keeps each feature isolated and easy to pick up — you can open any single module folder and understand its full flow without needing context from the rest of the app.
 
---
 
## Tech Stack
 
| Layer | Technology |
|---|---|
| Framework | Flutter |
| State Management | `flutter_bloc` |
| Architecture | Clean Architecture (domain / data / presentation) |
| Design | Pixel-matched from Figma |
 
---
 
## Chat Module — Note
 
The `features/chat` folder currently contains a **dummy folder/file structure only**, following the same clean architecture pattern as the rest of the app. It's meant as a guide for whoever continues this project — the actual real-time messaging, push notifications, and WebRTC audio/video calling logic will be built as a separate project and integrated here afterward.
 
If you're picking this up: follow the same domain/data/presentation pattern already used in the other feature modules when implementing chat.
 
---
 
## Getting Started
 
### Prerequisites
- Flutter SDK installed ([install guide](https://docs.flutter.dev/get-started/install))
- Android Studio / Xcode (for platform-specific builds)
- An IDE (VS Code / Android Studio) with the Flutter & Dart plugins
### Setup
 
```bash
# Clone the repo
git clone <repo-url>
cd educatory
 
# Install dependencies
flutter pub get
 
# Run the app
flutter run
```
 
> ⚠️ This build is UI-only. There is no backend connected yet — all data shown is static/mock. Screens are fully designed and navigable, but actions like login, purchases, and live sessions are not yet functional.
 
---
 
## Contributing
 
This project is open for anyone to continue building on top of:
 
1. Fork or clone the repo
2. Follow the existing Clean Architecture pattern for any new feature or module
3. Keep state management consistent with `flutter_bloc`
4. If working on chat/calling, refer to the `chat` module scaffold for the intended structure
Pull requests and forks are welcome.
