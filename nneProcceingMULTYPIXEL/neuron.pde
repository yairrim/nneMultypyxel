class neuron {
  float[] weights;  // the wighths of the neuron
  float c;          // rate of the learn
    //declaring the number of wightes and the rate of the lern
  neuron(int n, float c_) { 
    weights = new float[n];
    for (int i = 0; i < weights.length; i++) {
      weights[i] = random(0,1); 
    }
    c = c_;
  }

  void train(float[] inputs, float error) { 
    for (int i = 0; i <weights.length; i++) {
      weights[i] += c * error * inputs[i];         
    }
  }

  float guess(float[] inputs) {
    // Sum all values
    float sum = 0;
    for (int i = 0; i < weights.length; i++) {
      sum += inputs[i]*weights[i];
    }
    return (sum);
  }
  
  int activate(float sum) {
    if (sum > 0) return 1;
    else return -1; 
  }
  
  // Return weights
  float[] getWeights() {
    return weights; 
  }
}
