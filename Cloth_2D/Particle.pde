class Particle extends VerletParticle2D
{
  float sizex,sizey;
  Particle(float x,float y,float sizex,float sizey)
  {
    super(x,y);
    this.sizex = sizex/2+sizex/4;
    this.sizey = sizey/2+sizey/4;
  }
  
  void display()
  {
    fill(255);
    ellipse(x,y,sizex,sizey);
  }
}
