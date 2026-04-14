package obfuscation.fador
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Howevono extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Reby;
      
      private var client:Jenapery = Jenapery(this);
      
      private var modelId:Long = Long.getLong(1044301282,-2025301046);
      
      private var zovusyvoj:Long = Long.getLong(182699568,659372466);
      
      private var maduralug:Long = Long.getLong(182698837,-1030515090);
      
      public function Howevono()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Reby(IModel(this));
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.zovusyvoj:
               this.client.notifyDailyQuestCompleted();
               return;
            case this.maduralug:
               this.client.notifyDailyQuestGenerated();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

