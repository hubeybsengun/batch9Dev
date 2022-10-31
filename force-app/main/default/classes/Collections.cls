public  class Collections {
    public static string ListAssignment(integer monthNo){
        string outputMonth = '';
        List<String> monthList = new list<string>();
        monthList.add('January');
        monthList.add('February');
        monthList.add('March');
        monthList.add('April');
        monthList.add('May');
        monthList.add('June');
        monthList.add('July');
        monthList.add('August');
        monthList.add('September');
        monthList.add('October');
        monthList.add('November');
        monthList.add('December');

        if(monthNo <= 0 || monthNo > monthList.size()){
            outputMonth = 'Not a valid month';
        } else {
            outputMonth = monthList[monthNo-1];
        }
        return outputMonth;
    }
}
