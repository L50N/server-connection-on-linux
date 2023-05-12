# Skript-Name

Dieses Skript stellt eine Verbindung zu einem Wireguard-Netzwerk her und ermöglicht eine SFTP-Verbindung zu einem entfernten Server.

## Voraussetzungen

- Wireguard muss auf dem System installiert sein.
- Die SSH-Schlüssel müssen konfiguriert sein, um eine Verbindung zum Zielserver herzustellen.

## Verwendung

1. Öffnen Sie das Skript (`script.sh`) in einem Texteditor.
2. Passen Sie die folgenden Werte an:

   - `SERVER_USER`: Geben Sie den Benutzernamen des Servers ein.
   - `SERVER_IP`: Geben Sie die IP-Adresse des Servers ein.
   - `WIREGUARD_CONFIG_NAME`: Geben Sie den Namen der Wireguard-Konfiguration ein.

3. Speichern Sie das Skript nach der Anpassung.

4. Führen Sie das Skript aus, indem Sie den Befehl `./script.sh` in einem Terminal ausführen.

Das Skript stellt automatisch eine Verbindung zum Wireguard-Netzwerk her, verwendet die angegebenen Werte für den Server und die Wireguard-Konfiguration und richtet eine SFTP-Verbindung zum entfernten Server ein.

## Bereinigung

Das Skript enthält eine Bereinigungsfunktion, die automatisch aufgerufen wird, wenn das Skript beendet wird. Die Bereinigungsfunktion trennt die SFTP-Verbindung und entfernt das gemountete Verzeichnis.

## Hinweise

- Stellen Sie sicher, dass die Wireguard-Konfiguration richtig eingerichtet ist, um eine erfolgreiche Verbindung zum Netzwerk herzustellen.
- Überprüfen Sie, ob die angegebene Server-IP-Adresse und der Benutzername korrekt sind.
