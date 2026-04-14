package obfuscation.hasitaze
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
   
   public class Caqeziryn
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var dabevagis:Long = Long.getLong(315477850,74416950);
      
      private var sywezap:ICodec;
      
      private var kanige:Long = Long.getLong(724350021,-1874612855);
      
      private var haca:ICodec;
      
      private var fafutun:ICodec;
      
      private var rocelud:ICodec;
      
      private var qune:ICodec;
      
      private var nehu:Long = Long.getLong(2132283949,89958307);
      
      private var dul:ICodec;
      
      private var myzufilom:Long = Long.getLong(315880994,956762724);
      
      private var hyzyg:ICodec;
      
      private var savelohyk:ICodec;
      
      private var sapat:ICodec;
      
      private var nivicakeq:ICodec;
      
      private var model:IModel;
      
      private var network:Network;
      
      public function Caqeziryn(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.network = Network(OSGi.getInstance().getService(INetworker));
      }
      
      public function doverizu(_arg_1:int) : void
      {
         var _local_2:Object = new Object();
         _local_2.physTime = _arg_1;
         this.network.send("battle;reset_target;" + JSON.stringify(_local_2));
      }
      
      public function juvilyvyb(_arg_1:int, _arg_2:ClientObject, _arg_3:int, _arg_4:Vector3d) : void
      {
         var _local_5:Object = new Object();
         _local_5.physTime = _arg_1;
         _local_5.target = _arg_2.id;
         _local_5.incarnation = _arg_3;
         _local_5.localHitPoint = _arg_4;
         this.network.send("battle;start_fire;" + JSON.stringify(_local_5));
      }
      
      public function qadazudas(_arg_1:int) : void
      {
         var _local_2:Object = new Object();
         _local_2.physTime = _arg_1;
         this.network.send("battle;stop_fire;" + JSON.stringify(_local_2));
      }
      
      public function hivuca(_arg_1:int, _arg_2:int, _arg_3:Vector3d, _arg_4:Vector3d) : void
      {
         var _local_5:Object = new Object();
         _local_5.physTime = _arg_1;
         _local_5.incarnation = _arg_2;
         _local_5.targetPosition = _arg_3;
         _local_5.localHitPoint = _arg_4;
         this.network.send("battle;fire_target;" + JSON.stringify(_local_5));
      }
   }
}

