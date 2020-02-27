boolean overPlayAgainButton = false;

int playAgainWidth = 500;
int playAgainHeight = 250;

int halfPlayAgainWidth = playAgainWidth / 2;
int halfPlayAgainHeight = playAgainHeight / 2;

    int buttonWidth = 75;
    int buttonHeight = 25;

    int halfBttonWidth = buttonWidth / 2;
    int halfButtonHeight = buttonHeight / 2;


void playAgain() {

    // println("gameLose: "+gameLose);

    int playAgainXPos = !gameLose ? width : width / 2 - halfPlayAgainWidth;
    int playAgainYPos = !gameLose ? height : height / 2 - halfPlayAgainHeight;

    fill(255);
    noStroke();

    pushMatrix();
    translate(playAgainXPos, playAgainYPos);
    
    rect(0, 0, playAgainWidth, playAgainHeight);

    fill(0);
    textSize(25);
    String loseMessage = "Game Over.\n Score: " + gameScore;

    textAlign(CENTER, CENTER);
    text(loseMessage, halfPlayAgainWidth, halfPlayAgainHeight - 25);

    playAgainButton(halfPlayAgainWidth, halfPlayAgainHeight);

    popMatrix();

    fill(255,0,0);

}

void playAgainButton(int xPosition, int yPosition) {

    String playAgain = "Play Again";
    int padding = 25;

    pushMatrix();   

    translate(xPosition - halfBttonWidth, yPosition + padding);

    fill(2435);
    stroke(0);
    rect(0, 0, buttonWidth, buttonHeight);

    fill(0);
    textSize(12);
    textAlign(CENTER, CENTER);
    text(playAgain, 0, 0, buttonWidth, buttonHeight);

    popMatrix();

    int globalButtonXPos = (width / 2) - halfBttonWidth;
    int globalButtonYPos = (height / 2) + padding;

    overPlayAgainButton = overRect(globalButtonXPos, globalButtonYPos, buttonWidth, buttonHeight);

}

void restartGame() {
    println("restart game");

    potatos.clear();

    clouds.clear();

    xStartPosition = width / 2;
    yStartPosition = height * 0.7;

    character.setXPosition(0);
    character.setYPosition(0);

    gameLose = false;
}

void mousePressed() {
    if (overPlayAgainButton) {
        restartGame();
    }
}