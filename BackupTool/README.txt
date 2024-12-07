
# Backup Tool 🚀

Dieses Tool hilft dir, Projekte effizient zu sichern und weitere unterstützende Aufgaben auszuführen.

---

## Verzeichnisstruktur 📂

Nach dem Start des Tools wird folgende Struktur erstellt:
```
BackupTool/
├── build/           # Temporäre Dateien für die Erstellung der .exe
├── dist/            # Enthält die ausführbare Datei
│   └── backup_tool.exe
├── backup/          # Standardordner für Backups
│   ├── <Datum>/     # Tagesordner (z. B. 2024-12-07)
│   │   ├── <Zeit>/  # Zeitordner (z. B. 03-40-36)
│   │   │   ├── logs/    # Logdateien des Backups
│   │   │   └── ...      # Dateien und Ordner aus dem Quellverzeichnis
├── backup_config.json  # Konfigurationsdatei mit den gespeicherten Pfaden
└── README.txt       # Diese Datei
```

---

## Nutzung 🛠️

### 1. Backup Tool starten
1. Öffne die Datei `dist/backup_tool.exe`.
2. Wähle einen Quellordner, der gesichert werden soll.
3. Lege optional einen Backup-Ordner fest (Standard: `backup/` im Tool-Ordner).
4. Starte das Backup.

Nach Abschluss des Backups kannst du den erstellten Ordner direkt öffnen.

### 2. Backup- und Log-Ordner
- **Backup-Ordner:** Wird in `backup/<Datum>/<Zeit>/` gespeichert.
- **Logs:** Liegen im Unterordner `logs/` des jeweiligen Zeitordners.

---

## Hinweise ⚠️

- **Speicherort:** Die .exe sollte in einem Ordner liegen, in dem Schreibrechte vorhanden sind.
- **Konfiguration:** Die Pfade können im Tool angepasst werden. Sie werden in der Datei `backup_config.json` gespeichert.
- **Erste Nutzung:** Beim ersten Start erstellt das Tool automatisch alle erforderlichen Ordner und Dateien.

---

Viel Spaß beim Nutzen des Backup Tools! 😊
