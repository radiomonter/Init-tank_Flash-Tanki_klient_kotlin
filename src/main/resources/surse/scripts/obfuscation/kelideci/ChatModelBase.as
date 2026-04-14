package obfuscation.kelideci
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import obfuscation.bude.BattleTeam;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class ChatModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ChatModelServer;
      
      private var client:IChatModelBase = IChatModelBase(this);
      
      private var modelId:Long = Long.getLong(1896886505,1439133662);
      
      private var gar:Long = Long.getLong(646043180,-1436998681);
      
      private var haqer:ICodec;
      
      private var funywyfit:ICodec;
      
      private var zykybulig:ICodec;
      
      private var pite:Long = Long.getLong(1034571197,-1592026199);
      
      private var bufobez:ICodec;
      
      private var casuco:ICodec;
      
      private var camec:Long = Long.getLong(378844051,-1452201622);
      
      private var pibuhuril:ICodec;
      
      private var rubawif:Long = Long.getLong(939004753,1106765308);
      
      private var batyd:ICodec;
      
      private var sovilyj:ICodec;
      
      private var fehubusa:ICodec;
      
      private var cytagepa:Long = Long.getLong(750015069,1108412070);
      
      private var rifugulyj:ICodec;
      
      public function ChatModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ChatModelServer(IModel(this));
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.gar:
               this.client.addMessage(String(this.haqer.decode(_arg_2)),String(this.funywyfit.decode(_arg_2)),BattleTeam(this.zykybulig.decode(_arg_2)));
               return;
            case this.pite:
               this.client.raki(String(this.bufobez.decode(_arg_2)),String(this.casuco.decode(_arg_2)));
               return;
            case this.camec:
               this.client.fikaqu(String(this.pibuhuril.decode(_arg_2)));
               return;
            case this.rubawif:
               this.client.vepebuk(String(this.batyd.decode(_arg_2)),String(this.sovilyj.decode(_arg_2)),BattleTeam(this.fehubusa.decode(_arg_2)));
               return;
            case this.cytagepa:
               this.client.nyrabyt(String(this.rifugulyj.decode(_arg_2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

