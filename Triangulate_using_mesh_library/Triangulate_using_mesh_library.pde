import megamu.mesh.*;
void setup(){
  size(640, 480);
float[][] points = new float[3][2];

points[0][0] = 120; 
points[0][1] = 230; 
points[1][0] = 150; 
points[1][1] = 105; 
points[2][0] = 320; 
points[2][1] = 113; 

Delaunay d = new Delaunay( points );

float[][] myEdges = d.getEdges();

for(int i=0; i<myEdges.length; i++)
{
  float startX = myEdges[i][0];
  float startY = myEdges[i][1];
  float endX = myEdges[i][2];
  float endY = myEdges[i][3];
  line( startX, startY, endX, endY );
}


}
