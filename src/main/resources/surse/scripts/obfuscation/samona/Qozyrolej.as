package obfuscation.samona
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
   
   public class Qozyrolej
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var zyjitatop:Long = Long.getLong(1277019392,-355104349);
      
      private var fur:ICodec;
      
      private var pem:ICodec;
      
      private var qyj:ICodec;
      
      private var nodawapan:ICodec;
      
      private var byreqa:Long = Long.getLong(357444731,388730325);
      
      private var nonomy:ICodec;
      
      private var murynu:ICodec;
      
      private var bijimun:Long = Long.getLong(130637440,377170052);
      
      private var qon:ICodec;
      
      private var vefojaliv:ICodec;
      
      private var cofyciv:ICodec;
      
      private var canicuk:Long = Long.getLong(56483500,-1445983993);
      
      private var rabynage:ICodec;
      
      private var divi:ICodec;
      
      private var qybyva:ICodec;
      
      private var nih:ICodec;
      
      private var misygiz:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Qozyrolej(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(INetworker));
      }
      
      public function jytig(_arg_1:int, _arg_2:int, _arg_3:int, _arg_4:Vector3d) : void
      {
         var _local_5:Object = new Object();
         _local_5.physTime = _arg_1;
         _local_5.currentBarrel = _arg_2;
         _local_5.shotId = _arg_3;
         _local_5.shotDirection = _arg_4;
         this.network.send("battle;fire;" + JSON.stringify(_local_5));
      }
      
      public function hiq(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Object = new Object();
         _local_3.physTime = _arg_1;
         _local_3.currentBarrel = _arg_2;
         this.network.send("battle;fire_dummy;" + JSON.stringify(_local_3));
      }
      
      public function sivi(_arg_1:int, _arg_2:int, _arg_3:Vector3d) : void
      {
         var _local_4:Object = new Object();
         _local_4.physTime = _arg_1;
         _local_4.currentBarrel = _arg_2;
         _local_4.hitPoint = _arg_3;
         this.network.send("battle;fire_static;" + JSON.stringify(_local_4));
      }
      
      public function nuzahiti(_arg_1:int, _arg_2:int, _arg_3:ClientObject, _arg_4:Vector3d, _arg_5:Vector3d) : void
      {
         var _local_6:Object = new Object();
         _local_6.physTime = _arg_1;
         _local_6.shotId = _arg_2;
         _local_6.target = _arg_3.id;
         _local_6.targetPosition = _arg_4;
         _local_6.hitPoint = _arg_5;
         this.network.send("battle;fire_target;" + JSON.stringify(_local_6));
      }
   }
}

