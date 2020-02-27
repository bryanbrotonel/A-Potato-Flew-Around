public class Character {

    private float characterWidth;
    private float characterHeight;
    private boolean north, south, west, east;

    private float movementSpeed = 2;
    private float boundary = 100;
    private float xPosition = 0;
    private float yPosition = 0;

    Character(float width, float height) {
        characterWidth = width;
        characterHeight = height;
    }

    final void drawCharacter() {

        pushMatrix();
        moveCharacter();

        translate(xPosition, yPosition);

        noStroke();

        fill(255, 0, 0);
        rect(-(characterWidth / 2), -(characterHeight / 2), characterWidth, characterHeight);
        fill(0, 0, 255);
        rect(-(characterHeight / 2), -(characterWidth / 2), characterHeight, characterWidth);

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
        return characterWidth;
    }

    final float getCharacterHeight() {
        return characterHeight;
    }

}