void setup()
{
  size(640,480);
  colorMode(RGB,1);
}

void draw()
{
  background(255);
  int maxIterations = 100;  
  float w = 5;
  float h = (w*height) / width;
    loadPixels();
    for(int x=0;x<width;x++) {
        for(int y=0;y<height;y++) {
            var a = map(x,0,width,min,max);
            var b = map(y,0,height,min,max);

            var ca = a;
            var cb = b;

            var n = 0;
            var z = 0;
            while(n<maxIterations)
            {
                // For square of complex number
                var anew = a*a-b*b;
                var bnew = 2*a*b;

                a = anew + ca;
                b = bnew + cb;

                if(abs(a+b) > 16)
                    break;
                n++;
            }

            // var bright = map(n,0,maxIterations,0,255);
            var bright = map(n,0,maxIterations,0,1);
            bright = map(sqrt(bright),0,1,0,255);

            // var bright = 200; 
            if(n==maxIterations)
                bright = 0;

            var pix = (x+y*width)*4;
            pixels[pix+0] = bright; // Red
            pixels[pix+1] = bright; // Green
            pixels[pix+2] = bright; // Blue
            pixels[pix+3] = 255; // Saturation
        }
    }
    updatePixels();
}
