class Leaf {
    PVector pos;
    float raduis;
    boolean reached;
  Leaf()
  {
    /*
    For the Bottom
    pos = new PVector(random(width),random(height-width/4));
    For the Center
    pos = new PVector(random(width),random(height));
    */
    // For the Center with PeasyCam
    //pos = new PVector(random(-width/2,width/2),random(-height/2,height/2));
    
    pos =  PVector.random3D();
    // Multiplying by width/2 will expand it to circle 
    pos.mult(random(width/2));
    
    pos.y -= height/4;
    
    /*
    pos = PVector.random2D();
    pos.x += random(width);
    pos.y += random(height-width/4);
    */
    raduis = 4;
    reached = false;
  }
  
  void show()
  {
    // To make each leaf as it own thing
    // As we are translating it
    pushMatrix();
    translate(pos.x,pos.y,pos.z);
    // Sphere can be drawn but it will take to much of render time 
    ellipse(0,0,raduis,raduis);
    //sphere(raduis);
    popMatrix();
  }
}
