class Spaceship extends Floater{
    public Spaceship() {
    myCenterX = 400; // Center of the screen
    myCenterY = 400;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0; // Initially pointing right
    corners = 3;
    xCorners = new int[corners];
    yCorners = new int[corners];

    // Define the triangular shape relative to (0, 0)
    xCorners[0] = -8;
    yCorners[0] = -8;
    xCorners[1] = 16;
    yCorners[1] = 0;
    xCorners[2] = -8;
    yCorners[2] = 8;
  }
  
  //public void setXspeed(double x) {
    //myXspeed += x;
  //}
  //public void setYspeed(double y) {
    //myYspeed += y;
  //}
  public void setMyPointDirection(double r) {
    myPointDirection += r;
  }
  public void hyperspace(){
    myXspeed = 0;
    myYspeed = 0;
    myCenterX = (int)(Math.random()*500);
    myCenterY = (int)(Math.random()*500);
  }
    public void checkRedColor() {
    // gets color spaceship is on (c is an RGB value)
    int c = get((int) myCenterX, (int) myCenterY);

    // Extract the red, green, and blue components of the color
    int redValue = (c >> 16) & 0xFF;   
    int greenValue = (c >> 8) & 0xFF;  
    int blueValue = c & 0xFF;          
    int alphaValue = (c >> 24) & 0xFF; 

    // for debugging: print out the values of the RGB components
    //System.out.println("Red: " + redValue + ", Green: " + greenValue + ", Blue: " + blueValue + ", Alpha: " + alphaValue);

    // Check if the color is red (255, 0, 0) with no alpha (fully opaque)
    if (redValue == 255 && greenValue == 0 && blueValue == 0 && alphaValue == 255) {
      fill(255);
      textSize(20);
      text("You died!! D:", 365, 400);
      ship = null;
    } else {
      //System.out.println("The pixel is not red.");
    }
  }
} 

public void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      ship.accelerate(0.5); // Move forward
    } else if (keyCode == DOWN) {
      ship.accelerate(-0.5); // Move backward
    } else if (keyCode == LEFT) {
      ship.setMyPointDirection(-10); // Rotate counterclockwise
    } else if (keyCode == RIGHT) {
      ship.setMyPointDirection(10); // Rotate clockwise
    } else if (keyCode == SHIFT) {
      ship.hyperspace();
    }
  }
}
