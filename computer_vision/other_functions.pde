//holds other functions for CV play around

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
       
       //set x and y variables to the location of the brightest pixel
       x = brightPix % cam.width;
       y = brightPix / cam.width;
       
    }//end main if
    
    //draw image
    image(cam, 0, 0);
    //set fill to a color
    fill(0, 255, 0);
    //draw circle to "track" brightest spot
    ellipse(x, y, random(10,20), random(10,20));
    ellipse(x+10, y+10, random(10,30), random(10,30));
    ellipse(x-10, y-10, random(5,10), random(5,10));
    ellipse(x-10, y+10, random(5,20), random(5,20));
    ellipse(x+10, y-10, random(10,30), random(10,30));
    

}//end lightTracking

//create a function that will paint the screen white where the brightest pixel is

void lightPainting(){
  int counter = 0;
  //if there is a camera ready to use
  if(cam.available()){
    //start it, and get data from it
    cam.read();
    //load its pixels
    cam.loadPixels();
    loadPixels();
    //find the brightest pixel
    for(int i = 0; i < cam.pixels.length; i++){
      if(brightness(cam.pixels[i]) > 200){
        pixels[i] = color(255);
      }//end if
          else if(brightness(cam.pixels[i]) > 150){
        pixels[i] = color(200);
      }//end else if
      else if(brightness(cam.pixels[i]) > 100){
        pixels[i] = color(50);
      }//end else if
      else if(brightness(cam.pixels[i]) > 50){
        pixels[i] = color(25);
      }//end else if
    }//end for
  }//end if
  
  if(keyPressed && key == 'b'){
    for(int i = 0; i < cam.pixels.length; i++){
      pixels[i] = color(0);
    }
  }
  
  
  
  background(0);
  updatePixels();

  
}//end lightPainting
