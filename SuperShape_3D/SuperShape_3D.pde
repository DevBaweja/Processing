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
int reso = 100;
float offset = 0;
float m = 0;
float mchange = 0;
void setup()
{
  size(600,600,P3D);
  cam = new PeasyCam(this,800);
  globe = new PVector[reso+1][reso+1];
  colorMode(HSB);
}

float superShape(float angle,float m,float n1,float n2,float n3)
{
  float a = 1.0;float b =1.0;
  float cosphi = abs( (1/a)*cos( m*angle/4 ) );
  float sinphi = abs( (1/b)*sin( m*angle/4 ) );

  float rc = pow( pow(cosphi,n2) + pow(sinphi,n3) ,1/n1);
  float r = 1/rc;
    return r;
}


void draw()
{
  
  //m = map(mouseX,0,width,0,7);
  m = map(sin(mchange),-1,1,0,7);
  mchange += 0.05;
  background(0);
  //noFill();
  fill(255);
  //stroke(0);
  noStroke();
  strokeWeight(2);
  lights();
  //translate(width/2,height/2);
  float r = 200.0;
  
  
  //beginShape();
  for(int i=0;i<reso+1;i++)
  {
    float lat = map(i,0,reso,-HALF_PI,HALF_PI);
    //float r2 = superShape(lat,m,0.2,1.7,1.7);
    float r2 = superShape(lat,6,250,100,100);
    //float r2 = superShape(lat,3,15.24,0.35,49.59,1.05,0.28);

    for(int j=0;j<reso+1;j++)
    {
      float lon = map(j,0,reso,-PI,PI);
      //float r1 = superShape(lon,m,0.2,1.7,1.7);
      float r1 = superShape(lon,6,60,55,1000);
      //float r1 = superShape(lon,6,-0.68,22.77,0.75,1.99,0.64);
       
      // Converting (r,lat,lon) into (x,y,z)
      
      float x = r*r1*cos(lon)*r2*cos(lat);
      float y = r*r1*sin(lon)*r2*cos(lat);
      float z = r*r2*sin(lat);
      
      // Toroidal mapping
      /*
      float x = r*cos(lon)*(r1+r2*cos(lat));
      float y = r*sin(lon)*(r1+r2*cos(lat));
      float z = r*r2*sin(lat);
      */
      
      globe[i][j] = new PVector(x,y,z);
      /*
      PVector v = PVector.random3D();
      v.mult(10);
      globe[i][j].add(v);
      */
    }
  }
  //endShape(CLOSE);
      //offset += 5;
    for(int i=0;i<reso;i++)
  {
     float hu = map(i,0,reso,0,6*255);
      fill((hu+offset)%256,255,255);
    /*
      if(i%2==0) fill(0); else fill(255);
    */
    beginShape(TRIANGLE_STRIP);
    for(int j=0;j<reso+1;j++)
    {
     
     
     
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

/*
Interchanging superShape
Color 
Interface
Variables
*/
/*
paulbourke
*/
