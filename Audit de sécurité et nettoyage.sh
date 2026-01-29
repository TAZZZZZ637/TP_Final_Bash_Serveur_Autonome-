#Mathis
JOURS=60
tmp_users="/tmp/users_JOURS.txt"
find /home -mindepth 1 -maxdepth 1 -type d -atime +$JOURS > "$tmp_users"
echo "Utilisateurs inactifs depuis plus de $JOURS jours :"
cat "$tmp_users"
echo
read -p "Voulez-vous continuer ? (oui/non) : " REPONSE
if [ "$choix" != "oui" ]; then
    echo "Action annulee"
    exit 0
fi
echo "Confirmation recue, action possible"
