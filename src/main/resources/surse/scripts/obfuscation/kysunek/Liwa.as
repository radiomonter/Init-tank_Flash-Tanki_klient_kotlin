package obfuscation.kysunek
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.service.item.ItemService;
   import assets.Diamond;
   import controls.Money;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import flash.text.TextFormatAlign;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Liwa extends Sprite
   {
      
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      public function Liwa(_arg_1:int, _arg_2:int, _arg_3:KitItem, _arg_4:int, _arg_5:int)
      {
         var _local_12:uint = 0;
         var _local_6:LabelBase = null;
         var _local_11:Boolean = false;
         var _local_7:Number = NaN;
         super();
         var _local_8:int = 45;
         if(localeService.language == "cn")
         {
            _local_8 = 59;
         }
         var _local_9:int = _arg_2;
         this.y = _arg_1;
         var _local_10:IGameObject = _arg_3.item;
         _local_11 = itemService.jihosis(_local_10) && !itemService.isCountable(_local_10) && itemService.getCategory(_local_10) != ItemCategoryEnum.PLUGIN;
         _local_12 = _local_11 ? uint(9539985) : uint(16777215);
         var _local_13:LabelBase = new LabelBase();
         _local_13.color = _local_12;
         _local_13.align = TextFormatAlign.LEFT;
         _local_13.text = itemService.getName(_arg_3.item) + (_arg_3.count <= 1 ? "" : " ×" + String(_arg_3.count));
         _local_13.x = _arg_4;
         addChild(_local_13);
         if(_local_11)
         {
            _local_13.text += " " + localeService.getText(TanksLocale.TEXT_BOUGHT_STATUS_KIT);
         }
         var _local_14:Diamond = new Diamond();
         _local_14.x = _local_9 - _local_13.x - _local_14.width;
         addChild(_local_14);
         _local_14.y = _arg_5;
         var _local_15:int = itemService.getPriceWithoutDiscount(_arg_3.item) * _arg_3.count;
         var _local_16:LabelBase = new LabelBase();
         _local_16.color = _local_12;
         _local_16.align = TextFormatAlign.RIGHT;
         _local_16.text = Money.numToString(_local_15,false);
         _local_16.x = _local_14.x - _local_16.width - 1;
         addChild(_local_16);
         if(!_local_11)
         {
            _local_6 = new LabelBase();
            _local_7 = itemService.getDiscount(_arg_3.item);
            if(_local_7 > 0)
            {
               _local_6.bold = true;
               _local_6.color = 16727340;
               _local_6.align = TextFormatAlign.RIGHT;
               _local_6.text = "-" + String(_local_7) + "%";
               _local_6.x = _local_14.x - _local_8 - _local_6.width;
               addChild(_local_6);
            }
         }
      }
   }
}

