#!/bin/bash
df -h
free -h
DISK_THRESHOLD=90 
SWAP_THRESHOLD=90 

echo "WARNING : utilisation disque critique (${DISK_USAGE}%)"
echo "WARNING : utilisation SWAP critique (${SWAP_USAGE}%)"

ps -eo pid,comm,%cpu --sort=-%cpu | head -n 4
ps -eo pid,comm,%mem --sort=-%mem | head -n 4

services=("sshd" "postgres" "apache2")

echo "--- Début de la vérification des services : $(date) ---"
for service in "${services[@]}"; do
    if systemctl is-active --quiet "$service"; then
        echo "OK : Le service [$service] fonctionne correctement."
    else
        echo "WARN : [$service] est inactif. Tentative de redémarrage..."
        systemctl start "$service"
        sleep 1
        if systemctl is-active --quiet "$service"; then
            echo "RECOVERY : [$service] a été redémarré avec succès."
        else
            echo "ERROR : Échec du redémarrage pour [$service]."
        fi
        fi
done
echo "--- Fin du rapport ---"
fi
