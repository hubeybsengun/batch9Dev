public class Candidates {
    public string name;
    public String gender;
    public static string companyName;


    public void printCandidate(){
        system.debug('Candidate name is '+ name + '('+gender+')');
        system.debug('company name is '+ companyName);
        system.debug('=====END====');
    }
}
