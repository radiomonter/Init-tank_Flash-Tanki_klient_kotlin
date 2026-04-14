package alternativa.tanks.service.item
{
   import alternativa.model.description.IDescription;
   import alternativa.model.timeperiod.TimePeriod;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.gui.GarageWindow;
   import alternativa.tanks.model.item.buyable.IBuyable;
   import alternativa.tanks.model.item.category.IItemCategory;
   import alternativa.tanks.model.item.category.IItemViewCategory;
   import alternativa.tanks.model.item.countable.ICountableItem;
   import alternativa.tanks.model.item.discount.IDiscount;
   import alternativa.tanks.model.item.item.IItem;
   import alternativa.tanks.model.item.kit.GarageKit;
   import alternativa.tanks.model.item.modification.IModification;
   import alternativa.tanks.model.item.properties.ItemProperties;
   import alternativa.tanks.model.item.properties.ItemPropertyValue;
   import alternativa.tanks.model.item.upgradable.UpgradableItem;
   import alternativa.tanks.model.item.upgradable.UpgradableItemPropertyValue;
   import alternativa.tanks.service.garage.GarageService;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import alternativa.types.Long;
   import controls.timer.CountDownTimer;
   import flash.events.EventDispatcher;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   import platform.client.fp10.core.resource.types.ImageResource;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.commons.types.ItemCategoryEnum;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Vihew extends EventDispatcher implements ItemService
   {
      
      [Inject]
      public static var userPropertyService:IUserPropertiesService;
      
      [Inject]
      public static var propertyService:ItemPropertyParamsService;
      
      [Inject]
      public static var garageService:GarageService;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private const qolysoqew:int = 5;
      
      private var bavupus:Dictionary;
      
      private var bopyfi:Dictionary;
      
      private var wadunijas:Dictionary;
      
      private var ludera:Vector.<IGameObject>;
      
      private var ram:Dictionary;
      
      private var sipilegy:Dictionary;
      
      public function Vihew()
      {
         super();
         this.ludera = new Vector.<IGameObject>();
         this.bavupus = new Dictionary();
         this.bopyfi = new Dictionary();
         this.wadunijas = new Dictionary();
         this.sipilegy = new Dictionary();
         this.ram = new Dictionary();
         this.ram[ItemGarageProperty.FIREBIRD_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_FIREBIRD;
         this.ram[ItemGarageProperty.FREEZE_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_FREEZE;
         this.ram[ItemGarageProperty.ISIS_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_ISIDA;
         this.ram[ItemGarageProperty.RAILGUN_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_RAILGUN;
         this.ram[ItemGarageProperty.RICOCHET_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_RICOCHET;
         this.ram[ItemGarageProperty.SHAFT_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_SHAFT;
         this.ram[ItemGarageProperty.SMOKY_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_SMOKY;
         this.ram[ItemGarageProperty.THUNDER_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_THUNDER;
         this.ram[ItemGarageProperty.TWINS_RESISTANCE] = TanksLocale.TEXT_REDUCE_DAMAGE_TWINS;
      }
      
      public function addItem(_arg_1:IGameObject) : void
      {
         if(_arg_1 in this.bavupus)
         {
            return;
         }
         this.bavupus[_arg_1] = true;
         dispatchEvent(new Rukebuqap(Rukebuqap.lekuzu,_arg_1));
      }
      
      public function rivozip(_arg_1:IGameObject) : ItemViewCategoryEnum
      {
         return IItemViewCategory(_arg_1.adapt(IItemViewCategory)).getCategory();
      }
      
      public function isBuyable(_arg_1:IGameObject) : Boolean
      {
         return IBuyable(_arg_1.adapt(IBuyable)).isBuyable();
      }
      
      public function setCount(_arg_1:IGameObject, _arg_2:int) : void
      {
         if(_arg_1.hasModel(ICountableItem))
         {
            ICountableItem(_arg_1.adapt(ICountableItem)).setCount(_arg_2);
         }
      }
      
      public function ducecyra(_arg_1:IGameObject) : IGameObject
      {
         var _local_2:int = this.getModificationIndex(_arg_1);
         var _local_3:Vector.<IGameObject> = this.muceraqe(_arg_1);
         if(_local_2 > 0)
         {
            return _local_3[_local_2 - 1];
         }
         return null;
      }
      
      public function getDescription(_arg_1:IGameObject) : String
      {
         var _local_2:Vector.<ItemPropertyValue> = null;
         var _local_3:ItemPropertyValue = null;
         var _local_5:String = null;
         var _local_4:* = "";
         if(this.getCategory(_arg_1) == ItemCategoryEnum.COLOR || this.getCategory(_arg_1) == ItemCategoryEnum.RESISTANCE_MODULE)
         {
            _local_2 = this.getProperties(_arg_1);
            if(_local_2.length > 0)
            {
               _local_4 = localeService.getText(TanksLocale.TEXT_GARAGE_RESISTANCE_DESCRIPTION_PREFIX) + "\n";
               if(_local_2.length == 1 && _local_2[0].getProperty() == ItemGarageProperty.ALL_RESISTANCE)
               {
                  for each(_local_5 in this.ram)
                  {
                     _local_4 += localeService.getText(_local_5) + "\n";
                  }
               }
               else
               {
                  for each(_local_3 in _local_2)
                  {
                     _local_4 += localeService.getText(this.ram[_local_3.getProperty()]) + "\n";
                  }
               }
               _local_4 += "\n";
            }
         }
         return _local_4 + IDescription(_arg_1.adapt(IDescription)).getDescription();
      }
      
      public function cunybuwoq(_arg_1:ItemCategoryEnum) : void
      {
         this.sipilegy[_arg_1] = true;
      }
      
      public function getUpgradableProperties(_arg_1:IGameObject) : Vector.<UpgradableItemPropertyValue>
      {
         if(_arg_1.hasModel(UpgradableItem))
         {
            return this.jecy(_arg_1).getUpgradableProperties();
         }
         return null;
      }
      
      private function jecy(_arg_1:IGameObject) : UpgradableItem
      {
         return UpgradableItem(_arg_1.adapt(UpgradableItem));
      }
      
      public function joso(_arg_1:IGameObject) : Boolean
      {
         return this.sipilegy[this.getCategory(_arg_1)] == true;
      }
      
      public function jihosis(_arg_1:IGameObject) : Boolean
      {
         return _arg_1 in this.bavupus;
      }
      
      public function reset() : void
      {
         this.bopyfi = new Dictionary();
         this.bavupus = new Dictionary();
         this.sipilegy = new Dictionary();
         this.ludera.length = 0;
      }
      
      public function getName(_arg_1:IGameObject) : String
      {
         var _local_2:String = IDescription(_arg_1.adapt(IDescription)).getName();
         if(this.cacum(_arg_1))
         {
            _local_2 += (localeService.language == "cn" ? "" : " ") + "M" + this.getModificationIndex(_arg_1);
         }
         return _local_2;
      }
      
      public function getPrice(_arg_1:IGameObject) : int
      {
         if(this.zereqyj(_arg_1))
         {
            return GarageKit(_arg_1.adapt(GarageKit)).getPrice();
         }
         return IBuyable(_arg_1.adapt(IBuyable)).getPrice();
      }
      
      public function getTimeLeftInSeconds(_arg_1:IGameObject) : int
      {
         var _local_2:int = TimePeriod(_arg_1.adapt(TimePeriod)).getTimeLeftInSeconds();
         return _local_2 > this.qolysoqew ? int(_local_2 - this.qolysoqew) : int(0);
      }
      
      public function vogacamy(_arg_1:IGameObject) : Boolean
      {
         return TimePeriod(_arg_1.adapt(TimePeriod)).isTimeless();
      }
      
      public function getTimeToStartInSeconds(_arg_1:IGameObject) : int
      {
         var _local_2:int = TimePeriod(_arg_1.adapt(TimePeriod)).getTimeToStartInSeconds();
         return _local_2 > 0 ? int(_local_2 + this.qolysoqew) : int(0);
      }
      
      private function jeqi(_arg_1:IGameObject) : Boolean
      {
         var _local_2:int = TimePeriod(_arg_1.adapt(TimePeriod)).getModelLoadingTimeInMillis();
         return getTimer() > _local_2 + this.getTimeToStartInSeconds(_arg_1) * 1000;
      }
      
      private function lipapece(_arg_1:IGameObject) : Boolean
      {
         var _local_2:int = TimePeriod(_arg_1.adapt(TimePeriod)).getTimeLeftInSeconds();
         return _local_2 > 0 && _local_2 <= this.qolysoqew;
      }
      
      public function konyqa(_arg_1:IGameObject) : Boolean
      {
         var _local_2:Boolean = TimePeriod(_arg_1.adapt(TimePeriod)).isEnabled();
         return _local_2 && !this.lipapece(_arg_1) || this.getTimeToStartInSeconds(_arg_1) > 0 && this.jeqi(_arg_1);
      }
      
      public function isCountable(_arg_1:IGameObject) : Boolean
      {
         if(_arg_1.hasModel(ICountableItem))
         {
            if(ICountableItem(_arg_1.adapt(ICountableItem)).getCount() >= 0)
            {
               return true;
            }
         }
         return false;
      }
      
      public function cacum(_arg_1:IGameObject) : Boolean
      {
         return _arg_1.hasModel(IModification) && IModification(_arg_1.adapt(IModification)).getModificationIndex() >= 0;
      }
      
      public function miqysi(_arg_1:IGameObject) : Boolean
      {
         return false;
      }
      
      public function capaq(_arg_1:IGameObject) : Boolean
      {
         return this.getCategory(_arg_1) == ItemCategoryEnum.PRESENT;
      }
      
      public function gotol(_arg_1:IGameObject) : Boolean
      {
         return this.getCategory(_arg_1) == ItemCategoryEnum.GIVEN_PRESENT;
      }
      
      public function getCategory(_arg_1:IGameObject) : ItemCategoryEnum
      {
         return IItemCategory(_arg_1.adapt(IItemCategory)).getCategory();
      }
      
      public function canBuy(_arg_1:IGameObject) : Boolean
      {
         if(this.zereqyj(_arg_1))
         {
            return GarageKit(_arg_1.adapt(GarageKit)).canBuy();
         }
         return this.isCountable(_arg_1) || !this.jihosis(_arg_1);
      }
      
      public function getCount(_arg_1:IGameObject) : int
      {
         if(_arg_1.hasModel(ICountableItem))
         {
            return ICountableItem(_arg_1.adapt(ICountableItem)).getCount();
         }
         return 0;
      }
      
      public function nyr(_arg_1:IGameObject) : IGameObject
      {
         var _local_2:int = this.getModificationIndex(_arg_1);
         var _local_3:Vector.<IGameObject> = this.muceraqe(_arg_1);
         if(_local_2 < _local_3.length - 1)
         {
            return _local_3[_local_2 + 1];
         }
         return _arg_1;
      }
      
      public function getModificationIndex(_arg_1:IGameObject) : int
      {
         if(this.cacum(_arg_1))
         {
            return IModification(_arg_1.adapt(IModification)).getModificationIndex();
         }
         return -1;
      }
      
      public function muceraqe(_arg_1:IGameObject) : Vector.<IGameObject>
      {
         var _local_2:Vector.<IGameObject> = null;
         var _local_3:Dictionary = null;
         var _local_4:int = 0;
         var _local_5:Long = null;
         var _local_6:int = 0;
         var _local_7:IGameObject = null;
         var _local_8:int = 0;
         var _local_9:Vector.<IGameObject> = this.bopyfi[_arg_1];
         _local_2 = _arg_1.space.objects;
         _local_3 = new Dictionary();
         _local_4 = 0;
         _local_5 = IModification(_arg_1.adapt(IModification)).getBaseItemId();
         _local_6 = 0;
         while(_local_6 < _local_2.length)
         {
            _local_7 = _local_2[_local_6];
            if(_local_7.hasModel(IModification))
            {
               if(this.biti(IModification(_local_7.adapt(IModification)).getBaseItemId(),_local_5))
               {
                  _local_8 = this.getModificationIndex(_local_7);
                  _local_3[_local_8] = _local_7;
                  _local_4++;
               }
            }
            _local_6++;
         }
         _local_9 = new Vector.<IGameObject>();
         _local_6 = 0;
         while(_local_6 < _local_4)
         {
            _local_9[_local_6] = _local_3[_local_6];
            _local_6++;
         }
         this.bopyfi[_arg_1] = _local_9;
         return _local_9;
      }
      
      private function biti(_arg_1:Long, _arg_2:Long) : Boolean
      {
         return _arg_1.high == _arg_2.high && _arg_1.low == _arg_2.low;
      }
      
      private function juqyfuwen(sydi:Vector.<IGameObject>) : void
      {
         var daci:Vector.<IGameObject> = null;
         var rif:IGameObject = null;
         var dytajec:Function = null;
         var hutace:int = 0;
         var gaj:int = 0;
         var rysol:Vector.<IGameObject> = null;
         var baluham:IGameObject = null;
         var vasaj:Vector.<IGameObject> = sydi;
         if(this.bopyfi == null)
         {
            this.bopyfi = new Dictionary();
            daci = new Vector.<IGameObject>();
            for each(rif in vasaj)
            {
               if(rif.hasModel(IModification))
               {
                  daci.push(rif);
               }
            }
            dytajec = function(_arg_1:IGameObject, _arg_2:IGameObject):int
            {
               var _local_3:Long = IModification(_arg_1.adapt(IModification)).getBaseItemId();
               var _local_4:Long = IModification(_arg_2.adapt(IModification)).getBaseItemId();
               return Long.comparator(_local_3,_local_4);
            };
            daci.sort(dytajec);
            hutace = 0;
            while(hutace < daci.length)
            {
               gaj = hutace + 1;
               while(gaj < daci.length && dytajec(daci[hutace],daci[gaj]) == 0)
               {
                  gaj += 1;
               }
               rysol = new Vector.<IGameObject>(gaj - hutace);
               while(hutace < gaj)
               {
                  baluham = daci[hutace];
                  rysol[IModification(baluham.adapt(IModification)).getModificationIndex()] = baluham;
                  this.bopyfi[baluham] = rysol;
                  hutace += 1;
               }
            }
         }
      }
      
      public function vedet(_arg_1:IGameObject) : int
      {
         return this.muceraqe(_arg_1).length;
      }
      
      public function nemofoni(_arg_1:IGameObject) : IGameObject
      {
         var _local_2:IGameObject = null;
         var _local_3:Vector.<IGameObject> = this.muceraqe(_arg_1);
         var _local_4:int = _local_3.length - 1;
         while(_local_4 >= 0)
         {
            _local_2 = _local_3[_local_4];
            if(this.jihosis(_local_2))
            {
               return _local_2;
            }
            _local_4--;
         }
         return null;
      }
      
      public function getPreviewResource(_arg_1:IGameObject) : ImageResource
      {
         return IItem(_arg_1.adapt(IItem)).getPreviewResource();
      }
      
      public function ruma(_arg_1:IGameObject) : int
      {
         return IItem(_arg_1.adapt(IItem)).getMinRank();
      }
      
      public function hun(_arg_1:IGameObject) : int
      {
         return IItem(_arg_1.adapt(IItem)).getMaxRank();
      }
      
      public function hefigiv(_arg_1:IGameObject) : IGameObject
      {
         var _local_2:IGameObject = this.mepuge(_arg_1);
         if(_local_2 == _arg_1)
         {
            _local_2 = this.nyr(_arg_1);
         }
         return _local_2;
      }
      
      public function mepuge(_arg_1:IGameObject) : IGameObject
      {
         var _local_2:IGameObject = null;
         var _local_3:IGameObject = null;
         if(userPropertyService.rank < this.ruma(_arg_1))
         {
            return _arg_1;
         }
         var _local_4:Vector.<IGameObject> = this.muceraqe(_arg_1);
         var _local_5:int = int(_local_4.length);
         var _local_6:int = _local_5 - 1;
         while(_local_6 >= 0)
         {
            _local_3 = _local_4[_local_6];
            if(userPropertyService.rank >= this.ruma(_local_3))
            {
               _local_2 = _local_3;
               break;
            }
            _local_6--;
         }
         return _local_2;
      }
      
      public function removeItem(_arg_1:IGameObject) : void
      {
         if(this.jihosis(_arg_1))
         {
            delete this.bavupus[_arg_1];
         }
      }
      
      public function zereqyj(_arg_1:IGameObject) : Boolean
      {
         return this.getCategory(_arg_1) == ItemCategoryEnum.KIT && _arg_1.hasModel(GarageKit) && GarageKit(_arg_1.adapt(GarageKit)).getImage != null;
      }
      
      public function getDiscount(_arg_1:IGameObject) : int
      {
         return IDiscount(_arg_1.adapt(IDiscount)).getDiscountInPercent();
      }
      
      public function getEndDiscountTimer(_arg_1:IGameObject) : CountDownTimer
      {
         return IDiscount(_arg_1.adapt(IDiscount)).getEndDiscountTimer();
      }
      
      public function getPriceWithoutDiscount(_arg_1:IGameObject) : int
      {
         return IBuyable(_arg_1.adapt(IBuyable)).getPriceWithoutDiscount();
      }
      
      public function getPosition(_arg_1:IGameObject) : int
      {
         return IItem(_arg_1.adapt(IItem)).getPosition();
      }
      
      public function mountItem(_arg_1:IGameObject) : void
      {
         var _local_2:IGameObject = this.cajykobyf(this.getCategory(_arg_1));
         if(_local_2 == _arg_1)
         {
            return;
         }
         var _local_3:GarageWindow = garageService.tolycavu();
         if(_local_2 != null)
         {
            _local_3.unmountItem(_local_2);
            this.ludera.splice(this.ludera.indexOf(_local_2),1);
         }
         _local_3.mountItem(_arg_1);
         this.ludera.push(_arg_1);
         if(_local_3.selectedItem == _arg_1)
         {
            _local_3.itemInfoPanel.updateEquipButton();
         }
      }
      
      public function getProperties(_arg_1:IGameObject) : Vector.<ItemPropertyValue>
      {
         if(_arg_1.hasModel(ItemProperties))
         {
            return ItemProperties(_arg_1.adapt(ItemProperties)).getProperties();
         }
         return null;
      }
      
      public function isUpgrading(_arg_1:IGameObject) : Boolean
      {
         return _arg_1.hasModel(UpgradableItem) && this.jecy(_arg_1).isUpgrading();
      }
      
      public function getUpgradingProperty(_arg_1:IGameObject) : ItemGarageProperty
      {
         return this.jecy(_arg_1).getUpgradingProperty();
      }
      
      public function zelima(_arg_1:IGameObject) : Boolean
      {
         return this.cajykobyf(this.getCategory(_arg_1)) == _arg_1;
      }
      
      public function isFullUpgraded(_arg_1:IGameObject) : Boolean
      {
         var _local_2:ItemPropertyValue = null;
         for each(_local_2 in this.getProperties(_arg_1))
         {
            if(_local_2.isUpgradable() && !_local_2.getUpgradableValue().isFullUpgraded())
            {
               return false;
            }
         }
         return true;
      }
      
      public function hasNextModification(_arg_1:IGameObject) : Boolean
      {
         var _local_2:Vector.<IGameObject> = this.muceraqe(_arg_1);
         return _arg_1 != _local_2[_local_2.length - 1];
      }
      
      public function cajykobyf(_arg_1:ItemCategoryEnum) : IGameObject
      {
         var _local_2:IGameObject = null;
         var _local_3:int = 0;
         while(_local_3 < this.ludera.length)
         {
            _local_2 = this.ludera[_local_3];
            if(this.getCategory(_local_2) == _arg_1)
            {
               return _local_2;
            }
            _local_3++;
         }
         return null;
      }
   }
}

