int arr[] = {121, 10, 130, 57, 36, 17, 25, 26,1,2,3,4,5,6};
 heap h = new heap(arr, arr.length);
 
void setup(){
  size(1080, 720);
  background(0);
}

void draw(){
  h.print();
}
