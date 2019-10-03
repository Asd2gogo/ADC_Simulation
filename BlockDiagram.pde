class BlockDiagram{
  
  
  ArrayList<Figure> myFigures = new ArrayList();
 
  BlockDiagram(){
    
    myFigures.add(new Figure("Resistor"));
    myFigures.add(new Figure("Capacitor"));
      setupFigures();
      
    
    
  }
  
  void drawAll(){
   
    draw("Resistor", 400, 200);
    draw("Capacitor", 450, 200);
    
  }
  
  
  void draw(String figure, float xPos, float yPos){

    pushMatrix();
    
    translate(xPos, yPos);
    for(Line l : getFigure(figure).getLines()){
     
      line(l.getxStart(), l.getyStart(), l.getxEnd(), l.getyEnd());
      
    }
    
    
    popMatrix();
    
   
    
    
    
  }
  
 Figure getFigure(String name){
    
   for(Figure f : myFigures){
    
     if(f.getName().equals(name)){
       return f;
     }
     
   }
   
   return null;
   
  }
  
  
  

void setupFigures(){
 
  Figure rF = getFigure("Resistor");
  
    rF.addLine(new Line(0,0,10,0));
    rF.addLine(new Line(10,4,10,-4));
    rF.addLine(new Line(10,4,50,4));
    rF.addLine(new Line(10,-4,50,-4));
    rF.addLine(new Line(50,4,50,-4));
    rF.addLine(new Line(50,0,60,0));
    
  
 



  Figure cF = getFigure("Capacitor");
  
    cF.addLine(new Line(0,0,10,0));
    cF.addLine(new Line(10,20,10,-20));
    cF.addLine(new Line(20,20,20,-20));
    cF.addLine(new Line(20,0,30,0));
    
  
 
}

}





class Line{

  float xStart;
  float yStart;
  float xEnd;
  float yEnd;
  
  
  Line(float xStart, float yStart, float xEnd, float yEnd){
    
    this.xStart = xStart;
    this.yStart = yStart;
    this.xEnd = xEnd;
    this.yEnd = yEnd;
  }
  
  float getxStart(){
   return xStart; 
  }
  
   float getyStart(){
   return yStart; 
  }
  
   float getxEnd(){
   return xEnd; 
  }
  
   float getyEnd(){
   return yEnd; 
  }
  
  

}

class Figure{
  
   String name;
  ArrayList<Line> myLines;
  
  Figure(String name){
    this.name = name;
    myLines = new ArrayList<Line>();
    
  }
  
  void addLine(Line line){
    
    myLines.add(line);
       
  }
  
  String getName(){
    
   return name; 
  }
  
  ArrayList<Line> getLines(){
   return myLines; 
  }
  
  
}
