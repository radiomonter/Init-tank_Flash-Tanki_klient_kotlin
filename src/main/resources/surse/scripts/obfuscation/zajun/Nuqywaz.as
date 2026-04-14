package obfuscation.zajun
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
   
   public class Nuqywaz
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var naqym:Long = Long.getLong(1850967873,1410393465);
      
      private var zifefi:Long = Long.getLong(665718601,863056095);
      
      private var hyvypad:ICodec;
      
      private var lyw:ICodec;
      
      private var byretifo:ICodec;
      
      private var hebo:ICodec;
      
      private var zusem:ICodec;
      
      private var hyfupoty:ICodec;
      
      private var fubylati:ICodec;
      
      private var bys:Long = Long.getLong(384666897,-1041026192);
      
      private var huwopido:ICodec;
      
      private var jejomive:Long = Long.getLong(1060379432,313263560);
      
      private var hypoka:ICodec;
      
      private var kidu:ICodec;
      
      private var ric:ICodec;
      
      private var tija:ICodec;
      
      private var kiwa:ICodec;
      
      private var wykevudod:ICodec;
      
      private var tefajo:ICodec;
      
      private var wytonisi:Long = Long.getLong(717480200,-1898093994);
      
      private var model:IModel;
      
      private var network:Network = OSGi.getInstance().getService(INetworker) as Network;
      
      public function Nuqywaz(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
      }
      
      public function fytet() : void
      {
         this.network.send("battle;activate_manual_targeting");
      }
      
      public function mepekicy(_arg_1:int, _arg_2:Vector3d, _arg_3:ClientObject, _arg_4:Vector3d, _arg_5:int, _arg_6:Vector3d, _arg_7:Vector3d) : void
      {
         var _local_8:Object = new Object();
         _local_8.physTime = _arg_1;
         _local_8.staticHitPosition = _arg_2;
         _local_8.target = _arg_3 != null ? _arg_3.id : null;
         _local_8.hitPoint = _arg_4;
         _local_8.incarnation = _arg_5;
         _local_8.targetPosition = _arg_6;
         _local_8.targetPositionGlobal = _arg_7;
         this.network.send("battle;fire_target;" + JSON.stringify(_local_8));
      }
      
      public function wulasydym(_arg_1:int) : void
      {
         this.network.send("battle;begin_enegry_drain;" + _arg_1);
      }
      
      public function baco(_arg_1:int, _arg_2:Vector3d, _arg_3:ClientObject, _arg_4:Vector3d, _arg_5:int, _arg_6:Vector3d, _arg_7:Vector3d) : void
      {
         var _local_8:Object = new Object();
         _local_8.physTime = _arg_1;
         _local_8.staticHitPosition = _arg_2;
         _local_8.target = _arg_3 != null ? _arg_3.id : null;
         _local_8.hitPoint = _arg_4;
         _local_8.incarnation = _arg_5;
         _local_8.targetPosition = _arg_6;
         _local_8.targetPositionGlobal = _arg_7;
         this.network.send("battle;quick_shot_shaft;" + JSON.stringify(_local_8));
      }
      
      public function vemiw() : void
      {
         this.network.send("battle;stop_manual_targeting");
      }
   }
}

