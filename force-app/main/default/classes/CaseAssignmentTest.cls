@istest
public class CaseAssignmentTest {

    @istest
   private static void caseIns(){
    CaseAssignment.caseInsert();
    List<Case> caseList=[select id,origin from case where origin ='Phone'];
    system.assertEquals(1, caseList.size());
   }

   @istest
   private static void caseUp(){
    case c=new case();
    c.subject='Testcase';
    insert c;
    CaseAssignment.caseUpdate();
    List<Case> caseList=[select id,Subject from case where Subject ='Testing case 1'];
    system.assertEquals('Testing case 1', caseList[0].Subject);
   }

   @istest
   private static void caseDel(){
    case c = new case(); 
    c.Subject = 'Case 1'; 
    c.Origin='Phone'; 
    insert c; 
    CaseAssignment.caseDelete();
    list<case> del=[select id,Subject from case where subject like '%case 1%' ];
    system.assertEquals(0, del.size());
   }
}
