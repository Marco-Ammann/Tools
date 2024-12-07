# Quell- und Zielverzeichnis festlegen
$source = "D:\DevDrive\Projects"
$backupRoot = "D:\DevDrive\Backups"
$logRoot = "D:\DevDrive\Logs"

# Aktuelles Datum und Uhrzeit
$date = Get-Date -Format "yyyy-MM-dd"
$time = Get-Date -Format "HH-mm-ss"

# Zielverzeichnisse für Backup und Logs
$dayBackupFolder = Join-Path $backupRoot $date
$dayLogFolder = Join-Path $logRoot $date
$destination = Join-Path $dayBackupFolder $time

# Logdatei-Pfad im Tages-Logverzeichnis
$logFile = Join-Path $dayLogFolder "backup-$time.log"

# Erstelle das Tages-Backupverzeichnis, falls es nicht existiert
if (-not (Test-Path $dayBackupFolder)) {
    New-Item -ItemType Directory -Path $dayBackupFolder | Out-Null
}

# Erstelle das Tages-Logverzeichnis, falls es nicht existiert
if (-not (Test-Path $dayLogFolder)) {
    New-Item -ItemType Directory -Path $dayLogFolder | Out-Null
}

# Erstelle das Zeit-Backupverzeichnis, falls es nicht existiert
if (-not (Test-Path $destination)) {
    New-Item -ItemType Directory -Path $destination | Out-Null
}

# Robocopy-Optionen als Array
$robocopyOptions = @(
    "/E",                    # Kopiert Unterverzeichnisse, inklusive leerer
    "/XD", "node_modules", ".git",  # Ausschließen der angegebenen Verzeichnisse
    "/COPY:DAT",             # Kopiert Daten, Attribute und Zeitstempel
    "/DCOPY:DA",             # Kopiert Verzeichnisattribute
    "/R:3",                  # Anzahl der Wiederholungsversuche bei Fehlern (hier auf 3 reduziert)
    "/W:5",                  # Wartezeit zwischen Wiederholungsversuchen (in Sekunden)
    "/LOG:$logFile"          # Pfad zur Logdatei
)

# Führe Robocopy aus
robocopy $source $destination @robocopyOptions

# Überprüfe den Exit-Code von Robocopy
switch ($LASTEXITCODE) {
    { $_ -le 1 } { 
        Write-Output "Backup erfolgreich erstellt nach $destination"
    }
    default { 
        Write-Output "Backup abgeschlossen mit Fehlern. Exit-Code: $LASTEXITCODE"
    }
}
