
# Tools zur Projektverwaltung 🚀

Diese Sammlung von PowerShell-Skripten bietet dir praktische Werkzeuge, um deine Projekte effizient zu verwalten.

---

## Inhaltsverzeichnis
- [Tools zur Projektverwaltung 🚀](#tools-zur-projektverwaltung-)
  - [Inhaltsverzeichnis](#inhaltsverzeichnis)
  - [Übersicht der Tools 🛠️](#übersicht-der-tools-️)
  - [Nutzung der Tools](#nutzung-der-tools)
    - [1. Backup-Skript](#1-backup-skript)
      - [Nutzung:](#nutzung)
      - [Funktionen:](#funktionen)
    - [2. Projekt-Setup-Befehl: `new`](#2-projekt-setup-befehl-new)
      - [Unterstützte Typen:](#unterstützte-typen)
      - [Nutzung:](#nutzung-1)
      - [Beispiele:](#beispiele)
    - [3. GitHub-Push-Skript](#3-github-push-skript)
      - [Nutzung:](#nutzung-2)
    - [4. Node.js-Cache-Cleaner](#4-nodejs-cache-cleaner)
      - [Nutzung:](#nutzung-3)
    - [5. Python-Requirements-Checker](#5-python-requirements-checker)
      - [Nutzung:](#nutzung-4)
  - [PowerShell-Profil einrichten](#powershell-profil-einrichten)
    - [Was ist das PowerShell-Profil?](#was-ist-das-powershell-profil)
    - [Schritte zur Einrichtung:](#schritte-zur-einrichtung)

## Übersicht der Tools 🛠️

| Tool                   | Beschreibung                                                      |
|------------------------|------------------------------------------------------------------|
| **Backup-Skript**      | Sichert Projekte mit Tages- und Zeitstempeln in einem Backup-Ordner. |
| **Projekt-Setup-Befehl** | Erstellt Projekte für verschiedene Frameworks und Sprachen.       |
| **GitHub-Push-Skript** | Pusht Änderungen im aktuellen Verzeichnis auf GitHub.             |
| **Node.js-Cache-Cleaner** | Löscht alle `node_modules`-Ordner in den Projekten.              |
| **Python-Requirements-Checker** | Prüft, ob Python-Abhängigkeiten installiert sind.             |

---

## Nutzung der Tools

### 1. Backup-Skript

Erstellt ein Backup aller Projekte im `Projects`-Verzeichnis.
Das Backupscript erstellt Logs und Verzeichnisse. (Siehe code um anpassungen vorzunehmen)

#### Nutzung:
```powershell
backup
```

#### Funktionen:
- Schließt `node_modules` und `.git` aus.
- Speichert Logs im Tages-Unterordner von `Logs`.

---

### 2. Projekt-Setup-Befehl: `new`

Erstellt Projekte für verschiedene Frameworks oder Programmiersprachen.

#### Unterstützte Typen:
- `angular` - Erstellt ein Angular-Projekt.
- `python` - Erstellt ein Python-Projekt mit virtueller Umgebung.
- `node` - Erstellt ein Node.js-Projekt.
- `vue` - Erstellt ein Vue.js-Projekt.
- `react` - Erstellt ein React-Projekt.

#### Nutzung:
```powershell
new -type <framework> -name <projectname>
```

#### Beispiele:
- Angular-Projekt:
  ```powershell
  new -type angular -name MyAngularApp
  ```
- Python-Projekt:
  ```powershell
  new -type python -name MyPythonApp
  ```

---

### 3. GitHub-Push-Skript

Pusht Änderungen im aktuellen Verzeichnis auf GitHub.

#### Nutzung:
```powershell
push
```

---

### 4. Node.js-Cache-Cleaner

Löscht alle `node_modules`-Ordner in den Projekten, um Speicherplatz freizugeben.

#### Nutzung:
```powershell
clear-node-cache
```

---

### 5. Python-Requirements-Checker

Prüft, ob alle in der `requirements.txt` aufgeführten Abhängigkeiten installiert sind.

#### Nutzung:
```powershell
check-requirements
```

---

## PowerShell-Profil einrichten

### Was ist das PowerShell-Profil?
Das PowerShell-Profil ist eine Datei, in der du benutzerdefinierte Funktionen und Aliase speichern kannst, damit sie in jeder PowerShell-Sitzung verfügbar sind.

### Schritte zur Einrichtung:
1. Öffne dein PowerShell-Profil:
   ```powershell
   notepad $PROFILE
   ```

2. Füge den folgenden Inhalt hinzu (oder passe ihn an):
   ```powershell
   # Alias für Backup
   function backup {
       $scriptPath = "D:\DevDrive\Tools\backup.ps1"
       if (Test-Path $scriptPath) {
           & "$scriptPath"
       } else {
           Write-Output "Backup-Skript nicht gefunden unter $scriptPath"
       }
   }

   # Alias für Projekt-Setup
   function new {
       param (
           [string]$type,
           [string]$name
       )

       if (-not $name) {
           Write-Output "Fehler: Kein Projektname angegeben."
           return
       }

       $projectsRoot = "D:\DevDrive\Projects"
       $projectPath = Join-Path $projectsRoot $name

       if (Test-Path $projectPath) {
           Write-Output "Fehler: Projektverzeichnis existiert bereits."
           return
       }

       New-Item -ItemType Directory -Path $projectPath | Out-Null
       Write-Output "Projektverzeichnis erstellt: $projectPath"

       switch ($type) {
           "angular" {
               Write-Output "Erstelle ein Angular-Projekt..."
               Set-Location $projectsRoot
               ng new $name --skip-install
               Set-Location $projectPath
               npm install
               Write-Output "Angular-Projekt erstellt und Abhängigkeiten installiert."
           }
           "python" {
               Write-Output "Erstelle ein Python-Projekt..."
               python -m venv "$projectPath\venv"
               Write-Output "Python-Umgebung erstellt."
           }
           "node" {
               Write-Output "Initialisiere ein Node.js-Projekt..."
               Set-Location $projectPath
               npm init -y
               Write-Output "Node.js-Projekt erstellt."
           }
           "vue" {
               Write-Output "Erstelle ein Vue.js-Projekt..."
               Set-Location $projectsRoot
               npx create-vue@latest $name
               Set-Location $projectPath
               Write-Output "Vue.js-Projekt erstellt."
           }
           "react" {
               Write-Output "Erstelle ein React-Projekt..."
               Set-Location $projectsRoot
               npx create-react-app $name
               Set-Location $projectPath
               Write-Output "React-Projekt erstellt."
           }
           default {
               Write-Output "Fehler: Unbekannter Projekttyp '$type'. Verfügbare Typen: angular, python, node, vue, react"
               return
           }
       }

       Set-Content -Path "$projectPath\README.md" -Value "# $name`n`nInitial Setup"
       Write-Output "README.md erstellt."

       $pushToGitHub = Read-Host "Möchtest du ein GitHub-Repository erstellen? (y/n)"
       if ($pushToGitHub -eq "y") {
           Write-Output "Füge ein Remote-Repository hinzu..."
           $gitHubUrl = Read-Host "Gib die GitHub-URL ein (z.B. https://github.com/username/repository.git)"
           Set-Location $projectPath
           git init
           git add .
           git commit -m "Initial Commit"
           git remote add origin $gitHubUrl
           git branch -M main
           git push -u origin main
           Write-Output "Projekt erfolgreich auf GitHub erstellt."
       } else {
           Write-Output "Projekt wurde lokal eingerichtet."
       }

       Write-Output "Projekt erfolgreich eingerichtet: $projectPath"
   }

   # Alias für Node.js Cache Cleaner
   function clear-node-cache {
       $projectsRoot = "D:\DevDrive\Projects"
       Write-Output "Suche nach node_modules-Ordnern in: $projectsRoot"
       Get-ChildItem -Path $projectsRoot -Recurse -Directory -Force | Where-Object {
           $_.Name -eq "node_modules"
       } | ForEach-Object {
           Write-Output "Lösche: $($_.FullName)"
           Remove-Item -Recurse -Force -Path $_.FullName
       }
       Write-Output "Alle node_modules-Ordner wurden entfernt."
   }

   # Alias für Python Requirements Checker
   function check-requirements {
       if (-not (Test-Path "requirements.txt")) {
           Write-Output "Fehler: requirements.txt nicht gefunden."
           return
       }
       Write-Output "Überprüfe Python-Abhängigkeiten..."
       Get-Content "requirements.txt" | ForEach-Object {
           $package = $_
           $result = pip show $package 2>&1
           if ($result -match "WARNING: Package") {
               Write-Output "$package fehlt!"
           } else {
               Write-Output "$package ist installiert."
           }
       }
       Write-Output "Überprüfung abgeschlossen."
   }
   ```

3. Lade das Profil neu:
   ```powershell
   . $PROFILE
   ```

4. Teste die Befehle:
   ```powershell
   backup
   new -type angular -name MyAngularApp
   push
   clear-node-cache
   check-requirements
   ```

---

Viel Spaß mit diesen Tools! Bei Fragen oder Erweiterungen kannst du gerne Kontakt aufnehmen.
