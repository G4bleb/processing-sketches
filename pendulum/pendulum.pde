static class Point {
  float Xpos, Ypos, speed, theta, theta0, thetaAccel, thetaSpeed;
    static int radius = 15;

  Point(float initTheta) {
    theta0 = initTheta;
    theta = initTheta;
    Xpos = 0;
    Ypos = 0;
    speed = 0;
  }
}

float theta0 = PI/2;
float gravity = 0.0005;
Point[] arrayPoint = new Point[5];
int pendulumRadius = 100;

void setup() {
  size(800, 600);

  for (int i=0; i<arrayPoint.length; i++) {
    arrayPoint[i] = new Point(theta0+i*0.13);
  }

  for (int i=0; i<arrayPoint.length; i++) {
    background(200);
    translate(width/2, 5);
    line(0, 0, arrayPoint[i].Xpos, arrayPoint[i].Ypos);
    ellipse(arrayPoint[i].Xpos, arrayPoint[i].Ypos, Point.radius, Point.radius);
  }
}

void draw() {
  background(200);
  translate(width/2, 5);

  for (int i=0; i<arrayPoint.length; i++) {

    //if(i!=0){ellipse(arrayPoint[i-1].Xpos, arrayPoint[i-1].Ypos, Point.radius, Point.radius);}

    arrayPoint[i].thetaAccel = -1*gravity*sin(arrayPoint[i].theta);
    arrayPoint[i].thetaSpeed += arrayPoint[i].thetaAccel;
    arrayPoint[i].thetaSpeed *= 0.9955;
    arrayPoint[i].theta += arrayPoint[i].thetaSpeed;

    arrayPoint[i].Xpos = sin(arrayPoint[i].theta)*pendulumRadius;
    arrayPoint[i].Ypos = sin(PI/2 - arrayPoint[i].theta)*pendulumRadius;

    line(0, 0, arrayPoint[i].Xpos, arrayPoint[i].Ypos);
    ellipse(arrayPoint[i].Xpos, arrayPoint[i].Ypos, Point.radius, Point.radius);

    translate(arrayPoint[i].Xpos, arrayPoint[i].Ypos);
  }
}