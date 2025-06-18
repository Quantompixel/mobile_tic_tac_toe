# Mobile Tic-Tac-Toe 🎮

A sleek, simple Tic-Tac-Toe game built in Flutter. This is my first Flutter mobile app, featuring:

* A polished, custom UI
* Two-player gameplay on a 3×3 grid
* Win/draw detection with end-game overlay
* “New Game” and “Reset” controls

---

## 📸 Screenshots

| Game in Progress | X Wins! Overlay |
|:----------------:|:---------------:|
| ![](/screenshots/sc_2.png) | ![](/screenshots/sc_1.png) |

---

## 🚀 Features

* **Custom UI**
  Hand-painted “X” and “O” icons, neumorphic grid tiles, smooth animations.

* **Game Logic**

  * Turn-based play (Player X / Player O)
  * Automatic win/draw detection
  * Overlay modal announcing the result
  * Reset & New Game buttons

* **Responsive Layout**
  Adapts to portrait and landscape modes.

---

## 🛠 Getting Started

### Prerequisites

* [Flutter SDK](https://flutter.dev/docs/get-started/install) (≥ 2.10)
* A connected device or emulator

### Installation

1. **Clone the repo**

   ```bash
   git clone https://github.com/your-username/mobile_tic_tac_toe.git
   cd mobile_tic_tac_toe
   ```

2. **Fetch packages**

   ```bash
   flutter pub get
   ```

3. **Run on device/emulator**

   ```bash
   flutter run
   ```

---

---

## 🔧 How It Works

1. **State Management**

   * The 3×3 grid is stored as a `List<int>` (`-1`=empty, `0`=X, `1`=O).
   * `playerId` toggles between `0` (X) and `1` (O).

2. **Placing a Symbol**

   * Tap an empty tile → `placeSymbol(index)`
   * Updates the grid, checks for win or draw, then switches player.

3. **Win/Draw Detection**

   * Predefined “winning positions” arrays are matched against the grid.
   * If three in a row by the same player → show win overlay.
   * If grid is full with no winner → show draw overlay.

4. **Reset & New Game**

   * “Reset” button clears the grid and restarts.
   * After a game ends, tap “New Game” in the overlay.

---

## 🤝 Contributing

Contributions, issues and feature requests are welcome! Feel free to:

* Improve the UI/UX
* Add an AI opponent
* Support online multiplayer

---

## 📄 License

This project is released under the [MIT License](LICENSE).

---

**Enjoy playing your first Flutter Tic-Tac-Toe! 🥳**
