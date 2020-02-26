class Cloud {

    private float xPosition;
    private float cloudWidth;
    private float cloudHeight;
    private float cloudType;
    private float yPosition;

    Cloud(float position, float width, float height, float type) {
        cloudWidth = width;
        cloudHeight = height;
        xPosition = position;
        yPosition = 0 - height;
        cloudType = type;
    }
    
    void display() {
        yPosition = yPosition < height + cloudHeight ? yPosition += 0.5 : -cloudHeight;
                
        fill(255);

        rect(xPosition, yPosition, cloudWidth, cloudHeight, cloudType);
    }
}