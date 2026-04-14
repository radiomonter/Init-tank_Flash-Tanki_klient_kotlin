package obfuscation.hufikutu
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
   
   public class Jyfymur
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var zyjitatop:Long = Long.getLong(448278927,-679337769);
      
      private var fur:ICodec;
      
      private var cesot:ICodec;
      
      private var wusuni:ICodec;
      
      private var hivane:ICodec;
      
      private var gybinaver:ICodec;
      
      private var zefitabaq:ICodec;
      
      private var wopy:ICodec;
      
      private var byreqa:Long = Long.getLong(1791455660,457007003);
      
      private var nonomy:ICodec;
      
      private var qigojuq:Long = Long.getLong(747256245,1216344676);
      
      private var fot:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Jyfymur(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(INetworker));
      }
      
      public function jytig(_arg_1:int, _arg_2:Vector3d, _arg_3:Vector.<ClientObject>, _arg_4:Vector.<Vector3d>, _arg_5:Vector.<int>, _arg_6:Vector.<Vector3d>, _arg_7:Vector.<Vector3d>) : void
      {
         var _local_10:ClientObject = null;
         var _local_11:Vector3d = null;
         var _local_12:Object = null;
         var _local_8:Array = new Array();
         var _local_9:Array = new Array();
         for each(_local_10 in _arg_3)
         {
            _local_8.push(_local_10.id);
         }
         for each(_local_11 in _arg_4)
         {
            _local_9.push(_local_11);
         }
         _local_12 = new Object();
         _local_12.physTime = _arg_1;
         _local_12.staticHitPosition = _arg_2;
         _local_12.targets = _local_8;
         _local_12.hitPositions = _local_9;
         _local_12.incarnations = _arg_5;
         _local_12.targetPositions = _arg_6;
         this.network.send("battle;fire_target;" + JSON.stringify(_local_12));
      }
      
      public function hiq(_arg_1:int) : void
      {
         var _local_2:Object = new Object();
         _local_2.physTime = _arg_1;
         this.network.send("battle;fire_dummy;" + JSON.stringify(_local_2));
      }
      
      public function mumyg(_arg_1:int) : void
      {
         var _local_2:Object = new Object();
         _local_2.physTime = _arg_1;
         this.network.send("battle;start_fire;" + JSON.stringify(_local_2));
      }
   }
}

