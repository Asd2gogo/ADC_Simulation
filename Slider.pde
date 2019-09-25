class Slider{
  
  int xLabelSpacing = 150;
  
  String name;
  int position;
  int xPos;
  int yPos;
  int sliderWidth;
  int sliderHeight;
  int limitLow;
  int limitHigh;
  PApplet applet;
  GSlider slider;
  GLabel label;
  
 Slider(PApplet applet,String name, int xPos, int yPos, int sliderWidth, int sliderHeight, int limitLow, int limitHigh){
   this.name = name;
   this.xPos = xPos;
   this.yPos = yPos;
   this.sliderWidth = sliderWidth;
   this.sliderHeight = sliderHeight;
   this.limitLow = limitLow;
   this.limitHigh = limitHigh;
   this.applet = applet;
 }
   
 
 
 void create(){
  slider = new GSlider(applet, xPos, yPos, sliderWidth, sliderHeight, 12);
   slider.setLimits(limitLow, limitHigh);
   slider.setShowValue(true);
   slider.setShowLimits(true);
  slider.setEasing(5);
  
  label = new GLabel(applet, xPos + xLabelSpacing, yPos, 200, 50, name );
   
 }
 
 float getValue(){
 return slider.getValueF();
 }
 
 String getNameString(){
   return name;
 
 }
  
  
  
}
