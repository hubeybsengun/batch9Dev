public class Tea {
    public void start(){
        system.debug('Step1 :We need to collect all raw materials.');
    }
    public void execute(){
        start();
        system.debug('Step2 :We need to mix all materials and boild in water.');
    }
    public void finish(){
        execute();
        system.debug('Tea is ready to serve now.');
    }
}
