#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=guess_number --tuples-only -c"

# Generate a random number between 1 and 1000
SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))

# Prompt user for username
echo "Enter your username:"
read USERNAME

# Check if username exists in the database
USER_DATA=$($PSQL "SELECT users.user_id, COUNT(game_id) AS games_played, MIN(attempts) AS best_game FROM users LEFT JOIN games ON users.user_id = games.user_id WHERE username = '$USERNAME' GROUP BY users.user_id")

# If the user doesn't exist, insert new user
if [[ -z $USER_DATA ]]; then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  $PSQL "INSERT INTO users(username) VALUES('$USERNAME')" > /dev/null
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'" | xargs)
else
  # Extract user details if they exist
  USER_ID=$(echo "$USER_DATA" | cut -d '|' -f1 | xargs)
  GAMES_PLAYED=$(echo "$USER_DATA" | cut -d '|' -f2 | xargs)
  BEST_GAME=$(echo "$USER_DATA" | cut -d '|' -f3 | xargs)
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Start the guessing game
echo "Guess the secret number between 1 and 1000:"
GUESS_ATTEMPTS=0

while true; do
  read GUESS

  # Check if the input is an integer
  if [[ ! $GUESS =~ ^[0-9]+$ ]]; then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Increment the guess attempts
  ((GUESS_ATTEMPTS++))

  # Check if the guess is correct
  if (( GUESS == SECRET_NUMBER )); then
    echo "You guessed it in $GUESS_ATTEMPTS tries. The secret number was $SECRET_NUMBER. Nice job!"
    
    # Insert the game result into the games table without showing INSERT message
    $PSQL "INSERT INTO games(user_id, attempts) VALUES($USER_ID, $GUESS_ATTEMPTS)" > /dev/null
    break
  elif (( GUESS < SECRET_NUMBER )); then
    echo "It's higher than that, guess again:"
  else
    echo "It's lower than that, guess again:"
  fi
done