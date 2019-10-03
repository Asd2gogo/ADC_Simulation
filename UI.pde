class Ui{
  
    PApplet mainPApplet;
  
    int allPosx = 800;
    int allPosy = 20;
    
    int allySpacing = 40;
    
    int sliderWidth = 150;
    int sliderHeight = 40;
  
  //InputVoltageSlider
    int xPosInputVoltage = 0;
    
    int limitLowInputVoltage = 0;
    int limitHighInputVoltage = 10;
    
  //AnimationSpeedSlider
    int xPosAnimationSpeed = 0;
    
    int limitLowAnimationSpeed = 1;
    int limitHighAnimationSpeed = 100;
  //XAchseSkalierung
    int xPosGraphScale = 0;
    
    int limitLowGraphScale = 1;
    int limitHighGraphScale = 10;
    
  //XAchse Auflösung(skip some poin on graph)  nur jeden xten messwert anzeigen
    int xPosGraphResolution = 0;
    
    int limitLowGraphResolution = 1;
    int limitHighGraphResolution = 10;
    
  
   //R Widerstand OHM des Integrators -> Ladestrom  
    int xPosResistorValue = 0;
    
    int limitLowResistorValue = 100;
    int limitHighResistorValue = 500;
    
      
   //C Kondesator Nano Fahrad für den Integrator -> Ladezeit
    int xPosCapacitorValue = 0;
    
    int limitLowCapacitorValue = 100;
    int limitHighCapacitorValue = 500;
    
    
    
        //Counter Bits
    int xPosCounterBits = 0;
    
    int limitLowCounterBits = 2;
    int limitHighCounterBits = 10;
    
      //Gate Time in ms
    int xPosGateTime = 0;
    
    int limitLowGateTime = 100;
    int limitHighGateTime = 500;
    
    
    
    
    
    
  BlockDiagram myBlock;
  
  ArrayList<Slider> allConfigSlider;
  
 
  Ui(PApplet applet){
    
  mainPApplet = applet;
  
  allConfigSlider = new ArrayList<Slider>();
  
  myBlock = new BlockDiagram();
  
  setupSlider();
  
  
  }
  
  
 void update(){
  

   
 }
 
 void drawBlockDiagram(){
  
   myBlock.drawAll();
   
 }
 
 void setupSlider(){
  
   Slider inputVoltageSlider = new Slider(mainPApplet, "InputVoltage", allPosx, getYPos(0),getSliderWidth(), getSliderHeight(),limitLowInputVoltage, limitHighInputVoltage);
   allConfigSlider.add(inputVoltageSlider);
   
   Slider speedSlider = new Slider(mainPApplet, "AnimationSpeed", allPosx, getYPos(1) ,getSliderWidth(), getSliderHeight(),limitLowAnimationSpeed, limitHighAnimationSpeed);
   allConfigSlider.add(speedSlider);
   
   Slider scaleSlider = new Slider(mainPApplet, "xAchseSkalierung", allPosx, getYPos(2) ,getSliderWidth(), getSliderHeight(),limitLowGraphScale, limitHighGraphScale);
   allConfigSlider.add(scaleSlider);
   
   Slider resolutionSlider = new Slider(mainPApplet, "GraphAuflösung", allPosx, getYPos(3) ,getSliderWidth(), getSliderHeight(),limitLowGraphResolution, limitHighGraphResolution);
   allConfigSlider.add(resolutionSlider);
   
   Slider resistorSlider = new Slider(mainPApplet, "Widerstand", allPosx, getYPos(5) ,getSliderWidth(), getSliderHeight(),limitLowResistorValue, limitHighResistorValue);
   allConfigSlider.add(resistorSlider);
   
   Slider capacitorSlider = new Slider(mainPApplet, "Kondensator", allPosx, getYPos(6) ,getSliderWidth(), getSliderHeight(),limitLowCapacitorValue, limitHighCapacitorValue);
   allConfigSlider.add(capacitorSlider);
   
    Slider gateTimeSlider = new Slider(mainPApplet, "GateTimeNs", allPosx, getYPos(7) ,getSliderWidth(), getSliderHeight(),limitLowGateTime, limitHighGateTime);
   allConfigSlider.add(gateTimeSlider);
   
      Slider counterBitsSlider = new Slider(mainPApplet, "CounterBits", allPosx, getYPos(8) ,getSliderWidth(), getSliderHeight(),limitLowCounterBits, limitHighCounterBits);
   allConfigSlider.add(counterBitsSlider);
   
   
   
   for(Slider slider : allConfigSlider){
   slider.create();
   }
   
 }
 
 
 void drawCounterBitIndicator(boolean bits[]){
   
  for(int x = 0; x < bits.length; x++){
    
   
    drawBall(100 + (30*x), 400, bits[x]);
    
  }
   
 }
 
 
 void drawBall(int x, int y, boolean on){
  pushMatrix();
   translate(x, y);
   strokeWeight(2);
   
   if(on){
 
   fill(255,125, 125);
   }else{

   fill(0);
   }
   
   
   ellipse(0,0, 20,20);
   
  
   
 popMatrix();
   
 }
 
 float getSliderValue(String name){
  for(Slider slider : allConfigSlider){
    if(slider.getNameString().equals(name)){
      return slider.getValue();
    }
  }
  return 0;
   
 }
 
 int getYPos(int position){
  return position * allySpacing;
 }
 
 
 int getInputVoltageXPos(){
  return xPosInputVoltage + allPosx; 
 }
 

 
 
 
 


 int getSliderWidth(){
   return sliderWidth;
 }
 
 int getSliderHeight(){
  return sliderHeight; 
 }
 
 
 
  
  
}
