public  class StringDemo2 {
    public void StringDemo2() {
        string description= 'I am learning string methods in apex';
        system.debug(description);

        integer descriptionLength = description.length();
       system.debug('Length of string ' +descriptionLength);
        
        string descriptionUp= description.toUpperCase();
        system.debug('string uppercase = ' + descriptionUp.toUpperCase());

        Boolean check = description.contains('learning');
        system.debug('string contains learning ='+ check);

    }
}
