package projects.tanks.client.clans.notifier
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class ClanNotifierModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanNotifierModelServer;
      
      private var client:IClanNotifierModelBase = IClanNotifierModelBase(this);
      
      private var modelId:Long = Long.getLong(1850785827,-2022019480);
      
      private var _sendDataId:Long = Long.getLong(2052398186,-511753871);
      
      private var _sendData_userDataCodec:ICodec;
      
      public function ClanNotifierModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanNotifierModelServer(IModel(this));
      }
      
      protected function getInitParam() : ClanNotifierData
      {
         return ClanNotifierData(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         var _loc3_:Long = _arg_1;
         switch(0)
         {
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

