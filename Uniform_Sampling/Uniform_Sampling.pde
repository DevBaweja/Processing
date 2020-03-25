int MAX,CAND;
int limit;
Coordinate[] coordinate;

void setup()
{
 //size(600,600,P3D);
 fullScreen(P3D);
 frameRate(1);
 MAX = 2000;
 CAND = 5;
 limit=0;
 coordinate = new Coordinate[MAX];
}

void draw()
{
  background(255);
  stroke(#00008b);
  strokeWeight(8);
  if(limit==0)
     {
       coordinate[limit] = new Coordinate(width/2,height/2);
        limit++;
     }
    else
  {
    for(int i=0;i<limit;i++)
      point(coordinate[i].x,coordinate[i].y,1) ;
    
    coordinate[limit] = generate(coordinate,limit);
    point(coordinate[limit].x,coordinate[limit].y,1);
      limit++;
      if(limit>MAX-1)
      noLoop();
  }
  
}

Coordinate generate(Coordinate[] coordinate,int limit)
{
  Coordinate[] temp   = new Coordinate[CAND];
  Config[] config = new Config[CAND];
  delay(5000);
  stroke(0);
  strokeWeight(4);
  
  for(int i=0;i<CAND;i++)
  {
    temp[i] = new Coordinate(random(0,width),random(0,height));
    strokeWeight(4);
    stroke(#a9a9a9);
    point(temp[i].x,temp[i].y,0);
    config[i] = getClose(temp[i],coordinate,limit);
    strokeWeight(2);
    stroke(#d3d3d3);
    line(temp[i].x,temp[i].y,-1,coordinate[config[i].index].x,coordinate[config[i].index].y,0);
  }
  
  Config m = maxDistance(config);
  stroke(#ffcccb);
  strokeWeight(6);
  point(temp[m.index].x,temp[m.index].y,1);
  stroke(#8b0000);
  strokeWeight(2);
  line(temp[m.index].x,temp[m.index].y,0,coordinate[config[m.index].index].x,coordinate[config[m.index].index].y,0);
  return temp[m.index];
}

Config getClose(Coordinate temp,Coordinate[] coordinate,int limit)
{
  float[] distance  = new float[limit];
  float x1 = temp.x;
  float y1 = temp.y;
   for(int i=0;i<limit;i++)
       distance[i] = distance(x1,y1,coordinate[i].x,coordinate[i].y);
      return minDistance(distance);
}

Config minDistance(float[] distance)
{
  Config temp = new Config();
  int min = 0;
  for(int i=1;i<distance.length;i++)
    {
       if(distance[i]<distance[min])
         min = i;
    }
   temp.index = min; 
   temp.distance = distance[min];
   return temp;
}


Config maxDistance(Config[] config)
{
  Config temp = new Config();
  int max = 0;
  for(int i=1;i<config.length;i++)
    {
       if(config[i].distance>config[max].distance)
         max = i;
    }
  temp.index = max;
  temp.distance = config[max].distance;
  return temp;
}

float distance(float x1,float y1,float x2,float y2)
{
   return (float)Math.sqrt(Math.pow(x2-x1,2)+Math.pow(y2-y1,2));
}
