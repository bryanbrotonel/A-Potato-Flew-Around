public class Character {

    private float charWidth;
    private float charHeight;
    private float halfCharWidth;
    private float halfCharHeight;

    private boolean north, south, west, east;

    private float movementSpeed = 2;
    private float boundary = 100;
    private float xPosition = 0;
    private float yPosition = 0;

    Character(float width, float height) {
        charWidth = width;
        charHeight = height;
        halfCharWidth = width / 2;
        halfCharHeight = height / 2;
    }

    final void drawCharacter() {

        pushMatrix();
        moveCharacter();

        translate(xPosition, yPosition);

        float bodyHeight = charHeight * 0.75 / 2;
        float bodyWidth = charWidth * 0.60;
        float legLength = charHeight * 0.60 / 2;
        float legWidth = bodyWidth / 4;
        float armLength = charHeight / 2;
        float armWidth = charWidth * 0.15;
        float headDiameter = charHeight * 0.25;

        noStroke();

        // Draw body
        fill(236, 113, 44);
        rect(-bodyWidth / 2, -(bodyHeight) / 2, bodyWidth, bodyHeight);

        fill(133, 84, 57);

        // Draw arms

        // Right Arm
        rect(-(bodyWidth / 2) - armWidth, 0, armWidth, -armLength);

        // Left Arm
        rect((bodyWidth / 2), 0, armWidth, -armLength);

        // Draw head
        ellipse(0, -((bodyHeight / 2) + headDiameter / 2), headDiameter, headDiameter);

        fill(0, 0, 44);
        rect(bodyWidth / 4, bodyHeight / 2, legWidth, legLength);
        rect(-bodyWidth / 2, bodyHeight / 2, legWidth, legLength);

        fill(255, 0, 0);
        ellipse(0, 0, 5, 5);

        popMatrix();
    }

    final void setDirection(int key, boolean direction) {
        if (key == UP | key == 'W') north = direction;
        else if (key == DOWN | key == 'S') south = direction;
        else if (key == LEFT | key == 'A') west = direction;
        else if (key == RIGHT | key == 'D') east = direction;
    }

    final void moveCharacter() {
        if (!gameLose) {
            xPosition += (east ? movementSpeed : 0) - (west ? movementSpeed : 0);

            yPosition += (south ? movementSpeed : 0) - (north ? movementSpeed : 0);

            xPosition = constrain(xPosition, -boundary * 2.5, boundary * 2.5);
            yPosition = constrain(yPosition, -boundary, boundary);
        }
    }

    final float getXPosition() {
        return xPosition;
    }

    final float getYPosition() {
        return yPosition;
    }

    final void setXPosition(float position) {
        xPosition = position;
    }

    final void setYPosition(float position) {
        yPosition = position;
    }

    final float getCharacterWidth() {
        return charWidth;
    }

    final float getCharacterHeight() {
        return charHeight;
    }

}