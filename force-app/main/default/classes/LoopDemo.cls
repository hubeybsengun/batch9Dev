public  class LoopDemo {
  public void print_int_while(){
    Integer count = 1;
    while (count <=25) {
       system.debug(count);
       count++; 
    }
   }



public void print_N_numbers(Integer n){

    for(Integer i = 0; i < n; i++){
        system.debug(i);
    }
}

public void print_N_Odd_number(Integer startInt,integer endInt){
    if (startInt>endInt) {
        system.debug('start number CANNOT be greater than end number.');
    } else {
        for (Integer i = startInt; i < endInt; i++) {
            Integer modI = math.mod(i, 2);
            if(modI == 1){
                system.debug(i);
            }
    }
    
    }
}

}
