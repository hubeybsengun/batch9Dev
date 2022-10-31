public  class OperationsHelper {
    public static decimal sum(list<decimal> decimalList){
        decimal sum = 0;
        if (decimalList.isEmpty()) {
            system.debug('Please provide values to do the operation.');
            return null;
        }else {
            for (decimal eachDec : decimalList) {
                sum += eachDec ;
            }
        }
        return sum;
    }

    public static decimal average(list<decimal> decimalList){
        decimal sum = 0;
        if (decimalList.isEmpty()) {
            system.debug('Please provide values to do the operation.');
            return null;
        }else {
            for (decimal eachDec : decimalList) {
                sum += eachDec ;
            }
        }
        sum=sum/decimalList.size();
        return sum;
    }

    public static decimal highest(list<decimal> decimalList){
        decimal sum = 0;
        if (decimalList.isEmpty()) {
            system.debug('Please provide values to do the operation.');
            return null;
        }else {
            sum = decimalList[0];
            for (Integer i = 0; i < decimalList.size(); i++) {
                if (decimalList[i]>decimalList[0]) {
                   sum= decimalList[i] ;
                }
            }
           
        }
        return sum;
    }
    public static decimal lowest(list<decimal> decimalList){
        decimal sum = 0;
        if (decimalList.isEmpty()) {
            system.debug('Please provide values to do the operation.');
            return null;
        }else {
            sum = decimalList[0];
            for (Integer i = 0; i < decimalList.size(); i++) {
                if (decimalList[i]<decimalList[0]) {
                   sum= decimalList[i] ;
                }
            }
           
        }
        return sum;
    }
}
