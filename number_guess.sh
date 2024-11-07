#!/bin/bash
PSQL="psql -X --username=freecodecamp --dbname=guess_number --tuples-only -c"

NUMBER_TO_GUESS=$(( RANDOM % 1000 ))
echo "The number to guess is $NUMBER_TO_GUESS"

if [[ ! $1 ]]
 then
  echo "Enter your username:"
fi

read USERNAME

SEARCH_USER=$($PSQL "SELECT username FROM users WHERE username = '$USERNAME'")

# if USER doesn't exist
if [[ -z $SEARCH_USER ]]
then  
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  # insert new user
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')") 
else
  echo "Welcome back, $USERNAME! You have played <games_played> games, and your best game took <best_game> guesses."
fi

USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'") 

GUESS_ATTEMPTS=0

while [[ $NUMBER_ATTEMPT != $NUMBER_TO_GUESS ]]
do
  echo "Guess the secret number between 1 and 1000:"
  read NUMBER_ATTEMPT

  ((GUESS_ATTEMPTS+=1))

  # if input is not a number
  if [[ ! $NUMBER_ATTEMPT =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  elif (( NUMBER_ATTEMPT < NUMBER_TO_GUESS ))
  then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"      
  fi
done


INSERT_GAME_RESULT=$($PSQL "INSERT INTO games (user_id, attempts) VALUES ($USER_ID, $GUESS_ATTEMPTS)") 
#INSERT_USER_GAME_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')") 

echo "You guessed it in $GUESS_ATTEMPTS tries. The secret number was $NUMBER_TO_GUESS. Nice job!"