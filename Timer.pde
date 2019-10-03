


class Timer{
  
  float timeMs;
  float gateTimeMs;

  
 
  Timer(){
   
    
  }
    
  
  
  void setTimeDeltaMs(float delta){
   
    timeMs = timeMs + delta;
    
  }
  
  boolean isGateTimeExceeded(){
   
    if(timeMs >= gateTimeMs){
       return true;
    }else{
      return false;
    }
    
  }
  
  void resetTime(){
    
     timeMs = 0; 
  }
  
  float getTime(){
   return timeMs; 
  }
  
  void setGateTime(float time){
     gateTimeMs = time/1000;
  }
  
}
