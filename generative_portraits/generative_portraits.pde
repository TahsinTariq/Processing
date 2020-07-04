import gab.opencv.*;
import java.awt.*;
PImage img,temp, dst;
OpenCV opencv;
Rectangle[] faces;
ArrayList<Contour> contours;
ArrayList<Contour> polygons;
void setup(){
	size(800, 800);
	img = loadImage("shaan.jpg");
	opencv = new OpenCV(this, img);
	opencv.loadCascade(OpenCV.CASCADE_FRONTALFACE);
	opencv.loadImage(img);
	faces = opencv.detect();
	println(faces.length);
	for (Rectangle o : faces) {
		println("faces: "+o);
	}
	temp = createImage(faces[1].width,faces[1].height , RGB);
	temp.loadPixels();
	for (int j = faces[1].x; j < faces[1].x+faces[1].width; ++j) {
		for (int i = faces[1].y; i < faces[1].height; ++i) {
			int loc = j + i* temp.width;
			temp[loc] = img.pixels[index];
		}
	}
	opencv.gray();
	opencv.threshold(70);
	dst = opencv.getOutput();
	contours = opencv.findContours();
}

void draw(){
	scale(.5);
	image(img, 0, 0);
	image(dst, img.width, 0);
	image(temp,0, img.height);
	// for (int i = 0; i < faces.length; i++) {
	// 	rect(faces[i].x, faces[i].y, faces[i].width, faces[i].height);
	// }
	// image(dst, img.width, 0);

	// noFill();
	strokeWeight(3);

	for (Contour contour : contours) {
		stroke(0, 255, 0);
		contour.draw();

		stroke(255, 0, 0);
		beginShape();
		for (PVector point : contour.getPolygonApproximation().getPoints()) {
			vertex(point.x, point.y);
		}
		endShape();
	}
}
