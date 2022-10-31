public class DateTimeDemo {
    public void dateTimeDemoMethod(){
        Datetime currentdate = date.today();
        system.debug('Current date is '+ currentdate);


        date date1= date.newInstance(1998, 05, 07);
        date date2= date.newInstance(2005, 05, 07);

        integer daysBetween = date2.daysBetween(date1);
        system.debug('Between of two dates'+ daysBetween);

        date subsStart = date.today();
        date subsend = subsStart.addDays(-30);
        system.debug('Subscription end date is => '+subsend);
    }
}
