float[] Values;
int i,j;
int size = 32;
int frame = 5;
float speed;
void setup()
{
  // size(600,300);
  fullScreen();
  Values = new float[width/size];
  for(int i=0;i<Values.length;i++)
    Values[i] = random(height);
    i = 0;
    j = Values.length-1;
   // noLoop();
   // bubbleSort(Values);
   frameRate(frame);
}

void draw()
{
    speed = map(mouseX,0,width,0,500);
    if(speed!=0)
     frameRate(speed);
    
    background(211);
    stroke(0);
    strokeWeight(size/2);
    strokeCap(ROUND);
    if(i < Values.length - 1)
    {
      if (Values[j-1] > Values[j])  
        Swap(Values,j,j-1);
      j--;
      if(j <= i)
       {
         j=Values.length-1;
         i++;
       }
    }
    else
    {
      println("Finished");
      noLoop();
    }
    
    display(Values,j);
}

void display(float Values[],int i)
{
 for(int k=0;k<Values.length;k++)
    line(size*k+size/2,height,size*k+size/2,height-Values[k]);
    
  stroke(255,40,0);
  line(size*j+size/2,height,size*j+size/2,height-Values[i]);
}


void bubbleSort(float Values[])
{
    for (int i = 0; i < Values.length - 1; i++)  
    { 
        for (int j = 0; j < Values.length - i - 1; j++)  
        { 
            if (Values[j] > Values[j + 1])  
              Swap(Values,j,j+1);
        } 
    }
}

void Swap(float Values[],int i,int j)
{
   float temp = Values[i];
   Values[i] = Values[j];
   Values[j] = temp;
}
