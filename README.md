# 🔬 Skin Disease Detector - AI-Powered Dermatological Assistant

[![Flutter](https://img.shields.io/badge/Flutter-3.7+-02569B?style=for-the-badge&logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.7+-0175C2?style=for-the-badge&logo=dart&logoColor=white)](https://dart.dev)
[![AI / Deep Learning](https://img.shields.io/badge/AI-Computer_Vision_&_CNN-FF6F00?style=for-the-badge&logo=tensorflow&logoColor=white)](https://www.tensorflow.org)
[![Networking](https://img.shields.io/badge/Networking-Dio_Multipart-orange?style=for-the-badge)](https://pub.dev/packages/dio)
[![License](https://img.shields.io/badge/License-MIT-green.svg?style=for-the-badge)](LICENSE)

An intelligent, cross-platform **Flutter & Deep Learning healthcare application** designed for early-stage detection and classification of dermatological skin diseases through computer vision, coupled with a complete **telemedicine consultation and appointment booking ecosystem**.

---

## 🌟 Key Features

* **📸 Real-Time Lesion Image Capture:** Take photos via camera or select high-resolution images from the gallery with automated preprocessing.
* **🧠 AI/ML Diagnostic Engine:** Streams image bytes via multipart HTTP requests to a deep learning inference server for real-time classification (Eczema, Melanoma, Psoriasis, Acne, Fungal infections, etc.).
* **📑 Detailed Diagnostic Reports:** Immediate presentation of detected conditions, disease descriptions, severity levels, and suggested precautions.
* **👨‍⚕️ Dermatologist Appointment Booking:** Search verified dermatologists by specialty, select consultation dates, and book appointments directly.
* **📅 Booking Status Tracker:** Real-time visibility into appointment approvals, scheduled timings, and doctor remarks.
* **🌐 Dynamic Backend IP Switcher:** Configurable backend server IP address utility for testing against local development servers, hospital networks, or cloud APIs.
* **💬 Grievance & Feedback Portal:** Two-way complaint resolution ticketing system and user review submission.

---

## 🏗️ System Architecture & Workflow

─────┐ │ 📱 Flutter Mobile App │ │ - Camera / Gallery Capture (ImagePicker) │ │ - Patient Authentication & Profiles │ │ - Doctor Booking & Appointment Schedules │ └─────────────────────────────┬─────────────────────────────┘ │ Multipart HTTP (Dio) │ ▼ ┌───────────────────────────────────────────────────────────┐ │ 🧠 Backend & Machine Learning API │ │ - Image Preprocessing & Normalization │ │ - CNN / Vision Model Inference (e.g. ResNet / MobileNet) │ │ - Prediction & Confidence Scoring │ │ - Doctor Scheduling Database │ └─────────────────────────────┬─────────────────────────────┘ │ Diagnostic JSON & Recommendations │ ▼ ┌───────────────────────────────────────────────────────────┐ │ 📑 Mobile Clinical View │ │ - Disease Identification Result Screen │ │ - Nearby Specialist Recommendation & Booking │ └───────────────────────────────────────────────────────────┘

## 📂 Project Directory Structure
lib/ ├── main.dart # Application entry point & theme initialization ├── services/ # REST API & network communication layer │ ├── loginApi.dart # Patient authentication & base URL management │ ├── registerApi.dart # New patient registration │ ├── feedbackApi.dart # User review and rating submission │ └── qrpi.dart # Auxiliary QR & quick-connect services │ └── screns/ # Application UI & workflows ├── splash.dart # Splash branding screen ├── login.dart # Login interface ├── register.dart # Account creation interface ├── ip.dart # Dynamic server IP & port configurator ├── homepage.dart # Main dashboard with quick action tiles ├── imageupload.dart # Image capture & AI prediction submission ├── report.dart # Diagnostic analysis & results view ├── doctors.dart # Specialist doctor directory & booking ├── viewbookingstatus.dart # Real-time appointment status tracker ├── complaints.dart # Grievance registration ├── complaintreply.dart # Doctor/admin responses to tickets └── feedback.dart # App & consultation feedback



---

## 🛠️ Tech Stack & Dependencies

* **Frontend:** [Flutter](https://flutter.dev) (Dart SDK `^3.7.0`)
* **HTTP Client & Multipart Uploads:** [`dio`](https://pub.dev/packages/dio)
* **Image Capture:** [`image_picker`](https://pub.dev/packages/image_picker)
* **Date & Formatting:** [`intl`](https://pub.dev/packages/intl)
* **UI Design:** Custom gradient theme with modern Material 3 components.

---

## 🚀 Getting Started

### 1. Prerequisites
* [Flutter SDK](https://docs.flutter.dev/get-started/install) (v3.7.0 or higher)
* Android Studio / VS Code with Flutter extension
* An active AI inference backend server running the `/detect/` model endpoint

### 2. Clone the Repository
```bash
git clone https://github.com/Yyshnav/skin-disease-detector.git
cd skin-disease-detector



---

### Steps to update on GitHub:
1. Open [skin-disease-detector on GitHub](https://github.com/Yyshnav/skin-disease-detector).
2. Click the **Pencil (Edit)** button on `README.md`.
3. Paste the markdown content above and click **"Commit changes..."**.
