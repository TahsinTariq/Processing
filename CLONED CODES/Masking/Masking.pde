PGraphics img, mas;
void setup(){
    size(640,480);
    img = createGraphics(width, height);
    mas = createGraphics(width, height);
    
}
void draw(){
    background(255,0,0);
    img.beginDraw();
    img.background(0,255, 0);
    img.ellipse(mouseX, mouseY, 10,20);
    img.endDraw();
    mas.beginDraw();
    mas.noStroke();
    mas.circle(width/2, height/2, min(width, height));
    mas.endDraw();
    img.mask(minAlphas(img, mas));
    
    image(img, 0,0);
}

int[] minAlphas(PGraphics img,PGraphics img2){
    img.loadPixels();
    img2.loadPixels();
    int[] a = new int[img.pixels.length];
    for (int i = 0; i< img.pixels.length; i++){
        a[i]= min(img.pixels[i] >> 24 & 0xFF, img2.pixels[i] >> 24 & 0xFF);
    }
    return a;
}
