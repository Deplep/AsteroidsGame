Spaceship ship;
Stars [] stars = new Stars[140];
Lasers [] lasers = new Lasers[70];

public void setup() {
  size(800, 800);
  ship = new Spaceship();
  for(int i = 0; i < stars.length; i += 1){
    stars[i] = new Stars();
  }
  for(int i = 0; i < lasers.length; i += 1){
    lasers[i] = new Lasers();
  }
}
public void draw() {
  background(0);
  for(int i = 0; i < stars.length; i += 1){
    stars[i].showS();
  }
  for(int i = 0; i < lasers.length; i += 1){
    lasers[i].show();
    lasers[i].move();
  }
  //ship.checkRedColor();
  ship.show();
  ship.move();
}


class Lasers{
  private int xPos, yPos, xSpeed, ySpeed;
  public Lasers(){
    xPos = (int)(Math.random()*800);
    yPos = (int)(Math.random()*800);
    xSpeed = (int)(Math.random()*5 - 2.5);
    ySpeed = (int)(Math.random()*5 - 2.5);
  }  
  public void show(){
    fill(255, 0, 0);
    rect(xPos, yPos, 10, 10);
  }
  public void move(){
    xPos += xSpeed;
    yPos += ySpeed;
        //wrap around screen    
    if (xPos > width){    
      xPos = 0;
    } else if (xPos < 0) {    
      xPos = width;
    }    
    if (yPos > height) {    
      yPos = 0;
    } else if (yPos < 0){    
      yPos = height;
    }
  }
}
