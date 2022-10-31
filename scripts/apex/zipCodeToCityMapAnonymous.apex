map<integer, String> zipCodetoCityMap = new map<integer, String>();
zipCodetoCityMap.put(60606, 'Chicago');
zipCodetoCityMap.put(33162, 'Miami');
zipCodetoCityMap.put(35000, 'NeW yORK');
system.debug('Is contain 204101 =>'+zipCodetoCityMap.containsKey(204101));

for(integer eachZip: zipCodetoCityMap.keySet()){
    system.debug('Zip code=>'+eachZip);
}

for(integer eachZip: zipCodetoCityMap.keySet()){
    system.debug('City=>' + zipCodetoCityMap.get(eachZip));
}
system.debug('The number of map size'+zipCodetoCityMap.size());

Set<Integer> uniqueZipCodeSet= new Set<Integer>();
uniqueZipCodeSet=zipCodetoCityMap.keySet();
system.debug('Unique key sets =>'+uniqueZipCodeSet);


List<String> cityNameList= new List<String>();
cityNameList=zipCodetoCityMap.values();
system.debug('City name list =>'+cityNameList);


system.debug('is empty ?'+zipCodetoCityMap.isEmpty());
