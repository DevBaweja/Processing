class Particle{
 
  PVector pos;
  boolean firework;
  int lifespan;
  int hu;
  PVector vel;
  PVector acc;
  
  Particle(float x,float y,boolean firework,int hu)
  {
      this.pos = new PVector(x,y);
      this.firework = firework;
      this.lifespan = 255;
      this.hu = hu;
      
      if(this.firework)
      {
        this.vel = new PVector(random(-3,3),random(-6,-8));
      }
      else
      {
        this.vel = PVector.random2D();// static function
        this.vel.mult(random(2,10));
      }
      
      this.acc = new PVector(0,0);
  }
  
  void applyForce(PVector force)
  {
    this.acc.add(force);
  }
  
  void update()
  {
    if(!this.firework)
    {
      this.vel.mult(0.9);
      this.lifespan -= 3;
    }
    
    this.vel.add(this.acc);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }
  
  void show()
  {
    if(!this.firework)
    {
      strokeWeight(4);
      stroke(this.hu,255,this.lifespan);
    }
    else
    {
      strokeWeight(8);
      stroke(this.hu,255,255);
    }
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    point(0,0);
    popMatrix();
  }
  
  boolean done()
  {
      return (this.lifespan < 0);
  }
  
  
}
