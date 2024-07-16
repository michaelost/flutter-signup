# Flutter Project

This is a Flutter project for creating a simple authentication page with validation.

## Prerequisites

Before you can run this project, you need to have the following installed:

- Flutter SDK: [Install Flutter](https://flutter.dev/docs/get-started/install)
- Xcode: [Download from the Mac App Store](https://apps.apple.com/us/app/xcode/id497799835?mt=12)
- CocoaPods: Install using `sudo gem install cocoapods`

## Setup Instructions

1. **Clone the Repository**:

   ```sh
   git clone https://github.com/your-username/your-repository.git
   cd your-repository
   ```

2. **Install Flutter SDK**:

   - Download the latest stable version of Flutter from the [official Flutter website](https://flutter.dev/docs/get-started/install).
   - Extract the Flutter SDK to your desired location (e.g., `~/flutter`).
   - Add the Flutter tool to your path by adding the following line to your `~/.zshrc` or `~/.bash_profile` file:
     ```sh
     export PATH="$PATH:`<path-to-flutter-directory>`/flutter/bin"
     ```
   - Run `source ~/.zshrc` or `source ~/.bash_profile` to refresh your terminal.
   - Verify the installation by running:
     ```sh
     flutter doctor
     ```

3. **Install Xcode**:

   - Download and install Xcode from the Mac App Store.
   - After installing Xcode, install the additional tools by running:
     ```sh
     sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
     sudo xcodebuild -runFirstLaunch
     ```
   - Accept the Xcode license agreement by running:
     ```sh
     sudo xcodebuild -license
     ```

4. **Install CocoaPods**:

   - CocoaPods is used to manage iOS project dependencies.
   - Install CocoaPods by running:
     ```sh
     sudo gem install cocoapods
     ```

5. **Enable macOS Support in Flutter**:

   - To create a macOS version of your Flutter project, run:
     ```sh
     flutter create .
     ```

6. **Install Dependencies**:

   - Navigate to your project directory and run:
     ```sh
     flutter pub get
     ```

7. **Run the Application**:

   - To run the application on macOS, use the following command:
     ```sh
     flutter run -d macos
     ```

## Project Structure

```
your-repository/
├── android/
├── ios/
├── lib/
│   ├── custom_sign_up_button.dart
│   ├── custom_text_form_field.dart
│   └── main.dart
├── linux/
├── macos/
├── test/
├── web/
├── windows/
├── .gitignore
├── analysis_options.yaml
├── pubspec.yaml
└── README.md
```

## Usage

- **Sign Up Form**:
  - Enter a valid email address.
  - Enter a password that is at least 8 characters long, contains at least one uppercase letter, and at least one digit.
  - Click the "Sign up" button to submit the form.

- **Validation**:
  - The form validates the email and password fields based on the specified criteria.
