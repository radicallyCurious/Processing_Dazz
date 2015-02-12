//holds other functions for light_track

//create a function to track the brightest spot on the screen

void lightTracking(){
    
    if(cam.available()){
       //get data from camera
       cam.read();
       //load the pixels from the image of the camera
       cam.loadPixels();
       //create a variable to hold the brightest value possible
       float maxB = 0;
       //create a variable to hold the "name" of the brightest pixel
       int brightPix = 0;
       //loop through pixels and find the brightest one
       //cam.pixels.length refers to the amount of pixels...
       //...in the size of the window specified in...
       //...the Capture object "cam"
       for(int i = 0; i < cam.pixels.length; i++){
           //if the brightness of the pixel being looked at is...
           //...greater than the original brightness possible(0)...
           //...then set that to the greatest brightness possible...
           //...and then remember what pixel we found that out at
           if(brightness(cam.pixels[i]) > maxB){
               maxB = brightness(cam.pixels[i]);
               brightPix = i;
           }//end if
       }//end for
       
       //set x and y variables to the locatin of the brightest pixel
       x = brightPix % cam.width;
       y = brightPix / cam.width;
       
    }//end main if
    
    //draw image
    set(0, 0, cam);
    //set fill to a color
    fill(0, 255, 0);
    //draw circle to "track" brightest spot
    ellipse(x, y, random(10,20), random(10,20));
    ellipse(x+10, y+10, random(10,30), random(10,30));
    ellipse(x-10, y-10, random(5,10), random(5,10));
    ellipse(x-10, y+10, random(5,20), random(5,20));
    ellipse(x+10, y-10, random(10,30), random(10,30));
    

}//end lightTracking
