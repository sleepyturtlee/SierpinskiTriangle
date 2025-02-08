public int coolLength = 0;
public int R = 120;
public int G = 217;
public int B = 255;
public int colorChange = 1;

public void setup()
{
  size(800, 800);
  background(0);
}
public void draw()
{
  background(0);
  sierpinski(0, height, coolLength);
  // make a limit on what R, G, and B can be so that it can only range from blue to pink
  // pink = 255, 120, 145
  // blue = 120, 217, 255;
  // blue
  System.out.println(R + " " + G + " " + B);
  if(R < 120) {
    R = 255;
  }
  if(G > 217) {
    G = 217;
  }
  if(B > 255) {
    B = 255;
  }
  // pink
  if(R > 255) {
    R = 255;
  }
  if(G < 120) {
    G = 120;
  }
  if(B < 145) {
    B = 145;
  }
}

public void mouseDragged() //optional
{
  if(mousePressed == true) {
    coolLength = mouseX;
  }
  if(mouseX >= pmouseX) {
    // turn pink
    R += colorChange;
    G -= colorChange;
    B -= colorChange;
  }
  if(mouseX <= pmouseX) {
      // turn blue
    R -= colorChange;
    G += colorChange;
    B += colorChange;
  }
}
public void sierpinski(int x, int y, int len) 
{
  // base case
  if(len <= 20) {
    fill(R, G, B);
    triangle(x, y, x+len/2, y-len, x+len, y);
  } else {
    sierpinski(x, y, len/2);
    sierpinski(x+len/2, y, len/2);
    sierpinski(x+len/4, y-len/2, len/2);
  }
}
