public boolean overSkySlider = false;
public boolean updateSlider = false;
public float sliderValue; 

class SkySlider {

    private float sliderXPos;
    private float slideLineStartXPos;
    private float slideLineEndXPos;
    private float sliderYPos;
    private float sliderLength;
    private float sliderDiameter;

    SkySlider(float xPos, float yPos, float length, float diameter) {
        slideLineStartXPos = xPos;
        slideLineEndXPos = xPos + length;
        sliderXPos = xPos;
        sliderYPos = yPos;
        sliderLength = length;
        sliderDiameter = diameter;
    }

    void display() {
        fill(0);
        textSize(15);
        text("Sky Slider", 10,40, 200, 50);

        strokeWeight(2);
        line(slideLineStartXPos, sliderYPos, slideLineEndXPos, sliderYPos);
        strokeWeight(1);

        globalSliderXPos = width - 225 + sliderXPos;
        globalSliderYPos = 100 + sliderYPos;

        ellipseMode(CENTER);
        ellipse(sliderXPos, sliderYPos, sliderDiameter, sliderDiameter);

        overSkySlider = overRect(globalSliderXPos - (sliderDiameter / 2), globalSliderYPos - (sliderDiameter / 2), sliderDiameter, sliderDiameter);
    }

    void update() {
        if (updateSlider) {
            
            float change = map(mouseX, globalSliderXPos, globalSliderXPos + 100, 0, 100);
            
            float newPos = sliderXPos + change;

            sliderXPos = constrain(newPos, slideLineStartXPos, slideLineEndXPos);

            sliderValue = map(sliderXPos, slideLineStartXPos, slideLineEndXPos, 0, 100);
                
        }
    }

    float getSliderValue() {
        return sliderValue;
    }
}