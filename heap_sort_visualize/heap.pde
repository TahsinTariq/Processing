class heap{  
  int layer;
  int[] arr;
  int n;
  int p = 0;
  heap(int[] arr, int n){
    this.arr = arr;
    this.n = n;
    layer = ceil(log(n+1)/log(2));
  }
  
  void print(){
    textAlign(CENTER, CENTER);
    textSize(14);
    for (int i=0; i<layer; i++){
//      println(arr[i]);
      for (int j = 0; j< pow(2,i); j++){
      //text(arr[p], width/2 - 25* pow(2,i) + j*50 , 100+i*20);
      text(arr[p], (j+1)* width/pow(i,2) , 100+i*20);
      if(p==n-1)
      break;
      p++;
    }
    }
    p=0;
  }
  
}
