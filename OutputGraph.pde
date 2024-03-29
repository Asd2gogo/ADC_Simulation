class OutputGraph{
  
    PApplet myApplet;
 
    GPlot myPlot;
    GPointsArray points = new GPointsArray();
  
  OutputGraph(PApplet pApplet){
    myApplet = pApplet;
    
    myPlot = new GPlot(myApplet);
  
    myPlot.setTitleText("OutputValues");
    myPlot.setPos(0, 680);
     myPlot.setDim(700, 200);
    myPlot.setPointSize(0);
    myPlot.getYAxis().setAxisLabelText("Count");
    
  }
  
  
  void addPoints(){
    
  }
  
  void addPoint(GPoint point){
      points.add(point);
    
  }
  
  void reset(){
    
    points.removeRange(0, points.getNPoints()-1);
    
  }
  
  
  void display(){
    
    myPlot.setPoints(points);
  
    myPlot.defaultDraw();
  }
  
  
}
