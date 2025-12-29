#!/bin/bash

#Set environment variable
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

#Get input from script execution
if [ "$#" -lt 1 ]; then

#If there is no input given, show the message and stop execution
  echo "Please provide an element as an argument."
  exit 0
  
fi
#Query the input exist
if [[ "$1" =~ ^[0-9]+$ ]]; then
  LOOKUP_ELEMENT=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number = $1;")
else
  LOOKUP_ELEMENT=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1' OR name = '$1';")
fi

#If there is no result returned, the show message and stop execution
if [[ -z $LOOKUP_ELEMENT ]]; then
  echo "I could not find that element in the database."
  exit 0

#If there is record, show its information and stop execution
else
  IFS="|" read ATOMIC_NUMBER <<< "$LOOKUP_ELEMENT"
  LOOKUP_ALL=$($PSQL "
    SELECT e.name, e.symbol, p.atomic_mass, p.melting_point_celsius, p.boiling_point_celsius, t.type
    FROM elements e
    JOIN properties p ON p.atomic_number = e.atomic_number
    JOIN types t ON t.type_id = p.type_id WHERE e.atomic_number = $ATOMIC_NUMBER;" | xargs)
  IFS="|" read NAME SYMBOL ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE <<< "$LOOKUP_ALL"
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
fi