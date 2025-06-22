# 📝 Taskzen_Flutter

A simple and elegant To-Do List app built using **Flutter** and **Hive** (a lightweight key-value database). This app allows users to add, complete, and delete tasks efficiently, with persistent local storage.

---

## 📱 Features

* ✅ Add new tasks using a dialog box
* ✔️ Mark tasks as completed (with strikethrough effect)
* 🗑️ Delete tasks with a slide gesture (using `flutter_slidable`)
* 💾 Persistent local storage using `Hive`
* 🐝 Clean and minimal yellow-themed UI
* ⚡ Fast performance with lightweight architecture

---

## 🛠️ Tech Stack

* **Flutter** (UI toolkit)
* **Hive** (`hive` & `hive_flutter` for NoSQL local storage)
* **flutter\_slidable** (for swipe-to-delete functionality)
* **Dart** (programming language)

---

## 📂 Project Structure

```
lib/
├── main.dart
├── pages/
│   └── home_page.dart
├── util/
│   ├── dialog_box.dart
│   ├── todo_tile.dart
│   └── my_button.dart
├── database/
│   └── database.dart
```

---

## 🚀 Getting Started

### 🔧 Prerequisites

* Flutter SDK installed
* Dart SDK installed
* A device/emulator or web support

### 🧹 Packages Used

```yaml
dependencies:
  flutter:
    sdk: flutter
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  flutter_slidable: ^3.0.0
```

### 💻 Run Locally

```bash
git clone https://github.com/your-username/flutter-todo-app.git
cd flutter-todo-app
flutter pub get
flutter run
```

---

## 📌 TODO (Future Enhancements)

* [ ] Add dark mode support
* [ ] Task categories / labels
* [ ] Reminders & notifications
* [ ] Cloud sync using Firebase

---

## 🧑‍💻 Author

**Glen Jayson Dmello**
📧 [glendmello04@glenmail.com](mailto:glendmello04@glenmail.com)
🌐 GitHub: [glenjaysondmello](https://github.com/glenjaysondmello)

---
