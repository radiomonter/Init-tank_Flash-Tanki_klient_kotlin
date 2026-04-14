package projects.tanks.client.battlefield.models.battle.battlefield
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.CollectionCodecInfo;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Float;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class Mijitew
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var denegu:Long = Long.getLong(312624829,1518890877);
      
      private var tuqud:ICodec;
      
      private var dypiv:Long = Long.getLong(312624829,1518890663);
      
      private var doqo:ICodec;
      
      private var zywa:Long = Long.getLong(1789749753,1049490765);
      
      private var kemowow:ICodec;
      
      private var tinena:ICodec;
      
      private var vabutepim:Long = Long.getLong(312624829,1518890261);
      
      private var model:IModel;
      
      public function Mijitew(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
         this.tuqud = this.protocol.getCodec(new CollectionCodecInfo(new TypeCodecInfo(int,false),false,1));
         this.doqo = this.protocol.getCodec(new TypeCodecInfo(int,false));
         this.tinena = this.protocol.getCodec(new TypeCodecInfo(Float,false));
      }
      
      public function nybofe(_arg_1:Vector.<int>) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("battle;dg");
      }
      
      public function vucigazy(_arg_1:int) : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("battle;data_error;" + _arg_1);
      }
      
      public function keqokut() : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _local_1:SpaceCommand = new SpaceCommand(Model.object.id,this.vabutepim,this.protocolBuffer);
         var _local_2:IGameObject = Model.object;
         var _local_3:ISpace = _local_2.space;
         _local_3.commandSender.sendCommand(_local_1);
         this.protocolBuffer.optionalMap.clear();
      }
   }
}

