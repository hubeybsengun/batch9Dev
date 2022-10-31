public class ListPractice {
public static List<planets> planetsList = new List<planets>();

public void addPlanet(string planetName, integer planetNumber, integer numberOfMoons){
    if (planetName =='') {
      return  'Planet without a name cannot be added to the list';
    }else {
        planets planet1= new planets();
        planet1.planetName=planetName;
        planet1.planetNumber=planetNumber;
        planet1.numberOfMoons=numberOfMoons;

        planetsList.add(planet1);
        return 'Planet added successfully';
    }
}


    }
