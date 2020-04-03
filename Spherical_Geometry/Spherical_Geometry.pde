import peasy.*;
PeasyCam cam;

/*
Sherical Coordinate System
(r,θ,φ)
r = [0,infinity), θ = [0, PI], φ = [0, TWO_PI), 

(r,thetha,phi) from (x,y,z)
x = r*sin(thetha)*cos(phi)
y = r*sin(thetha)*sin(phi)
z = r*cos(thetha)
*/

PVector[][] globe;
int reso = 20;
void setup()
{
  size(600,600,P3D);
  cam = new PeasyCam(this,800);
  globe = new PVector[reso+1][reso+1];
  colorMode(HSB);
}

void draw()
{
  background(0);
  noFill();
  //fill(255);
  stroke(255);
  //noStroke();
  strokeWeight(2);
  lights();
  //translate(width/2,height/2);
  float r = 200.0;
  
  
  //beginShape();
  for(int i=0;i<reso+1;i++)
  {
    float lat = map(i,0,reso  ,0,PI);
    for(int j=0;j<reso+1;j++)
    {
      float lon = map(j,0,reso,0,TWO_PI);
      // Converting (r,lat,lon) into (x,y,z)
      float x = r*sin(lat)*cos(lon);
      float y = r*sin(lat)*sin(lon);
      float z = r*cos(lat);
      globe[i][j] = new PVector(x,y,z);
      /*
      PVector v = PVector.random3D();
      v.mult(10);
      globe[i][j].add(v);
      */
    }
  }
  //endShape(CLOSE);
  
    for(int i=0;i<reso;i++)
  {
    /*
      if(i%2==0) fill(0); else fill(255);
    */
    beginShape(TRIANGLE_STRIP);
    for(int j=0;j<reso+1;j++)
    {
      /*
      float hu = map(j,0,reso,0,6*255);
      fill(hu%256,255,255);
      */
      /*
        if(j%2==0) fill(0); else fill(255);
      */
      PVector v1 = globe[i][j];
      vertex(v1.x,v1.y,v1.z);
      PVector v2 = globe[i+1][j];
      vertex(v2.x,v2.y,v2.z);
    }
    endShape();
  }
    
  //sphere(200);
  
  
}
