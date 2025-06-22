# 🪖 Army Modeling

A simple Ruby simulation exercise to model armies, their units, civilizations, and battles. This exercise is part of the Amalgama process interview for Software Engineer role.

## 📁 Project Structure

.
├── civilizations
│   ├── bizantine_civilization.rb
│   ├── british_civilization.rb
│   ├── chinese_civilization.rb
│   └── civilization.rb
├── helpers
│   ├── logs.helper.rb
│   └── names.helper.rb
├── main.rb
├── src
│   ├── army.rb
│   ├── battle_builder.rb
│   └── battle_record.rb
└── units
    ├── bowman_unit.rb
    ├── knight_unit.rb
    ├── pikeman_unit.rb
    └── unit.rb

## 🧱 Classes Overview

### Units (`units/`)
- `Unit`: Base class with strength points, training, and power-up logic.
- `PikemanUnit`, `BowmanUnit`, `KnightUnit`: Extend `Unit`, each with specific stats and upgrade paths.
  
### Civilizations (`civilizations/`)
- `Civilization`: Base class with the initial arrangement of the army units.
- `ChineseCivilization`, `BritishCivilization`, `BizantineCivilization`: Subclasses with theire predefined unit counts based on the civilization type.

### Army (`src/army.rb`)
- Build all the army logic:
  - Train/power-up units
  - Track and display stats
  - Handle gold economy
  - Store battle history

### Battle System (`src/battle_builder.rb`, `src/battle_record.rb`)
- `BattleBuilder`: Simulates a fight between two armies and records the outcome.
- `BattleRecord`: Stores the result, opponent, and date.

### Main class (`./main.rb`)
- Show the initial unit stats
- Show the initial army stats
- Show the training process
- Show the power-up process
- Runs a bizantine vs british battle (no upgrades)
- Runs a chinese vs chinese armies battle (test de draw)
- Runs a chinese vs british battle (with upgrades)

## 🚀 Running the exercise

Run the main file to test the full functionality:

```bash
ruby main.rb
