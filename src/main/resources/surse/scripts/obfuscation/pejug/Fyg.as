package obfuscation.pejug
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.OptionalMap;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import flash.utils.ByteArray;
   import fominskiy.networking.INetworker;
   import fominskiy.networking.Network;
   import platform.client.fp10.core.model.IModel;
   
   public class Fyg
   {
      
      private var protocol:IProtocol;
      
      private var protocolBuffer:ProtocolBuffer;
      
      private var pap:Long = Long.getLong(398629213,-361250798);
      
      private var model:IModel;
      
      public function Fyg(_arg_1:IModel)
      {
         super();
         this.model = _arg_1;
         var _local_2:ByteArray = new ByteArray();
         this.protocol = IProtocol(OSGi.getInstance().getService(IProtocol));
         this.protocolBuffer = new ProtocolBuffer(_local_2,_local_2,new OptionalMap());
      }
      
      public function pef() : void
      {
         Network(OSGi.getInstance().getService(INetworker)).send("lobby;openQuestWindow");
      }
   }
}

