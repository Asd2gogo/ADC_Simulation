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
    int limitHighAnimationSpeed = 50;
  //XAchseSkalierung
    int xPosGraphScale = 0;
    
    int limitLowGraphScale = 1;
    int limitHighGraphScale = 10;
    
  //XAchse Auflösung(skip some poin on graph)  nur jeden xten messwert anzeigen
    int xPosGraphResolution = 0;
    
    int limitLowGraphResolution = 1;
    int limitHighGraphResolution = 10;
    
    
    
    
    
  
  ArrayList<Slider> allConfigSlider;
  
 
  Ui(PApplet applet){  
  mainPApplet = applet;
  allConfigSlider = new ArrayList<Slider>();
 
  setupSlider();
  
  
  }
  
  
 void update(){
  

   
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
   
   
   
   for(Slider slider : allConfigSlider){
   slider.create();
   }
   
 }
 
 
 void drawCounterBitIndicator(boolean bits[]){
   
  for(int x = 0; x < bits.length; x++){
   
    drawBall(100 + (30*x), 400, bits[x]);
    
  }
   
    println();
   
 }
 
 
 void drawBall(int x, int y, boolean on){
  pushMatrix();
   translate(x, y);
   strokeWeight(2);
   
   if(on){
     print("on ");
   fill(255,125, 125);
   }else{
     print("off ");
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
