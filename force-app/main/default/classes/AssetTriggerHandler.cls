public class AssetTriggerHandler {
    public static void updateDescription(List<Asset> asTriggernew,List<Asset> asTriggerold,map<id, Asset> asTriggernewMap, map<id, Asset> asTriggeroldMap ) {
        Boolean updesc = false;
        for (asset eachAS : asTriggernew) {
            
            if (eachAS.Status =='Shipped'&& asTriggeroldMap==null) {
                updesc=true;
            }if (asTriggerold != null && eachAS.Status =='Shipped' && eachAS.Status != asTriggeroldMap.get(eachAs.Id).Status) {
                updesc=true;
            }
            if (eachAS.Status =='Installed'&& asTriggeroldMap==null) {
                updesc=true;
            }
            if (asTriggerold != null && eachAS.Status =='Installed' && eachAS.Status != asTriggeroldMap.get(eachAs.Id).Status) {
                updesc=true;
            }
            if (updesc) {
                eachAS.Description= 'Asset is '+ eachAS.Status;
            }
        }
    }
   
}
