#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

FILE="games.csv"

#First truncate games, tables to fully re-load games.csv during the test
# if [[ $1 == "test" ]]
# then
#   echo "Truncate table during test"
$PSQL "TRUNCATE TABLE games, teams RESTART IDENTITY CASCADE;"
# fi

#Read csv file with while
tail -n +2 "$FILE" | while IFS=',' read -r year round winner opponent winner_goals opponent_goals
do
  #Check winner already added
  WINNER_EXISTS=$($PSQL "SELECT * FROM teams WHERE name = '$winner'")
  if [[ -z $WINNER_EXISTS ]]
  then
    #Only add it if it's not in teams
    if $PSQL "INSERT INTO teams(name) VALUES('$winner')" >/dev/null; then
      echo "Added new team: $winner"
    else
      echo "Failed to add team: $winner"
    fi
  fi

  #Check opponent alrady added
  OPPONENT_EXISTS=$($PSQL "SELECT * FROM teams WHERE name = '$opponent'")
  if [[ -z $OPPONENT_EXISTS ]]
  then
    #Only add it if it's not in teams
    if $PSQL "INSERT INTO teams(name) VALUES('$opponent')" >/dev/null; then
      echo "Added new team: $opponent"
    else
      echo "Failed to add team: $opponent"
    fi
  fi

  #Add each games. The entire line will be added

  #Check winner id and opponent id
  WINNER_ID=$($PSQL "SELECT team_id FROM teams where name = '$winner'")
  OPPONENT_ID=$($PSQL "SELECT team_id FROM teams where name = '$opponent'")
  
  if $PSQL "INSERT INTO games(year, round, winner_id, opponent_id, winner_goals, opponent_goals) VALUES($year, '$round', $WINNER_ID, $OPPONENT_ID, $winner_goals, $opponent_goals)" >/dev/null; then
    echo "Added game: $year $round - $winner vs $opponent ($winner_goals-$opponent_goals)"
  else
    echo "Failed to add game: $year $round - $winner vs $opponent"
  fi
done