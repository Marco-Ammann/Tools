import os
import shutil

def ordner_aufräumen(download_path):
    # Dateitypen und Zielordner definieren
    ordner_kategorien = {
        "Bilder": [".jpg", ".jpeg", ".png", ".gif", ".bmp", ".svg", ".tiff", ".webp"],
        "Dokumente": [".pdf", ".doc", ".docx", ".xls", ".xlsx", ".ppt", ".pptx", ".txt", ".odt"],
        "Videos": [".mp4", ".mkv", ".avi", ".mov", ".wmv", ".flv", ".webm"],
        "Musik": [".mp3", ".wav", ".aac", ".flac", ".ogg", ".wma"],
        "Archive": [".zip", ".rar", ".7z", ".tar", ".gz", ".bz2"],
        "Programme": [".exe", ".msi", ".dmg", ".pkg", ".deb"],
        "Sonstiges": []
    }

    # Dateien im Download-Ordner durchgehen
    for datei in os.listdir(download_path):
        dateipfad = os.path.join(download_path, datei)

        # Nur Dateien berücksichtigen
        if os.path.isfile(dateipfad):
            # Dateityp bestimmen
            _, dateiendung = os.path.splitext(datei)
            dateiendung = dateiendung.lower()

            # Zielordner finden
            zielordner = "Sonstiges"
            for ordner, endungen in ordner_kategorien.items():
                if dateiendung in endungen:
                    zielordner = ordner
                    break

            # Zielordner-Pfad erstellen
            zielpfad = os.path.join(download_path, zielordner)
            if not os.path.exists(zielpfad):
                os.makedirs(zielpfad)

            # Datei verschieben
            shutil.move(dateipfad, os.path.join(zielpfad, datei))
            print(f"Verschoben: {datei} -> {zielordner}")

if __name__ == "__main__":
    # Download-Ordner-Pfad hier anpassen
    downloads_ordner = os.path.expanduser("~/Downloads")
    ordner_aufräumen(downloads_ordner)
