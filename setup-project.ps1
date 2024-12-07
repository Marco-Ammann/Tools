# Projekt-Setup-Skript

# Projektname abfragen
$projectName = Read-Host "Gib einen Projektnamen ein"
if (-not $projectName) {
    Write-Output "Fehler: Kein Projektname angegeben."
    exit
}

# Framework oder Programmiersprache auswählen
Write-Output "Wähle ein Framework oder eine Sprache:"
Write-Output "1: Node.js"
Write-Output "2: Angular"
Write-Output "3: Python"
Write-Output "4: Leeres Projekt"
$frameworkChoice = Read-Host "Gib die Zahl ein, die deinem Wunsch entspricht (z.B. 1)"

# Zielverzeichnis festlegen
$projectsRoot = "D:\DevDrive\Projects"
$projectPath = Join-Path $projectsRoot $projectName

# Erstelle das Verzeichnis für das Projekt
if (-not (Test-Path $projectPath)) {
    New-Item -ItemType Directory -Path $projectPath | Out-Null
    Write-Output "Projektverzeichnis erstellt: $projectPath"
} else {
    Write-Output "Fehler: Projektverzeichnis existiert bereits."
    exit
}

# Initialisiere ein Git-Repository
Set-Location $projectPath
git init
Write-Output "Git-Repository initialisiert."

# Framework-spezifische Befehle ausführen
switch ($frameworkChoice) {
    "1" {
        Write-Output "Initialisiere ein Node.js-Projekt..."
        npm init -y
        Write-Output "Node.js-Projekt erstellt."
    }
    "2" {
        Write-Output "Erstelle ein Angular-Projekt..."
        # Wechsel ins Projekteverzeichnis und erstelle Angular-Projekt
        Set-Location $projectsRoot
        ng new $projectName --skip-install
        Set-Location $projectPath

        # Installiere Abhängigkeiten
        Write-Output "Installiere Angular-Abhängigkeiten..."
        npm install
        Write-Output "Abhängigkeiten installiert."
    }
    "3" {
        Write-Output "Erstelle ein Python-Projekt..."
        python -m venv "$projectPath\venv"
        Write-Output "Python-Umgebung erstellt."
    }
    "4" {
        Write-Output "Leeres Projekt erstellt."
    }
    default {
        Write-Output "Ungültige Auswahl. Ein Standardprojekt wird erstellt."
    }
}

# Füge eine README-Datei hinzu
Set-Content -Path "$projectPath\README.md" -Value "# $projectName`n`nInitial Setup"
Write-Output "README.md erstellt."

# Fragen, ob das Projekt auf GitHub gepusht werden soll
$pushToGitHub = Read-Host "Möchtest du das Projekt auf GitHub erstellen? (y/n)"
if ($pushToGitHub -eq "y") {
    Write-Output "Füge ein Remote-Repository hinzu..."
    $gitHubUrl = Read-Host "Gib die GitHub-URL ein (z.B. https://github.com/username/repository.git)"
    git remote add origin $gitHubUrl
    git branch -M main
    git push -u origin main
    Write-Output "Projekt erfolgreich auf GitHub erstellt."
} else {
    Write-Output "Projekt wurde lokal eingerichtet."
}

Write-Output "Projekt erfolgreich eingerichtet: $projectPath"
