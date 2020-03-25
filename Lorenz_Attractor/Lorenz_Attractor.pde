import peasy.*;

float x,y,z;
float a,b,c;
PeasyCam cam;

ArrayList<PVector> points = new ArrayList<PVector>();

void setup()
{ 
  // Inputs - x,y,z  
  x = 0.001;
  y= 0.001;
  z = 0.1;
    
  // Constant Field - a,b,c
  a = 10.0;
  b = 28.0;
  c = 8.0/3.0;
  
  cam = new PeasyCam(this,1000);
  colorMode(HSB);
  //size(600,600,P3D);
  fullScreen(P3D);
}

void draw()
{
    background(0);
  float dt = 0.01;
  float dx = ( a * ( y - x ) ) * dt;
  float dy = ( x * ( b - z ) - y ) * dt;
  float dz = ( x * y - c * z ) * dt;
  
  x += dx;
  y += dy;
  z += dz;
    stroke(255);
    strokeWeight(4);
    noFill();
  points.add(new PVector(x,y,z));
 float hu = 0;
 beginShape();
 for(PVector v : points)
    {
      stroke(hu,255,255);
      vertex(v.x,v.y,v.z);
      //PVector offset = PVector.random3D();
      //v.add(offset);
      hu += 0.1;
      if(hu>255)
        hu =0;
  }
 endShape();
 lights();
}
