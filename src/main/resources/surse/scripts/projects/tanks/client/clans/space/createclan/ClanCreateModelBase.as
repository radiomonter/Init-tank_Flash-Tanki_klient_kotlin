package projects.tanks.client.clans.space.createclan
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class ClanCreateModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:ClanCreateModelServer;
      
      private var client:IClanCreateModelBase = IClanCreateModelBase(this);
      
      private var modelId:Long = Long.getLong(1406824912,-478599334);
      
      private var _alreadyInClanId:Long = Long.getLong(224690586,33129736);
      
      private var _correctNameId:Long = Long.getLong(661618191,747527866);
      
      private var _correctTagId:Long = Long.getLong(255752141,-162666891);
      
      private var _nameIsIncorrectId:Long = Long.getLong(1686179352,1619108917);
      
      private var _notUniqueNameId:Long = Long.getLong(2117528051,-1228799124);
      
      private var _notUniqueTagId:Long = Long.getLong(899591349,1207281551);
      
      private var _otherErrorId:Long = Long.getLong(255677344,1199269997);
      
      private var _tagIsIncorrectId:Long = Long.getLong(180626480,535638748);
      
      public function ClanCreateModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new ClanCreateModelServer(IModel(this));
      }
      
      protected function getInitParam() : ClanCreateCC
      {
         return ClanCreateCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this._alreadyInClanId:
               this.client.alreadyInClan();
               return;
            case this._correctNameId:
               this.client.correctName();
               return;
            case this._correctTagId:
               this.client.correctTag();
               return;
            case this._nameIsIncorrectId:
               this.client.nameIsIncorrect();
               return;
            case this._notUniqueNameId:
               this.client.notUniqueName();
               return;
            case this._notUniqueTagId:
               this.client.notUniqueTag();
               return;
            case this._otherErrorId:
               this.client.otherError();
               return;
            case this._tagIsIncorrectId:
               this.client.tagIsIncorrect();
               return;
            default:
               return;
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

