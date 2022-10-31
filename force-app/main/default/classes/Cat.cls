public class Cat {
    public String name;
    public String color;

    //parameterized constructor
    public Cat(String n, String clr){
        name = n;
        color = clr;
        sleeping();
    }

    public void sleeping(){
        system.debug(name + ' is sleeping');
    }


    //Name is same as class nane
    //does NOT return anything.
    //this is non-parameterized constructor
    public Cat() {
        system.debug('Cat constructor called');
    }
}
