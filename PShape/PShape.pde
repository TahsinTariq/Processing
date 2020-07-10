PShape p;
void setup(){
  size(640,480);
  background(255);
  p.beginShape();
  for (int i = 0; i<7; i++){
  p.vertex(10*i,random(50));
  }
  p.endShape();
  
  
}

void draw(){
  background(255);
  shape(p,0,0);

}
/**
 * Determine if a point is in a polygon, given by a list of its vertices.
 * 
 * @param s     PShape
 * @param point PVector point to check
 * @return boolean
 */
private static final boolean pointInPoly(PShape s, PVector point) {

  boolean within = false;
  int j = s.getVertexCount() - 1;

  for (int i = 0; i < s.getVertexCount(); i++) {
    final PVector v = s.getVertex(i);
    final PVector b = s.getVertex(j);
    if (((v.y > point.y) != (b.y > point.y)) && (point.x < (b.x - v.x) * (point.y - v.y) / (b.y - v.y) + v.x)) {
      within = !within;
    }
    j = i;
  }
  return within;
}
