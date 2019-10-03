import g4p_controls.*; //<>//
import grafica.*;



float inputVoltage = 4;
float timeStep = 0.0001;
float counter = 0.0;
int scriptTimer = 0;

// Graph inputVoltageConfig
float graphXLimMin = 0;
float graphXLimMax = 1;

Integrator myOp = new Integrator(0.1, 0.1);
Comparator myComparator = new Comparator(1);
Counter myCounter = new Counter(0.5);
Timer myTimer = new Timer();
OutputGraph myOutGraph;

GPointsArray voltagePoints = new GPointsArray();
GPointsArray gateTimePoints = new GPointsArray();


Ui myUi;
GPlot myPlot;


void setup() {


  size(1200, 700);
  frameRate(60);
  
  myUi = new Ui(this);
  myOutGraph  = new OutputGraph(this);


  myPlot  = new GPlot(this);
  myPlot.setPointSize(0);
  myPlot.setXLim(0, 2);
  myPlot.setYLim(0, 1.5);
  myPlot.setDim(700, 200);
  myPlot.setTitleText("Integrator Voltage");

  myPlot.addPoints(voltagePoints);
}



void draw() {
  scriptTimer = millis();

  clear();
  background(200, 200, 200);
  
  updateSliderConfig();
  //inputVoltage = myUi.getSliderValue("InputVoltage");


  for (int x = 0; x < myUi.getSliderValue("AnimationSpeed"); x++) {

    checkGraphXSize();

    if (counter > graphXLimMax) {

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

    // println(myPlot.getPoints().getNPoints() / counter);


    //println(myPlot.getPoints().getNPoints());  //Print amaout off points saved from graph
    myTimer.setTimeDeltaMs(timeStep);
    
    if(myTimer.isGateTimeExceeded()){
      
      myOutGraph.addPoint(new GPoint(counter, myCounter.getSavedCount()));
     
      myTimer.resetTime();
      myCounter.saveCount();
      myCounter.resetCount();
      
      myOutGraph.addPoint(new GPoint(counter, myCounter.getSavedCount()));
      
    }

    counter = counter + timeStep;
     
  }
  myPlot.defaultDraw();
  myPlot.setPoints(voltagePoints);
 

  myUi.drawCounterBitIndicator(myCounter.getBits());
  //myUi.drawBlockDiagram();
  myOutGraph.display();
  
  println("Runtime =  " + (millis()- scriptTimer));
}


void checkGraphXSize() {

  graphXLimMax = floor(myUi.getSliderValue("xAchseSkalierung")) + graphXLimMin; //Xachse nach einstelltem Wert auf slider skalieren (time delta)
}


void updateSliderConfig(){
  
      inputVoltage = myUi.getSliderValue("InputVoltage");
      myOp.setResitorValue(floor(myUi.getSliderValue("Widerstand")));
      myOp.setCapacitorValue(floor(myUi.getSliderValue("Kondensator")));
      myTimer.setGateTime(myUi.getSliderValue("GateTimeNs"));
      myCounter.setBits(floor(myUi.getSliderValue("CounterBits")));
}
