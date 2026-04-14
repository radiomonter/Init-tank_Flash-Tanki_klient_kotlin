package projects.tanks.client.battleselect.model.battleselect
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
   
   public class BattleSelectModelServer
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var _onSelectId:Long = Long.getLong(0,300090024);
      
      private var _onSelect_itemCodec:ICodec;
      
      private var _searchId:Long = Long.getLong(0,300090025);
      
      private var _search_battleIdCodec:ICodec;
      
      private var model:IModel;
      
      public function BattleSelectModelServer(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
         this._onSelect_itemCodec = this.protocol.getCodec(new TypeCodecInfo(IGameObject,false));
         this._search_battleIdCodec = this.protocol.getCodec(new TypeCodecInfo(Long,false));
      }
      
      public function onSelect(_arg_1:String) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("battle_select;select;" + _arg_1);
      }
      
      public function search(_arg_1:String) : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         this._search_battleIdCodec.encode(this.protocolBuffer,_arg_1);
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _local_2:SpaceCommand = new SpaceCommand(Model.object.id,this._searchId,this.protocolBuffer);
         var _local_3:IGameObject = Model.object;
         var _local_4:ISpace = _local_3.space;
         _local_4.commandSender.sendCommand(_local_2);
         this.protocolBuffer.optionalMap.clear();
      }
   }
}

