Account acc = [SELECT Id, Name, OwnerId, CreatedBy.Name
               FROM Account
               WHERE Id = '0014x00001hBZFJAA4'];
//Prepare the inputs
Map<String, Object> inputs = new Map<String, Object>();
inputs.put('AccountId', acc.Id);
inputs.put('AccountName', acc.Name);
inputs.put('AccountOwnerId', acc.OwnerId);
inputs.put('CreatedByName', acc.CreatedBy.Name);
 //Invoke the flow

Flow.Interview flow = new Flow.Interview.X15_Account_AutoLaunch_Flow(inputs);
flow.start();