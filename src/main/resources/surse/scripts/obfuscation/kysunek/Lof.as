package obfuscation.kysunek
{
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.model.item.kit.GarageKit;
   import alternativa.tanks.service.item.ItemService;
   import assets.Diamond;
   import controls.Money;
   import controls.base.LabelBase;
   import flash.display.BitmapData;
   import flash.display.Shape;
   import flash.display.Sprite;
   import flash.geom.Matrix;
   import flash.text.TextFormatAlign;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.garage.models.item.kit.KitItem;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Lof extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var itemService:ItemService;
      
      private static const upgradeSelectionLeftClass:Class = Canud;
      
      private static const upgradeSelectionCenterClass:Class = Hinu;
      
      private const cujeqyji:int = 12;
      
      private const pulilosij:int = 13;
      
      private const daluwi:int = 4;
      
      private const zamomazo:int = 17;
      
      private var selection:Shape = new Shape();
      
      private var _width:int;
      
      private var gari:int;
      
      private var rawilypu:int;
      
      private var wek:IGameObject;
      
      private var kit:GarageKit;
      
      public function Lof(_arg_1:int)
      {
         super();
         this._width = _arg_1;
         this.gari = 0;
      }
      
      public function show(_arg_1:IGameObject) : void
      {
         this.wek = _arg_1;
         this.kit = GarageKit(_arg_1.adapt(GarageKit));
         var _local_2:int = int(this.kit.getItems().length);
         this.gari = this.cujeqyji + (_local_2 + 2) * this.zamomazo;
         this.zoha();
         this.tejequ();
         this.cujamy();
         this.mar();
         this.vejo();
      }
      
      public function zoha() : void
      {
         while(this.numChildren > 0)
         {
            this.removeChildAt(0);
         }
      }
      
      private function tejequ() : void
      {
         var _local_1:LabelBase = new LabelBase();
         _local_1.color = 5898034;
         _local_1.align = TextFormatAlign.LEFT;
         _local_1.text = localeService.getText(TanksLocale.TEXT_ITEMS_IN_KIT);
         _local_1.x = this.cujeqyji;
         _local_1.y = this.cujeqyji;
         addChild(_local_1);
         var _local_2:LabelBase = new LabelBase();
         _local_2.color = 5898034;
         _local_2.align = TextFormatAlign.RIGHT;
         _local_2.text = localeService.getText(TanksLocale.TEXT_GARAGE_PRICE);
         _local_2.x = this._width - _local_2.width - _local_1.x;
         _local_2.y = _local_1.y;
         addChild(_local_2);
      }
      
      private function cujamy() : void
      {
         var _local_1:KitItem = null;
         var _local_2:Liwa = null;
         this.kit.getItems().sort(this.zup);
         var _local_3:int = this.cujeqyji + this.zamomazo;
         for each(_local_1 in this.kit.getItems())
         {
            _local_2 = new Liwa(_local_3,this._width,_local_1,this.cujeqyji,this.daluwi);
            addChild(_local_2);
            _local_3 += this.zamomazo;
         }
      }
      
      private function mar() : void
      {
         var _local_1:LabelBase = new LabelBase();
         _local_1.color = 5898034;
         _local_1.align = TextFormatAlign.LEFT;
         _local_1.text = localeService.getText(TanksLocale.TEXT_TOTAL_PRICE_KIT);
         _local_1.x = this.cujeqyji;
         _local_1.y = this.cujeqyji + (this.kit.getItems().length + 1) * this.zamomazo;
         addChild(_local_1);
         var _local_2:Diamond = new Diamond();
         _local_2.x = this._width - _local_1.x - _local_2.width;
         addChild(_local_2);
         _local_2.y = _local_1.y + this.daluwi;
         var _local_3:LabelBase = new LabelBase();
         _local_3.color = 5898034;
         _local_3.align = TextFormatAlign.RIGHT;
         _local_3.text = Money.numToString(this.kit.getPriceWithoutDiscount(),false);
         _local_3.x = _local_2.x - _local_3.width - 1;
         _local_3.y = _local_1.y;
         addChild(_local_3);
      }
      
      private function vejo() : void
      {
         addChild(this.selection);
         this.selection.y = this.pulilosij + this.gari;
         this.resizeSelection();
         var _local_1:int = itemService.getDiscount(this.wek);
         var _local_2:int = itemService.getPrice(this.wek);
         var _local_3:String = localeService.getText(TanksLocale.TEXT_DISCOUNTED_AT_KIT);
         _local_3 = _local_3.replace("{0}",_local_1 + "%");
         this.jadobuki(_local_3,_local_2,0,16777215);
         var _local_4:int = this.kit.cik();
         var _local_5:int = 1;
         if(_local_4 > 0)
         {
            this.jadobuki(localeService.getText(TanksLocale.TEXT_ALREADY_BOUGHT_KIT),_local_4,1,9539985);
            _local_5++;
         }
         this.jadobuki(localeService.getText(TanksLocale.TEXT_YOU_SAVE_KIT),this.kit.cikanokot(),_local_5,16777215);
         this.rawilypu = (_local_5 + 1) * this.zamomazo;
      }
      
      private function jadobuki(_arg_1:String, _arg_2:int, _arg_3:int, _arg_4:uint) : void
      {
         var _local_5:LabelBase = new LabelBase();
         _local_5.color = _arg_4;
         _local_5.align = TextFormatAlign.LEFT;
         _local_5.text = _arg_1;
         _local_5.x = this.cujeqyji;
         _local_5.y = this.pulilosij + this.gari + this.zamomazo * _arg_3;
         addChild(_local_5);
         var _local_6:Diamond = new Diamond();
         _local_6.x = this._width - _local_5.x - _local_6.width;
         addChild(_local_6);
         _local_6.y = _local_5.y + this.daluwi;
         var _local_7:LabelBase = new LabelBase();
         _local_7.color = _arg_2 >= 0 ? uint(_arg_4) : uint(16727340);
         _local_7.align = TextFormatAlign.RIGHT;
         _local_7.text = Money.numToString(_arg_2,false);
         _local_7.x = _local_6.x - _local_7.width - 1;
         _local_7.y = _local_5.y;
         addChild(_local_7);
      }
      
      private function resizeSelection() : void
      {
         var _local_1:int = this._width - 18;
         var _local_2:BitmapData = new upgradeSelectionLeftClass().bitmapData;
         this.selection.x = 9;
         this.selection.graphics.clear();
         this.selection.graphics.beginBitmapFill(_local_2);
         this.selection.graphics.drawRect(0,0,_local_2.width,_local_2.height);
         var _local_3:BitmapData = new upgradeSelectionCenterClass().bitmapData;
         this.selection.graphics.beginBitmapFill(_local_3);
         this.selection.graphics.drawRect(_local_2.width,0,_local_1 - _local_2.width * 2,_local_3.height);
         var _local_4:Matrix = new Matrix(-1,0,0,1,_local_1,0);
         this.selection.graphics.beginBitmapFill(_local_2,_local_4);
         this.selection.graphics.drawRect(_local_1 - _local_2.width,0,_local_2.width,_local_2.height);
         this.selection.graphics.endFill();
      }
      
      private function zup(_arg_1:KitItem, _arg_2:KitItem) : Number
      {
         var _local_3:int = this.rovibu(_arg_1);
         var _local_4:int = this.rovibu(_arg_2);
         if(_local_3 > _local_4)
         {
            return 1;
         }
         if(_local_3 < _local_4)
         {
            return -1;
         }
         var _local_5:int = itemService.getPrice(_arg_1.item) * _arg_1.count;
         var _local_6:int = itemService.getPrice(_arg_2.item) * _arg_2.count;
         if(_local_5 < _local_6)
         {
            return 1;
         }
         if(_local_5 > _local_6)
         {
            return -1;
         }
         return 0;
      }
      
      private function rovibu(_arg_1:KitItem) : int
      {
         switch(itemService.getCategory(_arg_1.item))
         {
            case ItemCategoryEnum.WEAPON:
               return 0;
            case ItemCategoryEnum.ARMOR:
               return 1;
            case ItemCategoryEnum.INVENTORY:
               return 3;
            case ItemCategoryEnum.PLUGIN:
               return 4;
            case ItemCategoryEnum.COLOR:
               return 5;
            default:
               return 6;
         }
      }
      
      public function muporosy() : int
      {
         return this.gari;
      }
      
      public function qihuzitys() : int
      {
         return this.pulilosij + this.gari + this.rawilypu;
      }
      
      public function kyduc() : int
      {
         return this.rawilypu;
      }
   }
}

