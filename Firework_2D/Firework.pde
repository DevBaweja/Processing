class Firework{
   int hu;
   Particle firework;
   boolean exploded;
   ArrayList<Particle> particles;
   
  Firework()
  {
    this.hu = floor(random(255));
    this.firework = new Particle(random(-width/2,width/2),random(height/2-height/4,height/2),true,this.hu);
    exploded = false;
    particles = new ArrayList<Particle>();
  }
  
   void update()
    {
        if(!this.exploded)
        {
            this.firework.applyForce(gravity);
            this.firework.update();

            if(this.firework.vel.y >= 0) // 
            {
                this.exploded = true;
                this.explode();
            }
        }

        for(int i = this.particles.size()-1;i>=0;i--)
           {
                Particle particle = this.particles.get(i);
                particle.applyForce(gravity);
                particle.update();
                if(particle.done())
                        this.particles.remove(i);           
           } 

        
    }

    void explode()
    {
        int n = 100;
        for(int i=0;i<n;i++)
        {
            Particle p = new Particle(this.firework.pos.x,this.firework.pos.y,false,this.hu);
            this.particles.add(p);
        }
    }

    void show()
    {
        if(!this.exploded)
            this.firework.show();

        for(Particle particle : this.particles)
            particle.show();
    }

    boolean done()
    {
        return (this.exploded && this.particles.size() == 0);
    }
}
