public class Character {

    private float characterWidth;
    private float characterHeight;
    private float xPosition = 0;
    private float yPosition = 0;

    Character(float width, float height) {
        characterWidth = width;
        characterHeight = height;
    }

    final void drawCharacter() {

        pushMatrix();
        
        translate(xPosition, yPosition);

        noStroke();

        fill(255, 0, 0);
        rect(-(characterWidth / 2), -(characterHeight / 2), characterWidth, characterHeight);
        fill(0, 0, 255);
        rect(-(characterHeight / 2), -(characterWidth / 2), characterHeight, characterWidth);

        popMatrix();
    }

    final void characterMovement(int keyCode) {
        float movement = 10;
        float xBoundary = (height / 2) - 280;
        float yBoundary = (width / 2) - 200;

        switch (keyCode) {
            case UP:
                println("up");
                if (yPosition > -xBoundary)
                    yPosition -= movement;
                break;
            case DOWN:
                println("down");
                if (yPosition < xBoundary)
                    yPosition += movement;            
                break;
            case LEFT:
                println("left");
                if (xPosition > -yBoundary)
                    xPosition -= movement;            
                break;
            case RIGHT:
                println("right");
                if (xPosition < yBoundary)
                    xPosition += movement;            
                break;
            default:
                break;
        }
    
    }
    
    final float getXPosition() {
        return xPosition;
    }

    final float getYPosition() {
        return yPosition;
    }

    final float getCharacterWidth() {
        return characterWidth;
    }

    final float getCharacterHeight() {
        return characterHeight;
    }
    
}
