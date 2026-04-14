package alternativa.tanks.service.delaymountcategory
{
   import alternativa.osgi.service.logging.LogService;
   import alternativa.tanks.service.item.ItemService;
   import controls.timer.CountDownTimer;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import obfuscation.nubezeqyr.Ruvetuki;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   
   public class Mylafisu implements IDelayMountCategoryService
   {
      
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var logService:LogService;
      
      private var timers:Dictionary = new Dictionary();
      
      public function Mylafisu()
      {
         super();
      }
      
      public function vyjyjyr(_arg_1:IGameObject) : CountDownTimer
      {
         var _local_2:ItemCategoryEnum = itemService.getCategory(_arg_1);
         return this.timers[_local_2];
      }
      
      public function minuk(_arg_1:Ruvetuki) : void
      {
         this.maf(ItemCategoryEnum.ARMOR,_arg_1.delayMountArmorInSec);
         this.maf(ItemCategoryEnum.WEAPON,_arg_1.delayMountWeaponInSec);
         this.maf(ItemCategoryEnum.COLOR,0);
         this.maf(ItemCategoryEnum.RESISTANCE_MODULE,_arg_1.delayMountColorInSec);
      }
      
      private function maf(_arg_1:ItemCategoryEnum, _arg_2:int) : void
      {
         var _local_3:CountDownTimer = new CountDownTimer();
         _local_3.start(_arg_2 * 1000 + getTimer());
         this.timers[_arg_1] = _local_3;
      }
      
      public function ticytezi() : void
      {
         var _local_1:CountDownTimer = null;
         for each(_local_1 in this.timers)
         {
            if(_local_1 != null)
            {
               _local_1.destroy();
            }
         }
         delete this.timers[ItemCategoryEnum.ARMOR];
         delete this.timers[ItemCategoryEnum.COLOR];
         delete this.timers[ItemCategoryEnum.RESISTANCE_MODULE];
         delete this.timers[ItemCategoryEnum.WEAPON];
      }
      
      public function kutaneq() : void
      {
         var _local_1:CountDownTimer = null;
         for each(_local_1 in this.timers)
         {
            if(_local_1 != null)
            {
               _local_1.stop();
            }
         }
      }
   }
}

