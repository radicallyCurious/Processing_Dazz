//Luc Pitre<pitreluc@gmail.com>
//12 February 2015
//purpose: table data play

//declare an object of class Table
Table table;
//declare a second object of the class Table
Table data;
//row counter
int numRows = 0;



void setup(){
    
    //set the size of the window
    size(640, 480);
    //set the initial color of the background
    background(255);
    
    //define the  object of class Table
    table = new Table();
    //add columns to the table
    table.addColumn("id");
    table.addColumn("Xpos");
    table.addColumn("Ypos");
    
    textWrite();
    
    
    
    
}//end setup

void draw(){
    
    //set color of the inside of shapes
    fill(255, 0, 0);
    //turn off the outlines of shapes
    noStroke();
    
    
    
    //if we press the mouse...
    //create an ellipse and write the position of it to the table
    if(mousePressed){
        //create an ellipse
        ellipse(mouseX, mouseY, 16, 16);
        //write the x position and y position of the ellipse to the table
        for(int i = 1; i > numRows; i--){
        TableRow newRow_i = table.addRow();
        newRow_i.setInt("id", table.getRowCount()-1);
        newRow_i.setFloat("Xpos", mouseX );
        newRow_i.setFloat("Ypos", mouseY);
        
        }
    }
    
}//end draw

//create a function that uses the data we just wrote
void dataVis(){
    
    data = loadTable("mouseData.csv", "header");
    
    println(table.getRowCount() + " = total rows in table");
    //draw outlines of shapes only with noFill
    noFill();
    //set the color of the outlines of shapes
    stroke(0, 0, 255);
    //set the thickness of the outlines of shapes
    strokeWeight(5);
    //search through table data...
    //...collect and store the data in variables...
    //...create ellipses that are in the inverse positions of those stored in the table
    for(TableRow row : table.rows()){
        int id = row.getInt("id");
        float xp = row.getFloat("Xpos");
        float yp = row.getFloat("Ypos");
        //use the absolute value function['abs()']...
        //...if we subtract 640 from say 200, we would end up with -440 as an x position...
        //...that would not show up on our screen...
        //using the 'abs()' function allows us to keep the positions of our ellipses...
        //...inside of our window view
        ellipse(abs(xp-width), abs(yp-height), 16, 16);
    }//end for
    
}//end dataVis

void textWrite(){
    //create string variables that hold desired text
    String s1 = "Key Functionality:";
    String s2 = "s = save";
    String s3 = "x = exit the program";
    String s4 = "e = erase the screen";
    String s5 = "l = load data, and do something";
    
    fill(0);
    
    //set the size of the text
    textSize(13);
    text(s1, 10, 10);
    text(s2, 10, 25);
    text(s3, 10, 40);
    text(s4, 10, 55);
    text(s5, 10, 70);
    
    noFill();
    stroke(0);
    strokeWeight(2);
    rect(0, 0, 230, 80);
}//end textWrite

//setup key events
void keyPressed(){
    
    //if we press the s key then save the table
    if(key == 's'){
        saveTable(table, "mouseData.csv");
    }//end s if
    
    //if we press the x key, then exit the program
    if(key == 'x'){
        exit();
    }//end x if
    
    //if we press the l key, load the dataVis function
    if(key == 'l'){
        dataVis();
    }//end r if
    
    //if we press the e key, set scren to white, erasing all visuals
    if(key == 'e'){
        background(255);
        //replace text that is erased
        textWrite();
    }//end e if
}//end keyPressed
