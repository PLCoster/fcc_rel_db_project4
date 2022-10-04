#!/bin/bash

# Periodic Element Information Program
# Call this program followed by either
# - peridodic number e.g. 1
# - element symbol e.g. 'H'
# - element name e.g. Hydrogen
#
# If given element is in the periodic_table database, information regarding the element will be returned
#

# PSQL variable for DB queries
PSQL="psql --username=freecodecamp --dbname=periodic_table --tuples-only -c"
PARTIAL_QUERY="SELECT atomic_number, symbol, name, atomic_mass, melting_point_celsius, boiling_point_celsius, type FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id)"

# Main function of script - attempts to return element information based on user input
MAIN () {
  # Check if command-line argument given:
  if [[ -z $1 ]]
  then
    echo -e "Please provide an element as an argument."
    exit
  fi

  # Get element info from DB based on user argument:
  if [[ $1 =~ ^[0-9]+$ ]] # Atomic Number Input
  then
    ELEMENT_DB_ROW=$($PSQL "$PARTIAL_QUERY WHERE atomic_number=$1;")
  elif [[ $1 =~ ^[a-zA-Z]{1,2}$ ]]
  then
    ELEMENT_DB_ROW=$($PSQL "$PARTIAL_QUERY WHERE symbol ILIKE '$1';")
  elif [[ $1 =~ ^[a-zA-Z]+$ ]]
  then
    ELEMENT_DB_ROW=$($PSQL "$PARTIAL_QUERY WHERE name ILIKE '$1';")
  fi

  # If no information was found, or input was invalid, notify user:
  if [[ -z $ELEMENT_DB_ROW ]]
  then
    echo "I could not find that element in the database."
    exit
  fi

  ELEMENT_DATA=$(echo $ELEMENT_DB_ROW | sed -r 's/\|/ /g')

  # # Method 1 - read in values into variables from string
  echo $ELEMENT_DATA | while read ATOMIC_NUMBER EL_SYMBOL EL_NAME EL_MASS EL_MP EL_BP EL_TYPE
  do
    echo "The element with atomic number $ATOMIC_NUMBER is $EL_NAME ($EL_SYMBOL). It's a $EL_TYPE, with a mass of $EL_MASS amu. $EL_NAME has a melting point of $EL_MP celsius and a boiling point of $EL_BP celsius."
  done

  # Method 2 - create array of values, use these to output string:
  # ELEMENT_ARR=($ELEMENT_DATA)
  # echo "The element with atomic number ${ELEMENT_ARR[0]} is ${ELEMENT_ARR[2]} (${ELEMENT_ARR[1]}). It's a ${ELEMENT_ARR[6]}, with a mass of ${ELEMENT_ARR[3]} amu. ${ELEMENT_ARR[2]} has a melting point of ${ELEMENT_ARR[4]} celsius and a boiling point of ${ELEMENT_ARR[5]} celsius."
}

MAIN $1
