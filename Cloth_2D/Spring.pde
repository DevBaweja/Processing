class Spring extends VerletSpring2D
{
  
  Spring(Particle a,Particle b,float len,float strength)
  {
     super(a,b,len,strength); 
  }
  
  void display()
  {
    stroke(255);
    strokeWeight(2);
    line(a.x,a.y,b.x,b.y);
  }
}
