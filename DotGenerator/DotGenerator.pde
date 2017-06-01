Dot[] dots;
PImage img;

public static final int dotSize = 3;
public static final int gen     = 100000;

static int[] pallet_r = {
      0,  39,   0,  71, 143, 171, 167, 127,  67,   0, 
      0,   0,  27, 117,   0,  35, 131, 191, 231, 219, 
    203, 139,   0,   0,   0,   0, 188,  63,  95, 167, 
    247, 255, 255, 255, 243, 131,  79,  88,   0, 255, 
    171, 199, 215, 255, 255, 255, 255, 255, 227, 171, 
    179, 159
};

static int[] pallet_g = {
      0,  27,   0,   0,   0,   0,   0,  11,  47,  71, 
     81,  63,  63, 117, 115,  59,   0,   0,   0,  43, 
     79, 115, 151, 171, 147, 131, 188, 191, 115, 139, 
    123, 119, 119, 155, 191, 211, 223, 248, 235, 255, 
    231, 215, 203, 199, 199, 191, 219, 231, 255, 243, 
    255, 255
};
static int[] pallet_b = {
      0, 143, 171, 159, 119,  19,   0,   0,   0,   0, 
      0,  23,  95, 117, 239, 239, 243, 191,  91,   0, 
     15,   0,   0,   0,  59, 139, 188, 255, 255, 253, 
    255, 183,  99,  59,  63,  19,  75, 152, 219, 255, 
    255, 255, 255, 255, 219, 179, 171, 163, 163, 191, 
    207, 243
};

void setup(){
    size(200, 200);
    dots           = new Dot[gen];
    img            = loadImage("Serval.jpg");
    noStroke();
    
    surface.setResizable(true);
    surface.setSize(img.width, img.height);
    
    background(0xFF); 
    image(img, 0, 0);
  
    for(int i = 0; i < img.width / dotSize; i++){
        for(int j = 0; j < img.height / dotSize; j++){
            dots[i + (j * img.width / dotSize)] = new Dot(i * dotSize, j * dotSize, dotSize);
        }
    }
}

void draw(){
  loadPixels();
    for(int i = 0; i < img.width / dotSize; i++){
        for(int j = 0; j < img.height / dotSize; j++){
            dots[ i + (j * img.width / dotSize)].draw();
        }
    }
    updatePixels();
}
void keyPressed(){
    if( key == ENTER ){ 
        save("output.png");
    }
    else{
    }
}