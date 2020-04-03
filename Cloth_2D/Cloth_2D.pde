import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh2d.*;
import toxi.math.*;
import toxi.math.conversion.*;
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;

import toxi.physics.*;
//import toxi.physics.behaviors.*;
import toxi.physics.constraints.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;

Particle[][] particles;
ArrayList<Spring> springs;
int total;

VerletPhysics2D physics;
void setup()
{
  size(600,600);
  total = 20;
  particles = new Particle[total][total];
  springs = new ArrayList<Spring>();
  
  physics = new VerletPhysics2D();
  // Creating Gravity
  Vec2D gravity = new Vec2D(0,1); // Downward
  GravityBehavior gb = new GravityBehavior(gravity);
  
  physics.addBehavior(gb);
  
  float x = width/4;
  float y = height/4;
  float sizex = (width/2)/total;
  float sizey = (height/2)/total;
  
  for(int i=0;i<total;i++)
    for(int j = 0;j<total;j++)
  {
    Particle p = new Particle(x+i*sizex,y+j*sizey,sizex,sizey);
    particles[i][j] = p;
    physics.addParticle(p); 
  }
  
  float lenx = sizex;
  float leny = sizey;
  float strength = 0.5;
  
  // It don't join last row and last column
  for(int i=0;i<total-1;i++)
    for(int j=0;j<total-1;j++)
    {
      Particle a = particles[i][j];
      Particle b1 = particles[i+1][j];
      Particle b2 = particles[i][j+1];
      
      Spring s1 = new Spring(a,b1,lenx,strength);
      Spring s2 = new Spring(a,b2,leny,strength);
      springs.add(s1);
      springs.add(s2);
      physics.addSpring(s1);
      physics.addSpring(s2);
    }
   
   // Last column
   for(int i=0;i<total-1;i++)
     {
       Particle a = particles[total-1][i];
       Particle b  = particles[total-1][i+1];
       Spring s = new Spring(a,b,lenx,strength);
       springs.add(s);
        physics.addSpring(s);
     }
   
  
  particles[0][0].lock();
  particles[total-1][0].lock();
  //Particle p1 = particles.get(0);
  //p1.lock();
  //Particle p2 = particles.get(particles.size()-1);
  //p2.lock();
}

void draw()
{
  background(51);
  physics.update();
  
  //for(int i=0;i<total;i++)
  //  for(int j=0;j<total;j++)
  //  {
  //    particles[i][j].display();
  //  }
  for(Spring s : springs)
    s.display();
}
