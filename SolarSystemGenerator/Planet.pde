class Planet
{
   float raduis;
   float angle;
   float distance;
   Planet[] planets;
   float orbitSpeed;
   PVector v;
   PShape globe;
   
   Planet(float r,float d,float o,PImage img)
   {
     v = PVector.random3D();
     raduis = r;
     distance = d;
     v.mult(distance);
     angle = random(TWO_PI);
     orbitSpeed = o;
     noStroke();
     noFill();
     // fill(255);
     globe = createShape(SPHERE,raduis);
     globe.setTexture(img);
   }
   
   void spawnMoon(int total,int level)
   {
        planets = new Planet[total];
        for(int i=0;i<planets.length;i++)
          {  
             float r = raduis/(1.2*level);
             float d = random(2*(raduis+r),3*(raduis+r));
             float o = random(-0.03,0.03);
            int index = int(random(0,8)); 
            PImage img =  textures[index];
            planets[i] = new Planet(r,d,o,img);
            println(planets[i]);             if(level<2)
            {
               int num = int(random(0,4));
               //int num = (int)random(0,4);
              planets[i].spawnMoon(num,level+1);
            }
        }
   }
   
   void orbit()
   {
     angle += orbitSpeed;
     if(planets != null)
     for(int i=0;i<planets.length;i++)
       planets[i].orbit();
   }
   
   void show()
   {
     pushMatrix();
     noStroke();
     
     //rotate(angle);
     PVector v1 = new PVector(0,0,1);
     PVector p = v.cross(v1);
     rotate(angle,p.x,p.y,p.z);
     stroke(255);

     line(0,0,0,v.x,v.y,v.z);
     //line(-p.x,-p.y,-p.z,p.x,p.y,p.z);
     
     translate(v.x,v.y,v.z);
     noStroke(); 
     fill(255);
     //sphere(raduis); 
     shape(globe);
     //ellipse(0,0,2*raduis,2*raduis);
     //printArray(planets);
     if(planets != null)
     for(int i=0;i<planets.length;i++)
       planets[i].show();
     
     popMatrix();
   }
}
