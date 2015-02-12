//Luc Pitre<pitreluc@gmail.com>
//12 February 2015
//purpose: holds longer function of compVision_interactive.pde to make it look neater ;)

//*variables*
//next two variables determine whether we will track for light or dark spot
int dark = 50;//use in lightTracking -- var(2)
int light = 200;//use in lightTracking -- var(1)
//x and y hold positions for tracking
float Bx,By;

//lightTracking BEGIN
//controls the detection of the brightest or darkest spot on the screen

void lightTracking(){
    
    //check if there is a camera available/on
    if(vid.available()){
        //get data from camera
        vid.read();
        //load the pixel values being sent by the camera
        vid.loadPixels();
        //create variable that holds the maximum brightness found
        float maxB = 0;
        //create a variable to hold the "name" of the brightest pixel
        int brightPix = 0;
        //loop through pixels and find the brightest one
       //cam.pixels.length refers to the amount of pixels...
       //...in the size of the window specified in...
       //...the Capture object "cam"
       for(int i = 0; i < vid.pixels.length; i++){
           //if the brightness of the pixel being looked at is...
           //...greater than the original brightness possible(0)...
           //...then set that to the greatest brightness possible... 
           //...and then remember what pixel we found that out at
           if(brightness(vid.pixels[i]) > maxB){
               maxB = brightness(vid.pixels[i]);
               brightPix = i;
           }//end if
       }//end for
       
       //set x and y variables to the locatin of the brightest pixel
       Bx = brightPix % vid.width;
       By = brightPix / vid.width;
       
       }//end available check if
       
    
    //draw image
    set(0, 0, vid);
    //set shapes to have no inner color
    noFill();
    //set color of shape outline
    stroke(255, 0, 0);
    //set thickness of outline
    strokeWeight(2);
    //draw rectangle to "track" brightest spot
    ellipse(Bx, By, 16, 16);
    //ellipse(Bx, By, 8, 8);
    //ellipse(Bx, By, 4, 4);
    ellipse(Bx, By, 2, 2);
        
}
//lightTracking END
