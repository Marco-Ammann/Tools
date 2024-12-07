
# Tools zur Projektverwaltung 🚀

Diese Sammlung von PowerShell-Skripten bietet dir praktische Werkzeuge, um deine Projekte effizient zu verwalten.

---

## Übersicht der Tools 🛠️

| Tool                   | Beschreibung                                                      |
|------------------------|------------------------------------------------------------------|
| **Backup-Skript**      | Sichert Projekte mit Tages- und Zeitstempeln in einem Backup-Ordner. |
| **Projekt-Setup-Befehl** | Erstellt Projekte für verschiedene Frameworks und Sprachen.       |
| **GitHub-Push-Skript** | Pusht Änderungen im aktuellen Verzeichnis auf GitHub.             |
| **Node.js-Cache-Cleaner** | Löscht alle `node_modules`-Ordner in den Projekten.              |
| **Python-Requirements-Checker** | Prüft, ob Python-Abhängigkeiten installiert sind.             |

---

## 🗂️ 1. Backup-Skript

Erstellt ein Backup aller Projekte im `Projects`-Verzeichnis.

### Nutzung:
```powershell
backup
```

### Funktionen:
- Schließt `node_modules` und `.git` aus.
- Speichert Logs im Tages-Unterordner von `Logs`.

---

## 🛠️ 2. Projekt-Setup-Befehl: `new`

Erstellt Projekte für verschiedene Frameworks oder Programmiersprachen.

### Unterstützte Typen:
- `angular` - Erstellt ein Angular-Projekt.
- `python` - Erstellt ein Python-Projekt mit virtueller Umgebung.
- `node` - Erstellt ein Node.js-Projekt.
- `vue` - Erstellt ein Vue.js-Projekt.
- `react` - Erstellt ein React-Projekt.

### Nutzung:
```powershell
new -type <framework> -name <projectname>
```

### Beispiele:
- Angular-Projekt:
  ```powershell
  new -type angular -name MyAngularApp
  ```
- Python-Projekt:
  ```powershell
  new -type python -name MyPythonApp
  ```

---

## 🌐 3. GitHub-Push-Skript

Pusht Änderungen im aktuellen Verzeichnis auf GitHub.

### Nutzung:
```powershell
push
```

---

## 🧹 4. Node.js-Cache-Cleaner

Löscht alle `node_modules`-Ordner in den Projekten, um Speicherplatz freizugeben.

### Nutzung:
```powershell
clear-node-cache
```

---

## 🐍 5. Python-Requirements-Checker

Prüft, ob alle in der `requirements.txt` aufgeführten Abhängigkeiten installiert sind.

### Nutzung:
```powershell
check-requirements
```

---

## Hinweise und Erweiterungen

- **Alias-Einrichtung:** Füge die Befehle deinem PowerShell-Profil (`$PROFILE`) hinzu, um sie jederzeit verwenden zu können.
- **Erweiterungen:** Weitere Frameworks und Funktionen können leicht hinzugefügt werden.

