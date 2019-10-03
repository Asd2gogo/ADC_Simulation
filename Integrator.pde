class Integrator {
  
  float r;
  float c;
  float tau;
  float capVoltage = 0;
  
 Integrator(float res, float cap){// in kOhm   in Mikro Fahrad
  r = res * pow(10, 3) ;
      c = cap * pow(10,-6);
 
 }
 
 
 void integrate(float inputVoltage, float time){   // in Volts and ms
 
   float current = inputVoltage/ r;
   float integrationTimems = time * pow(10,-3);
   
   
   float deltaU = (current / c) * integrationTimems; //  (I / C) * ▲t = ▲U 
   
   capVoltage = capVoltage + deltaU;
 
 
 }
 
 float getCapVoltage(){
   return capVoltage;
 }
 
 void shortCap(){
  capVoltage = 0; 
 }
 
 void setResitorValue(float value){
     r = value;
   
 }
 
  void setCapacitorValue(float value){
    
   c = value * pow(10,-9);
   
 }
  
  
  
}
