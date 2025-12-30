#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guessing -t --no-align -c"

#Generate random number between 1~1000
min=1; max=1000
ANSWER=$(( min + RANDOM % (max - min + 1) ))
echo $ANSWER
#Ask username
echo "Enter your username:"
read USERNAME

#Query username. fetch games_played and best_game
USER_SCORE=$($PSQL "SELECT games_played, best_game FROM scoreboard WHERE name = '$USERNAME';")

#If there is username available, then show welcome name with that username. Set USER_AVAILABLE=TRUE.
if [[ -n $USER_SCORE ]]; then
  USER_AVAILABLE=true
  IFS="|" read GAMES_PLAYED BEST_GAME <<< $USER_SCORE
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."

#else, show first time welcome message. Set USER_AVAILABLE=FALSE
else
  USER_AVAILABLE=false
  echo "Welcome, $USERNAME! It looks like this is your first time here."
fi
#Ask user input to guess the number.
TRY=1
echo "Guess the secret number between 1 and 1000:"

#If user input is not correct, show the direction. Add try num +1
while true; do
  read GUESS
  #If input is not integer start from the scratch
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi
  #less
  if [[ $ANSWER -lt $GUESS ]];then
    echo "It's lower than that, guess again:"
    TRY=$((TRY + 1))
    continue
  fi
  #Greater
  if [[ $ANSWER -gt $GUESS ]];then
    echo "It's higher than that, guess again:"
    TRY=$((TRY + 1))
    continue
  fi
  #else, number is guessed, break the loop.
  break
done
#If USER_AVAILABLE=TRUE, then add 1 to games_played and replace best_game if try num is less than best_game
if $USER_AVAILABLE; then
  GAMES_PLAYED=$((GAMES_PLAYED +1))
  if [[ $TRY -lt $BEST_GAME ]]; then
    BEST_GAME=$TRY
  fi
  $PSQL "UPDATE scoreboard SET games_played = $GAMES_PLAYED, best_game = $BEST_GAME WHERE name = '$USERNAME';" > /dev/null

#else, add the new user record with games_played =1 and best_game = try
else
  $PSQL "INSERT INTO scoreboard(name, games_played, best_game) VALUES('$USERNAME', 1, $TRY);" > /dev/null
fi

echo "You guessed it in $TRY tries. The secret number was $ANSWER. Nice job!"