package projects.tanks.client.panel.model.profile.userproperty
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class UserPropertyModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:UserPropertyModelServer;
      
      private var client:IUserPropertyModelBase = IUserPropertyModelBase(this);
      
      private var modelId:Long = Long.getLong(0,300050083);
      
      private var _changeCrystalId:Long = Long.getLong(0,300050077);
      
      private var _changeCrystal_changeByCodec:ICodec;
      
      private var _updateRankId:Long = Long.getLong(0,300050078);
      
      private var _updateRank_rankCodec:ICodec;
      
      private var _updateRank_scoreCodec:ICodec;
      
      private var _updateRank_currentRankScoreCodec:ICodec;
      
      private var _updateRank_nextRankScoreCodec:ICodec;
      
      private var _updateRank_bonusCrystalsCodec:ICodec;
      
      private var _updateScoreId:Long = Long.getLong(0,300050079);
      
      private var _updateScore_scoreCodec:ICodec;
      
      public function UserPropertyModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new UserPropertyModelServer(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : UserPropertyCC
      {
         return UserPropertyCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this._changeCrystalId:
               this.client.changeCrystal(int(this._changeCrystal_changeByCodec.decode(_arg_2)));
               return;
            case this._updateRankId:
               this.client.updateRank(int(this._updateRank_rankCodec.decode(_arg_2)),int(this._updateRank_scoreCodec.decode(_arg_2)),int(this._updateRank_currentRankScoreCodec.decode(_arg_2)),int(this._updateRank_nextRankScoreCodec.decode(_arg_2)),int(this._updateRank_bonusCrystalsCodec.decode(_arg_2)));
               return;
            case this._updateScoreId:
               this.client.updateScore(int(this._updateScore_scoreCodec.decode(_arg_2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

