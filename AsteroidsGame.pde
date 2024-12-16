Spaceship ship;
Stars [] stars = new Stars[140];
Lasers [] lasers = new Lasers[20];
ArrayList <Asteroid> myList = new ArrayList <Asteroid>();
ArrayList <Bullet> bullets = new ArrayList <Bullet>();
boolean gameOver = false;

public void setup() {
  size(800, 800);
  ship = new Spaceship();
  for(int i = 0; i < stars.length; i += 1){
    stars[i] = new Stars();
  }
  for(int i = 0; i < lasers.length; i += 1){
    lasers[i] = new Lasers();
  }
  for(int i = 0; i < 40; i += 1){
    myList.add(new Asteroid());
  }
  //for(int i = 0; i < 50; i += 1){
    //bullets.add(new Bullet(ship));
  //}
}
public void draw() {
  background(0);
  if (gameOver == true){
    ship = null;
  }
  for(int i = 0; i < stars.length; i += 1){
    stars[i].showS();
  }
  for(int i = 0; i < lasers.length; i += 1){
    lasers[i].show();
    lasers[i].move();
  }
  for(int i = 0; i < myList.size(); i += 1){
    myList.get(i).show();
    myList.get(i).move();
    float distance = dist((float)ship.getX(), (float)ship.getY(), 
                          (float)myList.get(i).getX(), (float)myList.get(i).getY());
    if (distance < 10){
      myList.remove(i);
      i--;
    }
  }
  for(int i = 0; i < bullets.size(); i += 1){
    bullets.get(i).show();
    bullets.get(i).move();
  }
    for (int i = 0; i < bullets.size(); i++) {
    Bullet b = bullets.get(i); // Get the current bullet
    
    for (int j = 0; j < myList.size(); j++) {
        Asteroid a = myList.get(j); // Get the current asteroid
        float distance = dist((float)b.getX(), (float)b.getY(), 
                              (float)a.getX(), (float)a.getY());
    if (distance < 10){
      bullets.remove(i);
      myList.remove(j);
      i--;
      break;
    }
    }
  }
  ship.checkRedColor();
  ship.show();
  ship.move();
}

public void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      ship.accelerate(0.5); // Move forward
      for(int i = 0; i < bullets.size(); i += 1){
        bullets.get(i).accelerate(0.5);
      }
      
    } else if (keyCode == DOWN) {
      ship.accelerate(-0.5); // Move backward
      for(int i = 0; i < bullets.size(); i += 1){
        bullets.get(i).accelerate(-0.5);
      }
      
    } else if (keyCode == LEFT) {
      ship.setMyPointDirection(-10); // Rotate counterclockwise
      for(int i = 0; i < bullets.size(); i += 1){
        bullets.get(i).setMyPointDirection(-10);
      }
      
    } else if (keyCode == RIGHT) {
      ship.setMyPointDirection(10); // Rotate clockwise
      for(int i = 0; i < bullets.size(); i += 1){
        bullets.get(i).setMyPointDirection(10);
      }
      
    } else if (keyCode == SHIFT) {
      ship.hyperspace();
      
    } else if (keyCode == CONTROL) {
        Bullet newBullet = new Bullet(ship); // Create a bullet at the ship's current position/direction
        bullets.add(newBullet);              // Add it to the list
        newBullet.accelerate(6.0);
    }
  }
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
    fill(255);
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
