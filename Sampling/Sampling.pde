Coordinate[] coordinate;
int MAX = 2000;
int k;

void setup()
{
 //size(600,600);
 fullScreen();
 frameRate(100);
 k=0;
 coordinate = new Coordinate[MAX];
}

void draw()
{
  background(255);
  stroke(#00008b);
  strokeWeight(8);
  
  // Previous Points
  for(int i=0;i<k;i++)
    point(coordinate[i].x,coordinate[i].y) ;
  // Generating new point
     coordinate[k] = generate();
     point(coordinate[k].x,coordinate[k].y);  
   k++;
  if(k>MAX-1)
      noLoop();
}

Coordinate generate()
{
  Coordinate temp = new Coordinate();
  temp.x = random(0,width);
  temp.y = random(0,height);
  return temp;
}
