public  class Pizza {
    public string size ;
    public string topping ;
    public integer numberPizza ;
    public void getPizzaOrder(){
        system.debug('Pizza topping: '+ topping);
        system.debug('Pizza size: ' + size);
        system.debug('Number of pizza: '+ numberPizza);
    }
}
