package obfuscation.byg
{
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import obfuscation.kofen.Vector3d;
   import platform.client.fp10.core.model.IModel;
   
   public class Tem
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var zyjitatop:Long = Long.getLong(158866586,759986797);
      
      private var fur:ICodec;
      
      private var vacuso:Long = Long.getLong(1766359006,1664614075);
      
      private var niza:ICodec;
      
      private var dytaz:ICodec;
      
      private var sine:Long = Long.getLong(1692205066,-158539970);
      
      private var ledygepo:ICodec;
      
      private var gaw:ICodec;
      
      private var bozazok:ICodec;
      
      private var qofypokam:ICodec;
      
      private var wafos:ICodec;
      
      private var setyken:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Tem(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(INetworker));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function jytig(_arg_1:int) : void
      {
         var _local_2:Object = new Object();
         _local_2.physTime = _arg_1;
         this.network.send("battle;fire;" + JSON.stringify(_local_2));
      }
      
      public function cynebarej(_arg_1:int, _arg_2:Vector3d) : void
      {
         var _local_3:Object = new Object();
         _local_3.physTime = _arg_1;
         _local_3.hitPosition = _arg_2;
         this.network.send("battle;fire_static;" + JSON.stringify(_local_3));
      }
      
      public function vitu(_arg_1:int, _arg_2:ClientObject, _arg_3:int, _arg_4:Vector3d, _arg_5:Vector3d, _arg_6:Vector3d) : void
      {
         var _local_7:Object = new Object();
         _local_7.physTime = _arg_1;
         _local_7.target = _arg_2.id;
         _local_7.incration = _arg_3;
         _local_7.targetPosition = _arg_4;
         _local_7.hitPosition = _arg_5;
         this.network.send("battle;fire_target;" + JSON.stringify(_local_7));
      }
   }
}

