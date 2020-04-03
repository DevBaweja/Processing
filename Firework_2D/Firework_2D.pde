import peasy.*;

ArrayList<Firework> fireworks;
PVector gravity;
PeasyCam cam;
void setup()
{
  size(600,400,P3D);
  cam = new PeasyCam(this,500);
  stroke(255);
  strokeWeight(4);
  colorMode(HSB);
  fireworks = new ArrayList<Firework>();
  gravity = new PVector(0,0.1);
  background(0);
}

void draw()
{
  background(0,25);
  
  /*
  fill(0,50);
  noStroke();
  rect(0,0,width,height);
  */
  
  if(random(1)<0.3)
    fireworks.add(new Firework());
  
  for(int i = fireworks.size()-1;i>=0;i--)
  {
      Firework firework = fireworks.get(i);
      firework.show();
      firework.update();
      
      if(firework.done())
        fireworks.remove(i);
  }
}
