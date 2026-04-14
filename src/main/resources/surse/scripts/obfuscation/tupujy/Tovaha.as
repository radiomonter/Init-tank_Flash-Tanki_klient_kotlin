package obfuscation.tupujy
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
   
   public class Tovaha
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var dyrulypuj:Long = Long.getLong(1226168606,1892142748);
      
      private var nuteqohyl:ICodec;
      
      private var diciga:ICodec;
      
      private var sot:ICodec;
      
      private var lupukymy:ICodec;
      
      private var bycyp:ICodec;
      
      private var hotif:Long = Long.getLong(36271653,-1590968991);
      
      private var risur:ICodec;
      
      private var pabypus:Long = Long.getLong(744810110,-807135961);
      
      private var cosagaryg:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Tovaha(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(INetworker));
      }
      
      public function gepiq(_arg_1:int, _arg_2:Vector.<ClientObject>, _arg_3:Vector.<int>, _arg_4:Vector.<Vector3d>, _arg_5:Vector.<Vector3d>) : void
      {
         var _local_8:ClientObject = null;
         var _local_9:Vector3d = null;
         var _local_10:Object = null;
         var _local_6:Array = new Array();
         var _local_7:Array = new Array();
         for each(_local_8 in _arg_2)
         {
            _local_6.push(_local_8.id);
         }
         for each(_local_9 in _arg_5)
         {
            _local_7.push(_local_9);
         }
         _local_10 = new Object();
         _local_10.physTime = _arg_1;
         _local_10.targets = _local_6;
         _local_10.targetIncarnations = _arg_3;
         _local_10.targetPositions = _arg_4;
         _local_10.hitPositions = _local_7;
         this.network.send("battle;fire_target;" + JSON.stringify(_local_10));
      }
      
      public function fycubi(_arg_1:int) : void
      {
         var _local_2:Object = new Object();
         _local_2.physTime = _arg_1;
         this.network.send("battle;start_fire;" + JSON.stringify(_local_2));
      }
      
      public function ciceh(_arg_1:int) : void
      {
         var _local_2:Object = new Object();
         _local_2.physTime = _arg_1;
         this.network.send("battle;stop_fire;" + JSON.stringify(_local_2));
      }
   }
}

