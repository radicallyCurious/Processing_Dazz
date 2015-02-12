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
