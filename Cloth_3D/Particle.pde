class Particle extends VerletParticle
{
  float sizex,sizey;
  Particle(float x,float y,float z,float sizex,float sizey)
  {
    super(x,y,z);
    this.sizex = sizex/2+sizex/4;
    this.sizey = sizey/2+sizey/4;
  }
  
  void display()
  {
    fill(255);
    pushMatrix();
    translate(x,y,z);
    //ellipse(0,0,sizex,sizey);
    popMatrix();
  }
}
