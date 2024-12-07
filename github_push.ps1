# GitHub-Push-Skript

# Prüfe, ob das aktuelle Verzeichnis ein Git-Repository ist
if (-not (Test-Path ".git")) {
    Write-Output "Fehler: Dieses Verzeichnis ist kein Git-Repository."
    exit
}

# Führe Git-Befehle aus
Write-Output "Füge alle Änderungen hinzu..."
git add .

Write-Output "Commit der Änderungen..."
$commitMessage = Read-Host "Gib eine Commit-Nachricht ein (Standard: 'Automatischer Commit')"
if (-not $commitMessage) {
    $commitMessage = "Automatischer Commit"
}
git commit -m $commitMessage

Write-Output "Pushe Änderungen nach GitHub..."
git push

Write-Output "Push erfolgreich abgeschlossen!"
