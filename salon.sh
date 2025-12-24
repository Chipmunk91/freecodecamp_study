#!/bin/bash

echo -e "~~~~~ MY SALON ~~~~~\n"
PSQL="psql -X --username=freecodecamp --dbname=salon -t -A -c"


menu() {
  # Show salon menu list
  local message="$1"
  if [[ -n $message ]];then
    echo -e "\n$message\n"
  fi
  
  MENU_LIST=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
  echo "$MENU_LIST" | while IFS="|" read service_id name; do
    echo "$service_id) $name"
  done

  # prompt for user input
  
  
  # If user input is invalid(non in the service id)
  while true; do
    read SERVICE_ID_SELECTED
    if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]; then
    echo -e "\nI could not find that service. What would you like today?\n"
    echo "$MENU_LIST" | while IFS="|" read service_id name; do
      echo "$service_id) $name"
    done
    continue
    fi

    SERVICE_CHECK=$($PSQL "SELECT service_id,name FROM services WHERE service_id=$SERVICE_ID_SELECTED")
    if [[ -n $SERVICE_CHECK ]]; then break; fi
    # call menu option again with invalid message as parameter
    echo -e "\nI could not find that service. What would you like today?\n"
    echo "$MENU_LIST" | while IFS="|" read service_id name; do
      echo "$service_id) $name"
    done
    continue
  done

  # If user input is valid, then set service id and name, call customer function as next stage
  IFS='|' read SERVICE_ID_SELECTED SERVICE_NAME <<< "$SERVICE_CHECK"
  SERVICE_NAME=$(echo "$SERVICE_NAME" | xargs)   # trims whitespace
  echo -e "\nWhat's your phone number?"

  read CUSTOMER_PHONE
  PHONE_CHECK=$($PSQL "SELECT customer_id, name FROM customers WHERE phone='$CUSTOMER_PHONE'")
  
  #If phone number is not availble
  if [[ -z $PHONE_CHECK ]]; then
  
    #Ask for new customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    #Add new customer record into customers
    CUSTOMER_ID=$($PSQL "INSERT INTO customers(name,phone) VALUES('$CUSTOMER_NAME','$CUSTOMER_PHONE') RETURNING customer_id;" | head -n1 | xargs)
  else
    #Else, Set customer id and customer name with existing record
    IFS='|' read CUSTOMER_ID CUSTOMER_NAME <<< "$PHONE_CHECK"
    CUSTOMER_NAME=$(echo "$CUSTOMER_NAME" | xargs)
  fi

  echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
  read SERVICE_TIME
  APPOINTMENT_MADE=$($PSQL "INSERT INTO appointments(customer_id,service_id,time) VALUES($CUSTOMER_ID,$SERVICE_ID_SELECTED,'$SERVICE_TIME')")

  echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
}

menu "Welcome to My Salon, how can I help you?"
