int total;
int circle;
float pi;
float raduis;
int s;
void setup()
{
  s = 400;
  size(400,400);
  background(0);
  pi = 0;
  raduis = s/2;
  total = 1;
  circle = 1;
  frameRate(1000);
}

void draw()
{
   stroke(255);
   strokeWeight(3);
   float x = random(s);
   float y = random(s);
   total++;
   if(dist(s/2,s/2,x,y)<raduis)
   {
     circle++;
     stroke(#7ed56f);
   }
   point(x,y);
   pi = 4*((float)circle/(float)total);
   print(pi +"\n");
}
