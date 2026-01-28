#!/bin/bash

CIBLE="/usr/local/bin"
DESTINATION="/tmp/sauvegarde_bin.tar.gz"

echo "--- Vérification du répertoire cible ---"

if [ -z "$CIBLE" ]; then
    echo "ERROR: La cible de sauvegarde n'est pas définie."
    exit 102
fi
if [ ! -e "$CIBLE" ]; then
    echo "ERROR: Le chemin $CIBLE n'existe pas."
    exit 102
fi
if [ ! -d "$CIBLE" ]; then
    echo "ERROR: $CIBLE n'est pas un répertoire."
    exit 102
fi
echo "Validation réussie. Tentative de sauvegarde de $CIBLE..."
tar -czf "$DESTINATION" "$CIBLE" 2>/dev/null

if [ $? -eq 0 ]; then
    echo "SUCCESS: Sauvegarde terminée avec succès vers $DESTINATION."
else
    echo "ERROR: Problème lors de la création de l'archive."
    exit 103
fi
