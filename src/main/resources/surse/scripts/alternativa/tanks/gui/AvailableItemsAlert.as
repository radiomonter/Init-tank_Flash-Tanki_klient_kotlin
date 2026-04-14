package alternativa.tanks.gui
{
   import alternativa.tanks.gui.alerts.ItemsAlert;
   import projects.tanks.client.commons.types.ItemGarageProperty;
   import projects.tanks.client.panel.model.garage.GarageItemInfo;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.premium.PremiumService;
   import titanomachina.headers.Headers;
   
   public class AvailableItemsAlert extends ItemsAlert
   {
      
      [Inject]
      public static var premiumService:PremiumService;
      
      public function AvailableItemsAlert(_arg_1:Vector.<GarageItemInfo>, _arg_2:String, _arg_3:String)
      {
         super(Headers.getHeaderById("ATTANTION"),_arg_3,this.addItems,_arg_1);
      }
      
      private function addItems(_arg_1:Vector.<GarageItemInfo>) : void
      {
         var _local_2:GarageItemInfo = null;
         var _local_3:int = 0;
         var _local_4:Boolean = false;
         var _local_5:Vector.<ItemGarageProperty> = null;
         var _local_7:int = 0;
         var _local_6:int = int(_arg_1.length);
         while(_local_7 < _local_6)
         {
            _local_2 = _arg_1[_local_7];
            _local_3 = 0;
            _local_4 = _local_2.premiumItem && !premiumService.hasPremium();
            partsList.addItem(_local_2.item,_local_2.name,_local_2.category,_local_2.position,0,_local_3,_local_4,true,0,_local_2.preview,0,null,_local_2.modificationIndex,null,_local_5);
            _local_7++;
         }
      }
   }
}

