package obfuscation.pejug
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import obfuscation.qenomy.Gipafili;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class Fyv extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Fyg;
      
      private var client:Ruperip = Ruperip(this);
      
      private var modelId:Long = Long.getLong(1726782619,1524609945);
      
      private var dyl:Long = Long.getLong(205404481,2036669945);
      
      private var kubulet:ICodec;
      
      private var rucivid:ICodec;
      
      private var nireve:Long = Long.getLong(1555095151,929348553);
      
      private var wypo:ICodec;
      
      private var pugedim:Long = Long.getLong(1017385554,-1412933910);
      
      private var susat:ICodec;
      
      private var mawaj:ICodec;
      
      private var qyte:Long = Long.getLong(1483129213,1398282388);
      
      private var mizyzyfa:ICodec;
      
      public function Fyv()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Fyg(IModel(this));
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.dyl:
               this.client.showQuestWindow(this.kubulet.decode(_arg_2) as Vector.<Magyp>,Gipafili(this.rucivid.decode(_arg_2)));
               return;
            case this.nireve:
               this.client.showQuestWindowWithoutDailyQuests(Gipafili(this.wypo.decode(_arg_2)));
               return;
            case this.pugedim:
               this.client.skipDailyQuest(Long(this.susat.decode(_arg_2)),Magyp(this.mawaj.decode(_arg_2)));
               return;
            case this.qyte:
               this.client.takeDailyQuestPrize(Long(this.mizyzyfa.decode(_arg_2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

