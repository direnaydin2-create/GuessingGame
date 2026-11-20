#!/bin/bash
# guessinggame.sh
# Jeu : devinez combien de fichiers se trouvent dans le répertoire actuel.

# Retourne le nombre de fichiers (hors dossiers et fichiers cachés)
function count_files {
    ls -p | grep -v '/' | wc -l
}

nb_files=$(count_files)
guess=-1

echo "=== Jeu de devinettes ==="
echo "Combien de fichiers y a-t-il dans le répertoire actuel ?"

while [[ $guess -ne $nb_files ]]
do
    read -p "Votre estimation : " input

    # Vérifie que l'entrée est bien un nombre entier positif
    if ! [[ $input =~ ^[0-9]+$ ]]
    then
        echo "Veuillez entrer un nombre entier positif."
        continue
    fi

    guess=$((10#$input))

    if [[ $guess -lt $nb_files ]]
    then
        echo "Trop bas ! Essayez encore."
    elif [[ $guess -gt $nb_files ]]
    then
        echo "Trop haut ! Essayez encore."
    else
        echo "Félicitations ! Il y a bien $nb_files fichiers ici."
    fi
done
