# Home Assessment: To-Do List App

Objective: Create a simple application that allows users to manage a list of to-do tasks. This application should allow users to add, delete, and mark tasks as complete.

## Basic Requirements:

### 1. User Interface:

- Display a list of tasks.
- Include buttons or UI elements to add a new task and delete existing ones.
- Each task should be able to be marked as completed with a visual indication.

### 2. Functionality:

- Add a task to the list with a simple text description.
- Delete a task from the list.
- Mark a task as completed, which should strike through the task text or change its color.

### 3. State Management:

- The application should maintain the state of the task list when navigating between different screens or after closing and reopening the app.

## Bonus (Optional):

### 1. Persistence:

- Save the task list to local storage and retrieve it on app start-up.

### 2. Validation:

- Implement input validation to ensure the task description is not empty.

### 3. UI Polish:

- Add some animations when adding/deleting tasks for a better user experience.

### 4. Testing:

- Write a simple unit test for one of the functions (e.g., adding a task, or deleting a task).
  Submission Instructions(Optional)
- Push your code to a public Git repository on GitHub and share the link.
- Include a README file with instructions on how to run the application and any other necessary documentation.
- If you completed any bonus tasks, mention these in your README.
  Evaluation Criteria:
- Code Quality: Is the code clean, well-organized, and properly commented?
- Functionality: Does the app meet the basic requirements set out in the task?
- User Interface: Is the UI intuitive and user-friendly?
- Problem Solving: How are edge cases handled, and how robust is the app against user input errors?
- (Optional) Bonus Features: Were any bonus features completed, and how well do they work?

## Notes for the Candidate:

- Focus on writing clean, readable, and maintainable code.
- The UI doesn't need to be complex, but the app should be functional and free of bugs.
- Bonus features are optional but can be included to showcase additional skills

---

# Application Documentation

[Click to view Demo Video of the application](https://github.com/SaifIvnaAlam/todoapp/assets/73099787/9729184b-1726-4968-b185-ef4c5e882a66)

## Required Completed Features :

- Display a list of tasks.
- Add a new task and delete existing ones.
- Mark Task As completed with visual representation.
- Delete a task from the list.
- Maintaining state throughout the application.

## Bonus Features :

- Added Custom bounce animation on the buttons, tiles
- Added Animated Splash Screen
- Added Local database to store data
- Write a unit test for deleting tasks
- Showing Completed and incomplete tasks separately makes it more user-friendly
- Giving user action feedback with snack bar

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
