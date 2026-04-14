package projects.tanks.client.battleselect.model.battleselect.create
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class BattleCreateModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:BattleCreateModelServer;
      
      private var client:IBattleCreateModelBase = IBattleCreateModelBase(this);
      
      private var modelId:Long = Long.getLong(0,300090002);
      
      private var _createFailedBattleCreateDisabledId:Long = Long.getLong(0,300090002);
      
      private var _createFailedServerIsHaltingId:Long = Long.getLong(0,300090003);
      
      private var _createFailedTooManyBattlesFromYouId:Long = Long.getLong(0,300090004);
      
      private var _createFailedYouAreBannedId:Long = Long.getLong(0,300090005);
      
      private var _setFilteredBattleNameId:Long = Long.getLong(0,300090006);
      
      private var _setFilteredBattleName_nameCodec:ICodec;
      
      public function BattleCreateModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new BattleCreateModelServer(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : BattleCreateCC
      {
         return BattleCreateCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this._createFailedBattleCreateDisabledId:
               this.client.createFailedBattleCreateDisabled();
               return;
            case this._createFailedServerIsHaltingId:
               this.client.createFailedServerIsHalting();
               return;
            case this._createFailedTooManyBattlesFromYouId:
               this.client.createFailedTooManyBattlesFromYou();
               return;
            case this._createFailedYouAreBannedId:
               this.client.createFailedYouAreBanned();
               return;
            case this._setFilteredBattleNameId:
               this.client.setFilteredBattleName(String(this._setFilteredBattleName_nameCodec.decode(_arg_2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

