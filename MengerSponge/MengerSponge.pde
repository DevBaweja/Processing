float speed = 0;
Box b;
ArrayList<Box> sponge;

void setup()
{
  //size(400,400,P3D);
  fullScreen(P3D);
  //frameRate(1000);
  b = new Box(0,0,0,height/2);
  sponge = new ArrayList<Box>();
  sponge.add(b);
}

void mousePressed()
{
  ArrayList<Box> next = new ArrayList<Box>();
  
  for(Box b:sponge)
  {
    ArrayList<Box> newBoxes = b.generate();
    next.addAll(newBoxes);
  }
  sponge = next;
}

void draw()
{
 background(51);
 //stroke(0);
 stroke(255);
 noFill();
 lights();
 
 translate(width/2,height/2);
 rotateX(speed);
 rotateY(speed);
 rotateZ(speed);

  for(Box b:sponge) 
     b.show();
 //ArrayList<Box> boxes = b.generate();
 speed += 0.01;
}
