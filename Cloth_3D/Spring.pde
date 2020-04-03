class Spring extends VerletSpring
{
  
  Spring(Particle a,Particle b,float len,float strength)
  {
     super(a,b,len,strength); 
  }
  
  void display()
  {
    stroke(255);
    strokeWeight(2);
    line(a.x,a.y,a.z,b.x,b.y,b.z);
  }
}
