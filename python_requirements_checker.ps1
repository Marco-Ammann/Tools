# Python-Requirements-Checker

# Prüfe, ob requirements.txt existiert
if (-not (Test-Path "requirements.txt")) {
    Write-Output "Fehler: requirements.txt nicht gefunden."
    exit
}

# Überprüfe Abhängigkeiten
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
