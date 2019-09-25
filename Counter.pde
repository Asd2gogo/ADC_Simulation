class Counter{
 
  // Config for Counter
  
  int bitsAmount = 20;
  float gateTimems = 0;
  
  
  int count = 0;
    
 
  float  currentTimems = 0;
  float calculatedValue;
  
  Counter(float gateTimems){
  
    this.gateTimems = gateTimems;
    
  }
  
  
  
  boolean[] getBits(){
   
    boolean[] bitsArray = new boolean[bitsAmount];
    
    for(int x = 0; x < bitsAmount-1 ; x++){
      
      bitsArray[x] = (count & (1 << x)) != 0;
    
    }
    
    return bitsArray;
    
  }
  
  void setGateTime(float timeInMs){
   
    gateTimems = timeInMs;
    
  }
  
  float getGateTime(){
   return gateTimems; 
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
