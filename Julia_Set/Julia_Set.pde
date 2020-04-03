float angle = 0;

void setup() {
  size(640, 480);
  //colorMode(RGB, 1);
  colorMode(HSB,1);
}   
void draw() {
  
  //float ca = map(mouseX,0,width,-1,1);
  //float cb = map(mouseY,0,height,-1,1);
  
  float ca = sin(angle);
  float cb = 0;
  angle += 0.02;
  background(255);

  // Establish a range of values on the complex plane
  // A different range will allow us to "zoom" in or out on the fractal

  // It all starts with the width, try higher or lower values
  float w = 5;
  float h = (w * height) / width;

  // Start at negative half the width and height
  float xmin = -w/2;
  float ymin = -h/2;

  // Make sure we can write to the pixels[] array.
  // Only need to do this once since we don't do any other drawing.
  loadPixels();

  // Maximum number of iterations for each point on the complex plane
  int maxiterations = 100;

  // x goes from xmin to xmax
  float xmax = xmin + w;
  // y goes from ymin to ymax
  float ymax = ymin + h;

  // Calculate amount we increment x,y for each pixel
  float dx = (xmax - xmin) / (width);
  float dy = (ymax - ymin) / (height);

  // Start y
  float y = ymin;
  for (int j = 0; j < height; j++) {
    // Start x
    float x = xmin;
    for (int i = 0; i < width; i++) {

      // Now we test, as we iterate z = z^2 + cm does z tend towards infinity?
      float a = x;
      float b = y;
      int n = 0;
      while (n < maxiterations) {
        float aa = a * a;
        float bb = b * b;
          // Infinty in our finite world is simple, let's just consider it 16
        if (a*a + b*b > 16.0) {
          break;  // Bail
        }
        
        float twoab = 2.0 * a * b;
        a = aa - bb  + ca;
        b = twoab + cb;
        n++;
      }

      // We color each pixel based on how long it takes to get to infinity
      // If we never got there, let's pick the color black
      if (n == maxiterations) {
        pixels[i+j*width] = color(0);
      } else {
        // Gosh, we could make fancy colors here if we wanted
        //pixels[i+j*width] = color(sqrt(float(n) / maxiterations));
        float hue  = sqrt(float(n) / maxiterations);
        pixels[i+j*width] = color(hue,255,255);
      }
      x += dx;
    }
    y += dy;
  }
  updatePixels();
  //println(frameRate);
}
/*
Mandelbrot Set and Julia Set Next to each other
Adding Color
Zooming by w value
Animation by ca and cb
*/
