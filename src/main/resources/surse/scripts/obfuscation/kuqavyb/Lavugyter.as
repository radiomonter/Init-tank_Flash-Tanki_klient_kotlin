package obfuscation.kuqavyb
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
   
   public class Lavugyter
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var jidomi:Long = Long.getLong(304771021,-505618508);
      
      private var gocubuwak:ICodec;
      
      private var wafy:Long = Long.getLong(119662358,318565694);
      
      private var puzapyno:ICodec;
      
      private var jeqysu:ICodec;
      
      private var mibijaj:Long = Long.getLong(193816297,2141719739);
      
      private var bita:ICodec;
      
      private var pyci:ICodec;
      
      private var guryna:ICodec;
      
      private var norasysup:ICodec;
      
      private var vev:ICodec;
      
      private var sunur:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Lavugyter(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.network = Network(OSGi.getInstance().getService(INetworker));
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function cyvog(_arg_1:int) : void
      {
         var _local_2:Object = new Object();
         _local_2.physTime = _arg_1;
         this.network.send("battle;fire;" + JSON.stringify(_local_2));
      }
      
      public function ril(_arg_1:int, _arg_2:Vector3d, _arg_3:Vector.<String>, _arg_4:Vector.<Number>) : void
      {
         var _local_7:String = null;
         var _local_8:Number = NaN;
         var _local_9:Object = null;
         var _local_5:Array = new Array();
         var _local_6:Array = new Array();
         for each(_local_7 in _arg_3)
         {
            _local_5.push(_local_7);
         }
         for each(_local_8 in _arg_4)
         {
            _local_6.push(_local_8);
         }
         _local_9 = new Object();
         _local_9.physTime = _arg_1;
         _local_9.hitPoint = _arg_2;
         _local_9.splashTargetIds = _local_5;
         _local_9.splashTargetDistances = _local_6;
         this.network.send("battle;fire_static;" + JSON.stringify(_local_9));
      }
      
      public function tapoly(_arg_1:int, _arg_2:Vector3d, _arg_3:ClientObject, _arg_4:int, _arg_5:Vector3d, _arg_6:Vector3d, _arg_7:Vector.<String>, _arg_8:Vector.<Number>) : void
      {
         var _local_11:String = null;
         var _local_12:Number = NaN;
         var _local_13:Object = null;
         var _local_9:Array = new Array();
         var _local_10:Array = new Array();
         for each(_local_11 in _arg_7)
         {
            _local_9.push(_local_11);
         }
         for each(_local_12 in _arg_8)
         {
            _local_10.push(_local_12);
         }
         _local_13 = new Object();
         _local_13.physTime = _arg_1;
         _local_13.relativeHitPoint = _arg_2;
         _local_13.target = _arg_3.id;
         _local_13.targetIncarnation = _arg_4;
         _local_13.targetPosition = _arg_5;
         _local_13.hitPointWorld = _arg_6;
         _local_13.splashTargetIds = _local_9;
         _local_13.splashTargetDistances = _local_10;
         this.network.send("battle;fire_target;" + JSON.stringify(_local_13));
      }
   }
}

