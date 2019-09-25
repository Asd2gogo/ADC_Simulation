import g4p_controls.*;
import grafica.*;



float inputVoltage = 4;
float timeStep = 0.001;
float counter = 0.0;
int scriptTimer = 0;

// Graph inputVoltageConfig
float graphXLimMin = 0;
float graphXLimMax = 1;

Integrator myOp = new Integrator(0.5, 1);
Comparator myComparator = new Comparator(1);
Counter myCounter = new Counter(4);

GPointsArray voltagePoints = new GPointsArray();
 GPointsArray gateTimePoints = new GPointsArray();


Ui myUi;



GPlot myPlot;

void setup(){
  
  
  size(1200,500);
  frameRate(60);
  myUi = new Ui(this);
  

  
  
 myPlot  = new GPlot(this);
 myPlot.setPointSize(0);
 myPlot.setXLim(0,2);
 myPlot.setYLim(0,1.5);
 myPlot.setDim(700,200);
 
 myPlot.addPoints(voltagePoints);
 
 

 
}



void draw(){
  scriptTimer = millis();
    
 clear();
 background(200, 200, 200);
 
 
   for(int x = 0; x < myUi.getSliderValue("AnimationSpeed"); x++){
     
  checkGraphXSize();
    
  if(counter > graphXLimMax){
    
   graphXLimMax = graphXLimMax + (counter - graphXLimMin);
   graphXLimMin = counter;
   
  }

 
     myPlot.setXLim(graphXLimMin,graphXLimMax);
 
  
 
  inputVoltage = myUi.getSliderValue("InputVoltage");
  
 
    
  myOp.integrate(inputVoltage,timeStep);
  myComparator.setInvertingInputVoltage(myOp.getCapVoltage());
  if(!myComparator.compare()){
    myOp.shortCap();
    myCounter.count();
   
   
   
  }
  



  if(((floor(counter*1000)) % (floor(myUi.getSliderValue("GraphAuflösung")))) == 0){
    
    voltagePoints.add(counter, myOp.getCapVoltage());
   
    
  }
   
  // println(myPlot.getPoints().getNPoints() / counter);
  

  //println(myPlot.getPoints().getNPoints());  //Print amaout off points saved from graph
  myCounter.setTimeDeltams(timeStep);
   counter = counter + timeStep;
  
   }
   myPlot.setPoints(voltagePoints);
   myUi.drawCounterBitIndicator(myCounter.getBits());
   
   
    //<>//
   
  
   
   //println("Spannung" + myCounter.getLastCount());
   
   
  
}


void checkGraphXSize(){
  
  graphXLimMax = floor(myUi.getSliderValue("xAchseSkalierung")) + graphXLimMin; //Xachse nach einstelltem Wert auf slider skalieren (time delta)
  
}
