class GateTimePolygon{
  
  color[] colors = {
  #FF6666,
  #FF6633,
  #FFFF66,
  #66FF66,
  #66CCCC,
  #00FFFF,
  #3399FF,
  #9966FF,
  #FF66FF,
  #990000,
  #993300,
  #CC9900,
  #006600,
  #336666,
  #0033FF,
  #000099,
  #660099,
  #990066,
  };
  
  
  
 float rectHeight = 1; // Obere Kante des Rechtecks im Diagramm (die Spannung auf der Y Achse)
  
  ArrayList<GPointsArray> myGateTimePointArrays = new ArrayList();
 
  
  int latestPolyIndex = 0;
  
 GateTimePolygon(){
   
   addRectToList(0,0);
   
   
 }
 
 
 
 void addRectToList(float x1, float x2){
   
    GPointsArray pointArray = new GPointsArray();
    pointArray.add(x1, 0);
    pointArray.add(x1, rectHeight);
    pointArray.add(x2, rectHeight);
    pointArray.add(x2, 0);
  
   myGateTimePointArrays.add(pointArray);
   
   
 }
 
 void setRectInList(int index,float x1 , float x2 ){
   

 }
 
 void newPolygon(){
   
   GPointsArray latestArray = getLatestPoly();
   
   addRectToList(latestArray.getX(3), latestArray.getX(3));
   
 }
 
  void changeRectSecondEdge(int index, float x2){
  
   
 }
 
 GPointsArray getLatestPoly(){
   
   return myGateTimePointArrays.get(myGateTimePointArrays.size()-1);
   
   
 }
 
 void updateLatestPoly(float timeStepMs){
  
   GPointsArray array = myGateTimePointArrays.get(myGateTimePointArrays.size()-1);
   
   array.setXY(2, array.getX(2) + timeStepMs , rectHeight);
   array.setXY(3, array.getX(2) + timeStepMs , 0);
 }
 
 
 ArrayList<GPointsArray> getArrays(){
   
  return  myGateTimePointArrays;
 }
 
 color getColor(int index){
   
   return colors[index];
   
 }
  
  
}
