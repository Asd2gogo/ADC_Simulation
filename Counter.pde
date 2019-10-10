class Counter {

  // Config for Counter

  int bitsAmount = 5;
  float gateTimems = 0;



  int count = 0;


  float  currentTimems = 0;
  int savedCount = 0;

  Counter(float gateTimems) {

    this.gateTimems = gateTimems;
  }



  boolean[] getBits() {

    boolean[] bitsArray = new boolean[bitsAmount];



    for (int x = 0; x < bitsAmount; x++) {

      bitsArray[x] = (count & (1 << x)) != 0;
    }

    return bitsArray;
  }

  boolean[] getSavedBits() {

    boolean[] bitsArray = new boolean[bitsAmount];
    for (int x = 0; x < bitsAmount; x++) {

      bitsArray[x] = (savedCount & (1 << x)) != 0;
    }

    return bitsArray;
  }

  void saveCount() {

    savedCount = count;
  }

  void resetCount() {
    count = 0;
  }

  void setGateTime(float timeInMs) {

    gateTimems = timeInMs;
  }



  void count() {

    if (count < pow(2, bitsAmount)-1) {
      count++;
    } else {
      count = 0;
    }
  }


  int getSavedCount() {
    return floor(savedCount);
  }

  void setBits(int bitAmount) {
    bitsAmount = bitAmount;
  }
}
