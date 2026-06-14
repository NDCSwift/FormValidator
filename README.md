# ✔️ Form Validator
A SwiftUI form with real-time input validation — email format, password strength, required fields, and inline error messages.

---

## 🤔 What this is
This project demonstrates how to validate user input in a SwiftUI form as they type. It covers common validation rules (required fields, email format, minimum password length), showing and hiding error messages inline, and disabling the submit button until the form is valid. A practical template for any sign-up or settings form.

## ✅ Why you'd use it
- **Real-time validation** — Shows how to validate input on change and display error messages without submitting the form
- **Submit button state** — Demonstrates deriving a `isFormValid` computed property to enable/disable the submit button
- **Reusable validator logic** — Organizes validation rules into a clean, reusable structure separate from the view

## 📺 Watch on YouTube
[![Watch on YouTube](https://img.shields.io/badge/YouTube-Watch%20the%20Tutorial-red?style=for-the-badge&logo=youtube)](https://youtu.be/X6KXdmcjuCU)

> This project was built for the [NoahDoesCoding YouTube channel](https://www.youtube.com/@noahdoescoding).

---

## 🚀 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/NDCSwift/FormValidator.git
cd FormValidator
```

### 2. Open in Xcode
Double-click `FormValidator1.xcodeproj`.

### 3. Set Your Development Team
In Xcode: **TARGET → Signing & Capabilities → Team** — select your team.

### 4. Update the Bundle Identifier
Change `com.example.MyApp` to a unique reverse-domain ID.

## 🛠️ Notes
- No third-party dependencies required.
- If you see a code signing error, verify Team and Bundle ID are set.

## 📦 Requirements
- Xcode 15+
- iOS 16+

📺 [Watch the guide on YouTube](https://youtu.be/X6KXdmcjuCU)
