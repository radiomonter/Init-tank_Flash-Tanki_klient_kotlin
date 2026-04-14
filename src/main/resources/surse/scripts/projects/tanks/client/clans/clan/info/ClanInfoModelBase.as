package projects.tanks.client.clans.clan.info
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class ClanInfoModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanInfoModelServer;
      
      private var client:IClanInfoModelBase = IClanInfoModelBase(this);
      
      private var modelId:Long = Long.getLong(2040178503,1134391066);
      
      public function ClanInfoModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanInfoModelServer(IModel(this));
      }
      
      protected function getInitParam() : ClanInfoCC
      {
         return ClanInfoCC(initParams[Model.object]);
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

