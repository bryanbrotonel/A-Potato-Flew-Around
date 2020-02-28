class CloudToggle {
    
    int toggleXPos;
    int toggleYPos;
    int toggleWidth;
    int toggleHeight;
    int toggleRoundness;


    CloudToggle(int xPos, int yPos, int width, int height, int roundness) {
        toggleXPos = xPos;
        toggleYPos = yPos;
        toggleWidth = width;
        toggleHeight = height;
        toggleRoundness = roundness;
    }

    void display() {

        fill(0);
        textSize(15);
        text("Toggle Clouds", 10, 10, 200, 50);

        fill(230);
        stroke(0);
        rect(toggleXPos, toggleYPos, toggleWidth, toggleHeight, toggleRoundness);

        if (drawClouds) {
            fill(0, 255, 0);
            stroke(0);
            rect(toggleXPos + (toggleWidth / 2), toggleYPos, toggleWidth / 2, toggleHeight, toggleRoundness);
        } else {
            fill(255, 0, 0);
            stroke(0);
            rect(toggleXPos, toggleYPos, toggleWidth / 2, toggleHeight, toggleRoundness);
        }

        int globalToggleXPos = width - 225 + toggleXPos;
        int globalToggleYPos = 100 - toggleYPos;

        overCloudsToggle = overRect(globalToggleXPos, globalToggleYPos, toggleWidth, toggleHeight);

    }
}