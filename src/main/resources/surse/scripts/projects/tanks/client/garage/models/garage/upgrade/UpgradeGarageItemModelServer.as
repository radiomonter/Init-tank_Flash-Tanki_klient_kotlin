package projects.tanks.client.garage.models.garage.upgrade
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.type.IGameObject;
   import projects.tanks.client.garage.models.item.properties.ItemGarageProperty;
   
   public class UpgradeGarageItemModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _instantUpgradeId:Long = Long.getLong(0,300040011);
      
      private var _instantUpgrade_lightItemCodec:ICodec;
      
      private var _instantUpgrade_propertyCodec:ICodec;
      
      private var _instantUpgrade_numLevelsCodec:ICodec;
      
      private var _instantUpgrade_expectedPriceCodec:ICodec;
      
      private var _speedUpId:Long = Long.getLong(0,300040012);
      
      private var _speedUp_lightItemCodec:ICodec;
      
      private var _speedUp_expectedPriceCodec:ICodec;
      
      private var _upgradeItemId:Long = Long.getLong(0,300040013);
      
      private var _upgradeItem_lightItemCodec:ICodec;
      
      private var _upgradeItem_propertyCodec:ICodec;
      
      private var _upgradeItem_expectedPriceCodec:ICodec;
      
      private var _upgradeItem_expectedTimeInSecondsCodec:ICodec;
      
      private var model:IModel;
      
      public function UpgradeGarageItemModelServer(param1:IModel)
      {
         super();
         this.model = param1;
         trace("!!MODEL:",this.model);
         var _loc2_:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_loc2_,_loc2_,new OptionalMap());
      }
      
      public function instantUpgrade(param1:IGameObject, param2:ItemGarageProperty, param3:int, param4:int) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("garage;instantUpgrade;" + param1.name + ";" + param2.name + ";" + param3 + ";" + param4);
      }
      
      public function speedUp(param1:IGameObject, param2:int) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("garage;speedUp;" + param1.name + ";" + param2);
      }
      
      public function upgradeItem(param1:IGameObject, param2:ItemGarageProperty, param3:int, param4:int) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("garage;upgradeItem;" + param1.name + ";" + param2.name + ";" + param3 + ";" + param4);
      }
   }
}

