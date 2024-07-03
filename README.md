# Todo Application

# Application Documentation

[Click to view Demo Video of the application](https://github.com/SaifIvnaAlam/todoapp/assets/73099787/9729184b-1726-4968-b185-ef4c5e882a66)


## How to run

### Prerequisites:

1. **Install Flutter:** Follow the [official installation guide](https://flutter.dev/docs/get-started/install) to install Flutter on your machine.
2. **Set up an IDE:** You can use Android Studio, IntelliJ IDEA, or Visual Studio Code with the Flutter and Dart plugins installed.
3. **Git:** Install Git on your machine to clone the repository.

### Steps:

1. **Clone the Repository:**

   ```bash
   git clone <repository-url>
   ```

2. **Navigate to the Project Directory:**

   ```bash
   cd <project-directory>
   ```

3. **Clear and reinstall Dependencies:** Run on the terminal inside the project directory

```bash
1. flutter clean
2. flutter pub get
3. flutter packages pub run build_runner watch --delete-conflicting-outputs
```

4. **Run the Project:**

   ```bash
    flutter run
   ```

5 **Connect a Device:**

- **Physical Device:** Connect your Android or iOS device to your computer via USB and enable USB debugging.
- **Emulator:** Open your emulator from Android Studio AVD Manager or launch it using the flutter emulator command.

6. **Run on Device:**

- Physical Device: Once connected, run the project again using flutter run.
- Emulator: The project should automatically run on the emulator.
  Additional Steps (if needed):
- iOS Setup: If you're running on iOS, make sure you have Xcode installed and set up correctly.
- Android Setup: If you encounter any issues related to Android setup, follow the instructions in the Flutter documentation for Android setup.

## Notes:

Make sure your Flutter SDK is up to date by running Flutter upgrade.
