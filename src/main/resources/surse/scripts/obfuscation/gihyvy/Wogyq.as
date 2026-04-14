package obfuscation.gihyvy
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
   import obfuscation.qusen.Pukimule;
   import obfuscation.qusen.Sunyva;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.network.command.SpaceCommand;
   import platform.client.fp10.core.type.IGameObject;
   import platform.client.fp10.core.type.ISpace;
   
   public class Wogyq
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var hyly:Long = Long.getLong(674088239,-466180297);
      
      private var hekukuwu:Long = Long.getLong(1469435049,418614378);
      
      private var ludo:ICodec;
      
      private var zycokofoj:ICodec;
      
      private var rigisy:ICodec;
      
      private var vepize:ICodec;
      
      private var juq:Long = Long.getLong(27305946,689085087);
      
      private var vezonycy:ICodec;
      
      private var veqigyhav:Long = Long.getLong(2114337908,577714981);
      
      private var bidovecy:ICodec;
      
      private var sisonepo:ICodec;
      
      private var nuhy:ICodec;
      
      private var guw:Long = Long.getLong(1028282615,1943158798);
      
      private var kijozeto:ICodec;
      
      private var mojaf:ICodec;
      
      private var haneg:ICodec;
      
      private var kudehyl:Long = Long.getLong(785096439,-1657218933);
      
      private var kurulovuc:ICodec;
      
      private var hyvi:ICodec;
      
      private var tobaq:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Wogyq(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(INetworker));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function zylojaj() : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _local_1:SpaceCommand = new SpaceCommand(Model.object.id,this.hyly,this.protocolBuffer);
         var _local_2:IGameObject = Model.object;
         var _local_3:ISpace = _local_2.space;
         _local_3.commandSender.sendCommand(_local_1);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function berypej(_arg_1:int, _arg_2:int, _arg_3:Pukimule, _arg_4:Number) : void
      {
         var _local_5:Object = new Object();
         _local_5.physTime = _arg_1;
         _local_5.specificationID = _arg_2;
         _local_5.position = _arg_3.position;
         _local_5.orientation = _arg_3.orientation;
         _local_5.linearVelocity = _arg_3.linearVelocity;
         _local_5.angularVelocity = _arg_3.angularVelocity;
         _local_5.control = _arg_3.control;
         _local_5.turretDirection = _arg_4;
         this.network.send("battle;fullMove;" + JSON.stringify(_local_5));
      }
      
      public function kel(_arg_1:Number) : void
      {
         ByteArray(this.protocolBuffer.writer).position = 0;
         ByteArray(this.protocolBuffer.writer).length = 0;
         this.vezonycy.encode(this.protocolBuffer,_arg_1);
         ByteArray(this.protocolBuffer.writer).position = 0;
         if(Model.object == null)
         {
            throw new Error("Execute method without model context.");
         }
         var _local_2:SpaceCommand = new SpaceCommand(Model.object.id,this.juq,this.protocolBuffer);
         var _local_3:IGameObject = Model.object;
         var _local_4:ISpace = _local_3.space;
         _local_4.commandSender.sendCommand(_local_2);
         this.protocolBuffer.optionalMap.clear();
      }
      
      public function leqizihy(_arg_1:int, _arg_2:int, _arg_3:Pukimule) : void
      {
         var _local_4:Object = new Object();
         _local_4.physTime = _arg_1;
         _local_4.specificationID = _arg_2;
         _local_4.position = _arg_3.position;
         _local_4.orientation = _arg_3.orientation;
         _local_4.linearVelocity = _arg_3.linearVelocity;
         _local_4.angularVelocity = _arg_3.angularVelocity;
         _local_4.control = _arg_3.control;
         this.network.send("battle;move;" + JSON.stringify(_local_4));
      }
      
      public function mim(_arg_1:int, _arg_2:int, _arg_3:int) : void
      {
         var _local_4:Object = new Object();
         _local_4.physTime = _arg_1;
         _local_4.specificationID = _arg_2;
         _local_4.control = _arg_3;
         this.network.send("battle;movementControl;" + JSON.stringify(_local_4));
      }
      
      public function jabazep(_arg_1:int, _arg_2:Sunyva, _arg_3:int) : void
      {
         var _local_4:Object = new Object();
         _local_4.physTime = _arg_1;
         _local_4.angle = _arg_2.angle;
         _local_4.control = _arg_2.control;
         _local_4.incarnation = _arg_3;
         this.network.send("battle;rotateTurret;" + JSON.stringify(_local_4));
      }
      
      public function setReadyToPlace() : void
      {
         this.network.send("battle;readyToPlace");
      }
   }
}

