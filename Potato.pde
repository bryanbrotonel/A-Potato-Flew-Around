public class Potato {
    private boolean potatoFlew = false;

    private float xPosition;
    private float yPosition;
    private float potatoWidth;
    private float potatoHeight;
    private float potatoSpeed;
    private int potatoLevel;

    Potato(int level) {
        potatoLevel = level;

        float[] potatoSize = potatoSize(level);
        
        xPosition = random(0, width - 10);
        yPosition = -height;
        potatoWidth = potatoSize[0];
        potatoHeight = potatoSize[0];
        potatoSpeed = gameLose ? 0 : speed(potatoLevel);
    }
    
    final void display() {

        if (potatoCollision())
            gameLose = true;

        if (gameLose)
            potatoSpeed = 0;

        color potatoColour = potatoColour(potatoLevel);

        if (yPosition < height + potatoHeight)
            yPosition += potatoSpeed;
        else {
            potatoFlew = true;
            potatoSpeed = 0;
        }
        
        stroke(0);  
        fill(potatoColour);

        ellipseMode(CENTER);
        ellipse(xPosition, yPosition, potatoWidth, potatoHeight);
    }

    final color potatoColour(int level) {
        switch (level) {
            case 1:
                return color(221,130,54);
            case 2:
                return color(178,94,9);
            case 3:
                return color(58,43,31);
            default:
                return color(221,130,54);
        }
    }
    
    final float[] potatoSize(int level) {
        switch (level) {
            case 1:
                return new float[] {random(25, 95), random(10, 25)};
            case 2:
                return new float[] {random(80, 150), random(20, 40)};
            case 3:
                return new float[] {random(100, 200), random(30, 50)};
            default:
                return new float[] {random(25, 95), random(10, 25)};
        }
    }

    float speed(int level) {
        switch (level) {
            case 1:
                return 0.5;
            case 2:
                return 0.8;
            case 3:
                return 1;
            default:
                return 0.5;
        }
    }

    boolean potatoCollision() {

        float characterXPosition = xStartPosition + character.getXPosition();
        float characterYPosition = yStartPosition + character.getYPosition();
        float characterWidth = character.getCharacterWidth();
        float characterHeight = character.getCharacterHeight();


        return dist(characterXPosition, characterYPosition, xPosition, yPosition) < (potatoWidth + characterWidth) / 2;
    }

    boolean getPotatoFlew() {
        return potatoFlew;
    }
    
}