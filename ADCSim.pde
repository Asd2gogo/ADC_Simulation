import g4p_controls.*; //<>//
import grafica.*;



float inputVoltage = 4;
float timeStep = 0.0001;
boolean play = false;
float counter = 0.0;
int scriptTimer = 0;

// Graph inputVoltageConfig
float graphXLimMin = 0;
float graphXLimMax = 1;

Integrator myOp = new Integrator(0.1, 0.1);
Comparator myComparator = new Comparator(1);
Counter myCounter = new Counter(0.5);
Timer myTimer = new Timer();
GateTimePolygon myPolygonManager = new GateTimePolygon();

OutputGraph myOutGraph;


GPointsArray voltagePoints = new GPointsArray();




Ui myUi;
GPlot myPlot;
PImage myCircuitImage;


void setup() {


  size(1280, 1024);
  frameRate(60);

  myUi = new Ui(this);
  myOutGraph  = new OutputGraph(this);
  

  myCircuitImage = loadImage("ADC-Schaltplan.png");


  myPlot  = new GPlot(this);
  myPlot.setPointSize(0);
  myPlot.setXLim(0, 2);
  myPlot.setYLim(0, 1.5);
  myPlot.setDim(700, 200);
  myPlot.setTitleText("Integrator Voltage");
  //myPlot.addLayer("GateTime", myPolygonManager.getLatestPoly());
  myPlot.addLayer("VoltagePoints", voltagePoints);
  myPlot.addLayer("GateTime", myPolygonManager.getLatestPoly());
  
  myPlot.getLayer("VoltagePoints").setLineWidth(2);
  myPlot.getLayer("VoltagePoints").setLineColor(0);
  
  

  //myPlot.addPoints(voltagePoints);
}



void draw() {
  if (play || counter < 0.0001) {
    scriptTimer = millis();

    clear();
    background(200, 200, 200);


    updateSliderConfig();
    //inputVoltage = myUi.getSliderValue("InputVoltage");


    for (int x = 0; x < myUi.getSliderValue("AnimationSpeed"); x++) {

      checkGraphXSize();

      if (counter > graphXLimMax) {
        
        voltagePoints.removeRange(0, voltagePoints.getNPoints());

        graphXLimMax = graphXLimMax + (counter - graphXLimMin);
        graphXLimMin = counter;
      }


      myPlot.setXLim(graphXLimMin, graphXLimMax);


      myOp.integrate(inputVoltage, timeStep);
      myComparator.setInvertingInputVoltage(myOp.getCapVoltage());
      if (!myComparator.compare()) {
        myOp.shortCap();
        myCounter.count();
      }




      if (((floor(counter*1000)) % (floor(myUi.getSliderValue("GraphAuflösung")))) == 0) {

        voltagePoints.add(counter, myOp.getCapVoltage());
      }

      //println(myPlot.getPoints().getNPoints());  //Print amaout off points saved from graph
      myTimer.setTimeDeltaMs(timeStep);
      
      

      if (myTimer.isGateTimeExceeded()) {

        myOutGraph.addPoint(new GPoint(counter, myCounter.getSavedCount()));
        myPolygonManager.newPolygon();

        myTimer.resetTime();
        myCounter.saveCount();
        myCounter.resetCount();

        myOutGraph.addPoint(new GPoint(counter, myCounter.getSavedCount()));
        
        
        
      }

      myPolygonManager.updateLatestPoly(timeStep);
      
      
      counter = counter + timeStep;
      
    }
    
    
    
  

    myPlot.getLayer("VoltagePoints").setPoints(voltagePoints);

      drawMainPlot();
    //myPlot.defaultDraw();
    
    

    
    //myUi.drawBlockDiagram();
    
     showCircuitDiagram();
     myUi.drawCounterBitIndicator(myCounter.getBits(), 660, 507);
     myUi.drawCounterBitIndicator(myCounter.getSavedBits(), 660, 340);
     myOutGraph.display();
   

    println("Runtime =  " + (millis()- scriptTimer));
   
  }
}


void checkGraphXSize() {

  graphXLimMax = floor(myUi.getSliderValue("xAchseSkalierung")) + graphXLimMin; //Xachse nach einstelltem Wert auf slider skalieren (time delta)
}


void updateSliderConfig() {

  inputVoltage = myUi.getSliderValue("InputVoltage");
  myOp.setResitorValue(floor(myUi.getSliderValue("Widerstand")));
  myOp.setCapacitorValue(floor(myUi.getSliderValue("Kondensator")));
  myTimer.setGateTime(myUi.getSliderValue("GateTimeNs"));
  myCounter.setBits(floor(myUi.getSliderValue("CounterBits")));
}

void showCircuitDiagram() {

  image(myCircuitImage, 0, 270);
  drawLoadingBar(myTimer.getGateTimePercent(), 880, 667, 100);
  
  
}

void drawLoadingBar(float step, int xPos, int yPos, float barWidth){

  strokeWeight(6);
  println((barWidth * (step/100 )));
  line(xPos, yPos, xPos + (barWidth * (step/100 ))  ,yPos);
 

}


public void handleButtonEvents(GButton button, GEvent event) {

  play = !play;
}

void drawRects(){
 
 for (GPointsArray array : myPolygonManager.getArrays()){
   
   myPlot.getLayer("GateTime").drawPolygon(array, myPolygonManager.getColor(myPolygonManager.getArrays().indexOf(array)%18));
   
 }
 
  
  
}


void drawMainPlot(){
  
    myPlot.beginDraw();
    myPlot.drawBackground();
    myPlot.drawBox();
    myPlot.drawXAxis();
    myPlot.drawYAxis();
    myPlot.drawTopAxis();
    myPlot.drawRightAxis();
    myPlot.drawTitle();
    drawRects();
    myPlot.getLayer("VoltagePoints").drawLines();
  
    
    myPlot.endDraw();
}
