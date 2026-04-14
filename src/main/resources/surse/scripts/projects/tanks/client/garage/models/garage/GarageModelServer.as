package projects.tanks.client.garage.models.garage
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class GarageModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _itemBoughtId:Long = Long.getLong(0,300040000);
      
      private var _itemBought_lightItemCodec:ICodec;
      
      private var _itemBought_countCodec:ICodec;
      
      private var _itemBought_expectedPriceCodec:ICodec;
      
      private var _itemMountedId:Long = Long.getLong(0,300040001);
      
      private var _itemMounted_lightItemCodec:ICodec;
      
      private var _kitBoughtId:Long = Long.getLong(0,300040002);
      
      private var _kitBought_lightItemCodec:ICodec;
      
      private var _kitBought_expectedPriceCodec:ICodec;
      
      private var _nextModificationBoughtId:Long = Long.getLong(0,300040003);
      
      private var _nextModificationBought_oldLightItemCodec:ICodec;
      
      private var _nextModificationBought_expectedPriceCodec:ICodec;
      
      private var _readyToReloadId:Long = Long.getLong(0,300040004);
      
      private var model:IModel;
      
      public function GarageModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
         this._itemBought_lightItemCodec = this.protocol.getCodec(new TypeCodecInfo(IGameObject,false));
         this._itemBought_countCodec = this.protocol.getCodec(new TypeCodecInfo(int,false));
         this._itemBought_expectedPriceCodec = this.protocol.getCodec(new TypeCodecInfo(int,false));
         this._itemMounted_lightItemCodec = this.protocol.getCodec(new TypeCodecInfo(IGameObject,false));
         this._kitBought_lightItemCodec = this.protocol.getCodec(new TypeCodecInfo(IGameObject,false));
         this._kitBought_expectedPriceCodec = this.protocol.getCodec(new TypeCodecInfo(int,false));
         this._nextModificationBought_oldLightItemCodec = this.protocol.getCodec(new TypeCodecInfo(IGameObject,false));
         this._nextModificationBought_expectedPriceCodec = this.protocol.getCodec(new TypeCodecInfo(int,false));
      }
      
      public function itemBought(_arg_1:IGameObject, _arg_2:int, _arg_3:int) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("garage;try_buy_item;" + _arg_1.name + ";" + _arg_2);
      }
      
      public function itemMounted(_arg_1:IGameObject) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("garage;try_mount_item;" + _arg_1.name);
      }
      
      public function kitBought(_arg_1:IGameObject, _arg_2:int) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("garage;kitBought;" + _arg_1.name);
      }
      
      public function nextModificationBought(_arg_1:IGameObject, _arg_2:int) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("garage;try_buy_item;" + _arg_1.name + ";" + 1);
      }
      
      public function readyToReload() : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _local_1:SpaceCommand = new SpaceCommand(Model.object.id,this._readyToReloadId,this.protocolBuffer);
         var _local_2:IGameObject = Model.object;
         var _local_3:ISpace = _local_2.space;
         _local_3.commandSender.sendCommand(_local_1);
         this.protocolBuffer.optionalMap.clear();
      }
   }
}

