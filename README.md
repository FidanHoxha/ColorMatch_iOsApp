# Color Match Game

This repository is an iOS application written in Swift.
Xcode 13.2 was used as the integrated development environment, which supports Swift 4 and iOS 9 through 15.2 as deployment targets.
The goal of this application is to be fun but challenging, while also training the thinking process of the players.

## How to play

The player is presented two cards, each containing a word. 
The word can be one of four colors: red, blue, yellow and black.
The first card always has a black font color, while the second card can have any font color.
The player must compare the meaning (text) of the first card with the font color of the second card and decide if they match or not.
The player gets to choose the game duration and should try to get as many correct answer as possible before the game ends.

## Challenge your brain

The game seems simple at first, but as you try to answer more and more quickly, its starts to get a bit tricky.
The second card's text and font color are chosen at random and often they don't match, which complicates things further.
The game trains the players "Response Inhibition" ability, which is the ability to suppress inappropriate responses that interefere with their actions.
This is because they must compare the font color of the second card, without paying attention to its meaning.

## Game views

The app consists of four views through which the user can navigate with buttons.
They are (in order of appearence): Entry View, Game View, End (Game Over) View, Score List (Leaderboard) View.

### Entry view

Entry View is the launch view which is displayed when the app is opened.
It contains the title of the game, a text field for the player name, three buttons to select the game duration (30, 60 or 90 seconds) and two buttons to navigate to other views.
When the first button ("Play") is pressed, the Game View is displayed and user data (player name and selected game duration) is passed.
When the second button ("Score List") is pressed, the Score List View is displayed.
If the users try to play the game without entering player name or selecting game duration an alert pops up to notify them.

### Game view

Game View is the main view which containes a game-info container, two cards with a color and two (No, Yes) buttons.
The user compares the meaning of the first card with the font color of the second card and answers by tapping the "Yes" or "No" button.
If the answer is correct, the correct answers counter displayed within game-info container will increase.
The game info container also displays the time, score and multiplier.
The time starts at 30, 60 or 90 (based on game duration selected) and goes down every second.
The score is increased (by 50 * multiplier) with every correct answer.
The multiplier starts at x1 and can go up to x10.
Every correct answer, fills one of the displayed multiplier dots, and when 4 of them are filled, the multiplier increases.
When an incorrect answer is given, the dots are cleared and multiplier is decreased.
When the timer reaches zero, End (Game Over) View is displayed and all the game data is passed.

### End view

The End View is displayed when the game ends and presents the final results including total score.
The total score is the sum of the score and multiplier bonus (250 bonus points for every multiplier level).
This view also has two buttons.
The first button ("Play Again") opens the Entry View and prefills the player name text field so the user won't have to enter the name every time he plays.
The second button ("Score List") opens the Score List View.

### Score List view

Score List View contains a table view with custom row design.
Here the users can add their scores which will be saved in a database and will remain unchanged even if the app is closed.
The view has a navigation bar with two buttons.
The left button ("Done") takes the user back to Entry View.
The right button ("+") opens an alert with a text field so the user can enter their score and name.
Each table entry also displays the time when the score was added.
The user can also edit and delete their scores by clicking on them and selecting "Edit" or "Delete" options in the pop-up.




