class Star 
{
  float x,y,z;
  float raduis = 10;
  
  float pz;
  Star()
  {
   init();
  }
 
 void update()
 {
   z -= speed;
   if(z<1)
     init();
    
 }
 
 void init()
 {
      x = random(-width,width);
      y = random(-height,height);
      z = random(width);
      pz = z;
 }
 
 void show()
 {
   fill(255);
   noStroke();
   
   float sx = map(x/z,0,1,0,width);
   float sy =  map(y/z,0,1,0,height);
   
   float r = map(z,0,width,raduis,0);
   ellipse(sx,sy,r,r);
   
   stroke(255);
   strokeWeight(3  );
   float px,py;
     px = map(x/pz,0,1,0,width);
     py =  map(y/pz,0,1,0,height);
   pz = z;
   line(px,py,sx,sy);
   
 }
}
