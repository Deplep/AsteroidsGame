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

