public class SetDemo {
public  static void citySet() {
    Set<string> cities = new Set<string>();
    cities.add('Tokyo');
    cities.add('Nairobi');
    cities.add('Lisbon');
    cities.add('Berlin');
    cities.add('Tokyo');
    cities.add('Berlin');
    cities.add('Nairobi');

    system.debug('Set of cities'+cities);
}
public static void randomIntegerSet() {
    set<Integer> integerset = new set<integer>();
    integerset.add(15);
    integerset.add(19);
    integerset.add(21);
    integerset.add(15);
    integerset.add(15);
    integerset.add(15);
    integerset.add(15);
    system.debug('integer set ===>'+ integerset);
}
public static set<integer> setFromList(List<integer> intList) {
    Set<integer> setOfInt = new Set<integer>();
    setOfInt.addAll(intList);
    return setOfInt;
}


public static set<string> capitalizeAllSet(set<string> setString){
    Set<string> returnSet = new Set<string>();
    for (string eachStr : setString) {
       string tempStr = eachStr.touppercase();
       returnSet.add(tempStr); 
    }
    return returnSet;
}
}