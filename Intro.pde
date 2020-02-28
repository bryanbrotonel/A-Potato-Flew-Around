boolean overplayButton = false;

int playWidth = 500;
int playHeight = 250;

int halfplayWidth = playWidth / 2;
int halfplayHeight = playHeight / 2;

void intro() {

    int playXPos = !intro ? width : width / 2 - halfplayWidth;
    int playYPos = !intro ? height : height / 2 - halfplayHeight;

    fill(255);
    noStroke();

    pushMatrix();
    translate(playXPos, playYPos);
    
    rect(0, 0, playWidth, playHeight);

    fill(0);
    textSize(25);
    String welcomeMessage = "A Potato Flew Around";

    textAlign(CENTER, CENTER);
    text(welcomeMessage, halfplayWidth, halfplayHeight - 25);

    playButton(halfplayWidth, halfplayHeight);

    popMatrix();

    fill(255,0,0);

}

void playButton(int xPosition, int yPosition) {

    int buttonWidth = 75;
    int buttonHeight = 25;

    int halfBttonWidth = buttonWidth / 2;
    int halfButtonHeight = buttonHeight / 2;

    String play = "Play!";
    int padding = 25;

    pushMatrix();   

    translate(xPosition - halfBttonWidth, yPosition + padding);

    fill(2435);
    stroke(0);
    rect(0, 0, buttonWidth, buttonHeight);

    fill(0);
    textSize(12);
    textAlign(CENTER, CENTER);
    text(play, 0, 0, buttonWidth, buttonHeight);

    popMatrix();

    int globalButtonXPos = (width / 2) - halfBttonWidth;
    int globalButtonYPos = (height / 2) + padding;

    overplayButton = overRect(globalButtonXPos, globalButtonYPos, buttonWidth, buttonHeight);

}