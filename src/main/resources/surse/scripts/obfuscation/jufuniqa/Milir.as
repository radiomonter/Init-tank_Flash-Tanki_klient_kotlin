package obfuscation.jufuniqa
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Milir extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Fypoko;
      
      private var client:Cyzabosy = Cyzabosy(this);
      
      private var modelId:Long = Long.getLong(432617209,-1426923357);
      
      private var lubeh:Long = Long.getLong(1322262736,-1419663103);
      
      private var galyq:ICodec;
      
      public function Milir()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Fypoko(IModel(this));
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.lubeh:
               this.client.showWeeklyQuestReward(this.galyq.decode(_arg_2) as Vector.<Cyfu>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

