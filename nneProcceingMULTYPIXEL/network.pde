class network{
  float[] input;
  neuron[] hidden;
  neuron[] output;
  float rate;
  
  network(int in,int h, int o,float r_){
    this.rate = r_;
    input = new float[in];
    hidden = new neuron[h];
    output = new neuron[o];
    for( int i = 0; i < hidden.length; i++){
      hidden[i] = new neuron(in,this.rate);
    }
    for( int i = 0; i < output.length; i++){
      output[i] = new neuron(h,this.rate);
    }
  }
  void train(float[] inputs ,float error){
    for(int i = 0; i < this.hidden.length;i++){
      hidden[i].train(inputs,error);
    }
    float[] hiddenOut = new float[hidden.length];
    for(int i = 0; i < hidden.length;i++){
      hiddenOut[i] = hidden[i].guess(input);  
    }
    for(int i = 0; i < this.output.length;i++){
      output[i].train(hiddenOut,error);
    }
    
  }
  
  float[] guees(float[] input){
    float[] hiddenOut = new float[hidden.length];
    for(int i = 0; i < hidden.length;i++){
      hiddenOut[i] = hidden[i].guess(input);  
    }
    float[] result = new float[output.length];
    for(int i = 0; i < output.length;i++){
      result[i] = output[i].guess(hiddenOut);  
    }
    return result;
  }
  
  
}
