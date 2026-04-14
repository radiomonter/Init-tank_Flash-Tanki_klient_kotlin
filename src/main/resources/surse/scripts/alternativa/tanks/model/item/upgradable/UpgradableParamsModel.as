package alternativa.tanks.model.item.upgradable
{
   import alternativa.osgi.service.clientlog.IClientLog;
   import alternativa.tanks.model.item.properties.ItemProperties;
   import alternativa.tanks.model.item.properties.ItemPropertyValue;
   import alternativa.tanks.service.item.ItemService;
   import alternativa.tanks.service.itempropertyparams.Bekipudi;
   import alternativa.tanks.service.itempropertyparams.ItemPropertyParamsService;
   import controls.timer.CountDownTimer;
   import platform.client.fp10.core.model.ObjectLoadPostListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   import projects.tanks.client.garage.models.item.upgradeable.IUpgradeableParamsConstructorModelBase;
   import projects.tanks.client.garage.models.item.upgradeable.UpgradeableParamsConstructorModelBase;
   import projects.tanks.client.garage.models.item.upgradeable.types.GaragePropertyData;
   
   public class UpgradableParamsModel extends UpgradeableParamsConstructorModelBase implements IUpgradeableParamsConstructorModelBase, ObjectLoadPostListener, UpgradableItem, ObjectUnloadListener, ItemProperties
   {
      
      [Inject]
      public static var propertyService:ItemPropertyParamsService;
      
      [Inject]
      public static var itemService:ItemService;
      
      [Inject]
      public static var logger:IClientLog;
      
      public function UpgradableParamsModel()
      {
         super();
      }
      
      public function getProperties() : Vector.<ItemPropertyValue>
      {
         return Vector.<ItemPropertyValue>(this.data().properties);
      }
      
      public function getUpgradableProperties() : Vector.<UpgradableItemPropertyValue>
      {
         return this.data().properties;
      }
      
      public function isUpgrading() : Boolean
      {
         return this.data().isUpgrading();
      }
      
      public function getUpgradingProperty() : ItemGarageProperty
      {
         return this.data().upgradingValue.getProperty();
      }
      
      public function getUpgradingValue() : UpgradableItemPropertyValue
      {
         return this.data().upgradingValue;
      }
      
      public function speedUp() : void
      {
         return this.data().speedUp();
      }
      
      public function setUpgradingProperty(_arg_1:UpgradableItemPropertyValue, _arg_2:CountDownTimer) : void
      {
         this.data().setUpgradingProperty(_arg_1,_arg_2);
      }
      
      public function getCountDownTimer() : CountDownTimer
      {
         return this.data().timer;
      }
      
      public function objectLoadedPost() : void
      {
         var _local_1:GaragePropertyData = null;
         var _local_2:UpgradeableItemData = null;
         var _local_3:UpgradableItemPropertyValue = null;
         var _local_4:Vector.<UpgradableItemPropertyValue> = new Vector.<UpgradableItemPropertyValue>();
         var _local_5:Boolean = itemService.cacum(object) && itemService.hasNextModification(object);
         for each(_local_1 in getInitParam().properties)
         {
            _local_3 = new UpgradableItemPropertyValue(_local_1,_local_5);
            _local_4.push(_local_3);
         }
         _local_4.sort(this.compare);
         _local_2 = new UpgradeableItemData(_local_4,getInitParam().info,object);
         putData(UpgradeableItemData,_local_2);
      }
      
      public function initializePrecision() : void
      {
         var _local_1:Vector.<UpgradeableItemData> = null;
         var _local_2:IGameObject = null;
         var _local_3:GaragePropertyData = null;
         var _local_4:int = 0;
         var _local_5:UpgradeableItemData = null;
         if(itemService.cacum(object) && itemService.getModificationIndex(object) == 0)
         {
            _local_1 = new Vector.<UpgradeableItemData>();
            for each(_local_2 in itemService.muceraqe(object))
            {
               Model.object = _local_2;
               _local_1.push(this.data());
               Model.popObject();
            }
            for each(_local_3 in getInitParam().properties)
            {
               _local_4 = 0;
               for each(_local_5 in _local_1)
               {
                  _local_4 = Math.max(_local_4,_local_5.getValue(_local_3.property).getPrecision());
               }
               for each(_local_5 in _local_1)
               {
                  _local_5.getValue(_local_3.property).setPrecision(_local_4);
               }
            }
         }
      }
      
      public function traceUpgrades() : void
      {
         var _local_1:UpgradableItemPropertyValue = null;
         var _local_2:String = itemService.getName(object);
         if(itemService.cacum(object))
         {
            _local_2 += " M" + itemService.getModificationIndex(object);
         }
         for each(_local_1 in this.data().properties)
         {
            _local_1.traceUpgrades();
         }
      }
      
      private function compare(_arg_1:UpgradableItemPropertyValue, _arg_2:UpgradableItemPropertyValue) : Number
      {
         var _local_3:Bekipudi = propertyService.getParams(_arg_1.getProperty());
         var _local_4:Bekipudi = propertyService.getParams(_arg_2.getProperty());
         var _local_5:int = _local_3 != null ? int(_local_3.byqohes) : int(0);
         var _local_6:int = _local_4 != null ? int(_local_4.byqohes) : int(0);
         if(_local_5 < _local_6)
         {
            return -1;
         }
         if(_local_5 > _local_6)
         {
            return 1;
         }
         return 0;
      }
      
      private function data() : UpgradeableItemData
      {
         return UpgradeableItemData(getData(UpgradeableItemData));
      }
      
      public function objectUnloaded() : void
      {
         clearData(UpgradeableItemData);
      }
   }
}

