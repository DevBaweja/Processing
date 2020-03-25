import peasy.*;

PeasyCam cam;
PImage sunTexture;
PImage[] textures = new PImage[9];
Planet sun;
void setup()
{
  size(800,800,P3D);
  sunTexture = loadImage("Sun.jpg");
  textures[0] = loadImage("Mercury.jpg");
  textures[1] = loadImage("Venus.jpg");
  textures[2] = loadImage("Earth.jpg");
  textures[3] = loadImage("Mars.jpg");
  textures[4] = loadImage("Jupiter.jpg");
  textures[5] = loadImage("Saturn.jpg");
  textures[6] = loadImage("Neptune.jpg");
  textures[7] = loadImage("Uranus.jpg");
  textures[8] = loadImage("Pluto.jpg");
  cam = new PeasyCam(this,800);
  //fullScreen();
  sun = new Planet(50,0,0,sunTexture);
  sun.spawnMoon(5,1);
  //frameRate(10);
}

void draw()
{
  background(0);
  lights();
  pointLight(255,0,0,0,0,0);
  //translate(width/2,height/2);
  sun.show();
  sun.orbit();
  //noLoop();
}
// Build Real Simulation of Solar System
// With accurate distance,rotation,revolution,size and their moons
