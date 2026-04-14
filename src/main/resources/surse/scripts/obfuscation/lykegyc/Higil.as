package obfuscation.lykegyc
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.battlefield.models.bonus.battle.Nasyvozuq;
   
   public class Higil extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Cymy;
      
      private var client:Cok = Cok(this);
      
      private var modelId:Long = Long.getLong(499495185,-1001709329);
      
      private var gytevewu:Long = Long.getLong(1110230456,-1498226724);
      
      private var jufedow:ICodec;
      
      private var bala:Long = Long.getLong(947041522,265172046);
      
      private var kobybe:ICodec;
      
      private var wiqosad:Long = Long.getLong(1746264244,602761789);
      
      private var wumaguc:ICodec;
      
      private var dawinobyv:Long = Long.getLong(1980545667,907256776);
      
      private var raqidy:ICodec;
      
      private var rop:Long = Long.getLong(325483057,2045730824);
      
      private var necehe:ICodec;
      
      public function Higil()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Cymy(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Robepawo
      {
         return Robepawo(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.gytevewu:
               return;
            case this.bala:
               return;
            case this.wiqosad:
               return;
            case this.dawinobyv:
               return;
            case this.rop:
               this.client.nehuzok(this.necehe.decode(_arg_2) as Vector.<Nasyvozuq>);
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

