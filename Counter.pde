class Counter{
 
  int count = 0;
  float gateTimems = 0;
  float  currentTimems = 0;
  float calculatedValue;
  
  Counter(float gateTimems){
  
    this.gateTimems = gateTimems;
    
  }
  
  void count(){
   count++; 
  }
  
  void setTimeDeltams(float deltaTimems){
   currentTimems = currentTimems + deltaTimems; 
   
   if(currentTimems >= gateTimems){
     currentTimems = 0;
     
     calculatedValue = count;
     count = 0;
     
    }

  }
  
  float getLastCount(){
   return calculatedValue; 
  }
  
  
  
}
