Map<String,String> mapCountryCurrency = new Map<String,String>();
mapCountryCurrency.put('USA', 'Dollar');
mapCountryCurrency.put('France', 'Euro');
mapCountryCurrency.put('India', 'Rupees');
mapCountryCurrency.put('India', 'Rupee');
mapCountryCurrency.put('Turkey', 'Lira');
mapCountryCurrency.put('El Salvador', 'Bitcoin');
mapCountryCurrency.put('Canada', 'Dollar');
system.debug(mapCountryCurrency);

string tr='Turkey';
String indiaCurrency = mapCountryCurrency.get('India');
String turkeyCurrency = mapCountryCurrency.get(tr);

system.debug('India currency => ' + indiaCurrency);
system.debug('Turkey currency =>'+turkeyCurrency);


set<string> allCountries = mapCountryCurrency.keySet();
system.debug('all countries are => ' + allCountries);

list<string> allCurrencies =mapCountryCurrency.values();
system.debug('all currencies =>' + allCurrencies);

set<string> countrySet = mapCountryCurrency.keySet();
for(string eachKey : countrySet){
    system.debug('each Key==> '+ eachKey);
    string eachCurrency = mapCountryCurrency.get(eachKey);
    system.debug('each currency ==> ' + eachCurrency);
    System.debug('-----------');
}