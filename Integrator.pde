class Integrator {
  
  float r1;
  float c;
  float tau;
  float capVoltage = 0;
  
 Integrator(float res, float cap){// in kOhm   in Mikro Fahrad
   r1 = res * pow(10, 3);
   c = cap * pow(10,-6);
   tau = r1 * c;
   
 
 }
 
 
 void integrate(float inputVoltage, float time){   // in Volts and ms
 
   float current = inputVoltage/ r1;
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
  
  
  
}
