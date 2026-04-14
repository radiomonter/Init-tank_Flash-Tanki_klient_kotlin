package obfuscation.kewic
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import obfuscation.kofen.Vector3d;
   import platform.client.fp10.core.model.IModel;
   
   public class Palina
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var zyjitatop:Long = Long.getLong(1356868511,460931703);
      
      private var fur:ICodec;
      
      private var qyj:ICodec;
      
      private var mizabev:ICodec;
      
      private var galo:ICodec;
      
      private var sifojep:ICodec;
      
      private var byreqa:Long = Long.getLong(1432853658,-446317051);
      
      private var nonomy:ICodec;
      
      private var bijimun:Long = Long.getLong(1659660949,-434756778);
      
      private var qon:ICodec;
      
      private var vefojaliv:ICodec;
      
      private var ziceforys:ICodec;
      
      private var canicuk:Long = Long.getLong(1733814889,1388397267);
      
      private var rabynage:ICodec;
      
      private var qybyva:ICodec;
      
      private var divi:ICodec;
      
      private var nih:ICodec;
      
      private var lawujot:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Palina(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(INetworker));
      }
      
      public function jytig(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:int, _arg_5:int) : void
      {
         var _local_6:Object = new Object();
         _local_6.physTime = _arg_1;
         _local_6.shotId = _arg_2;
         _local_6.shotDirectionX = _arg_3;
         _local_6.shotDirectionY = _arg_4;
         _local_6.shotDirectionZ = _arg_5;
         this.network.send("battle;fire;" + JSON.stringify(_local_6));
      }
      
      public function hiq(_arg_1:int) : void
      {
         var _local_2:Object = new Object();
         _local_2.physTime = _arg_1;
         this.network.send("battle;fire_dummy;" + JSON.stringify(_local_2));
      }
      
      public function sivi(_arg_1:int, _arg_2:int, _arg_3:Vector.<Vector3d>) : void
      {
         var _local_4:Object = new Object();
         _local_4.physTime = _arg_1;
         _local_4.shotId = _arg_2;
         _local_4.impactPoints = _arg_3;
         this.network.send("battle;fire_static;" + JSON.stringify(_local_4));
      }
      
      public function nuzahiti(_arg_1:int, _arg_2:ClientObject, _arg_3:int, _arg_4:Vector3d, _arg_5:Vector.<Vector3d>) : void
      {
         var _local_6:Object = new Object();
         _local_6.physTime = _arg_1;
         _local_6.target = _arg_2.id;
         _local_6.shotId = _arg_3;
         _local_6.hitPosition = _arg_4;
         _local_6.impactPoints = _arg_5;
         this.network.send("battle;fire_target;" + JSON.stringify(_local_6));
      }
   }
}

