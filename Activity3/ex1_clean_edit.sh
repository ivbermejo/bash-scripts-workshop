#!/bin/bash

# Nombre del archivo original
original_file="Act3_parole.txt"
cleaned_file="cleaned_Act3_parole.txt"

# Verificar que el archivo existe
if [ ! -f "$original_file" ]; then
    echo "Error: el archivo '$original_file' no existe."
    exit 1
fi

# Vaciar o crear archivo limpio
> "$cleaned_file"

# Leer el archivo y procesar línea por línea usando for
IFS=$'\n' read -d '' -r -a lines < "$original_file"
for line in "${lines[@]}"; do
    if [[ ! "$line" =~ ^[[:space:]]*# ]]; then
        echo "$line" >> "$cleaned_file"
    fi
done

echo "Archivo limpio generado como '$cleaned_file'"

# Preguntar al usuario por una palabra o frase a buscar
read -p "Ingresa una palabra o frase a buscar: " phrase
found=false

# Buscar la frase en el archivo limpio usando for
IFS=$'\n' read -d '' -r -a clean_lines < "$cleaned_file"
for line in "${clean_lines[@]}"; do
    if [[ "$line" == *"$phrase"* ]]; then
        found=true
        break
    fi
done

if $found; then
    echo "La frase '$phrase' fue encontrada en el archivo."
else
    echo "La frase '$phrase' no fue encontrada en el archivo."
fi

# Solicitar al usuario que agregue una frase al final (obligatorio)
while true; do
    read -p "Escribe una frase para añadir al final del archivo: " sentence
    if [ -n "$sentence" ]; then
        echo "$sentence" >> "$cleaned_file"
        echo "Frase añadida al archivo."
        break
    else
        echo "La frase no puede estar vacía."
    fi
done
