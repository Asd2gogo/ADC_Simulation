class Comparator {

  float nonInvertingInputVoltage;
  float invertingInputVoltage = 0;

  Comparator(float refrenceVoltage) {
    nonInvertingInputVoltage = refrenceVoltage;
  }

  void setInvertingInputVoltage(float voltage) {
    invertingInputVoltage = voltage;
  }

  boolean compare() {
    if (nonInvertingInputVoltage > invertingInputVoltage) {
      return true;
    } else {
      return false;
    }
  }
}
