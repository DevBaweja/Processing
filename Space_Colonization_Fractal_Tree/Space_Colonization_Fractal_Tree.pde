import peasy.*;
PeasyCam cam;
Tree tree;
float MIN_DIST = 10.0;
float MAX_DIST = 100.0;
void setup()
{
  size(600, 600, P3D);
  cam = new PeasyCam(this,1000); 
  tree = new Tree();
}

void draw()
{
  background(51);
  tree.show();
  tree.grow();
}
/*
Cyliner with wood texture
Lighting
Actual Leafs
Adding Wind,Spring Effect  
*/
