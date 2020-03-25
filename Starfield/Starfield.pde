int MAX = 10000;
float speed;
Star [] stars = new Star[MAX];

void setup()
{
  fullScreen();
  //size(400,400);
  for(int i=0;i<stars.length;i++)
    stars[i] = new Star(); 

}

void draw()
{
  speed = map(mouseX,0,width,0,10);
  background(0);
  translate(width/2,height/2);
  for(int i=0;i<stars.length;i++)
  {
    stars[i].update();
    stars[i].show();
  }
}
