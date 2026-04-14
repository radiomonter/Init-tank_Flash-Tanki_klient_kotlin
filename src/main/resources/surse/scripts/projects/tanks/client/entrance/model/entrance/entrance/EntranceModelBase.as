package projects.tanks.client.entrance.model.entrance.entrance
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.impl.Model;
   
   public class EntranceModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      private var client:IEntranceModelBase = IEntranceModelBase(this);
      
      private var modelId:Long = Long.getLong(0,300020011);
      
      public function EntranceModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
      }
      
      protected function getInitParam() : EntranceModelCC
      {
         return EntranceModelCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         var _local_3:* = _arg_1;
         var _loc4_:int = 0;
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

