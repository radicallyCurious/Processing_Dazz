//Luc Pitre<pitreluc@gmail.com>
//12 February 2015
//playing around with reading/writing to files

//create an object of the PrintWriter class
PrintWriter data;

void setup(){
    
    size(640, 480);
    background(0);
    
    //create a file named things.txt
    data = createWriter("things.txt");
    
}//end setup

void draw(){
    
    //place a point where the mouse is
    point(mouseX, mouseY);
    //write a line to the file when mouse is pressed
    if(mousePressed){
        data.println("X: " + mouseX + " ||| Y: " + mouseY);
    }
    
}//end draw

//when we press a key, write data to file and close program
void keyPressed(){
    //write any remaining data
    data.flush();
    //close the file attached to the data object
    data.close();
    //exit the program entirely
    exit();
}//end keyPressed
