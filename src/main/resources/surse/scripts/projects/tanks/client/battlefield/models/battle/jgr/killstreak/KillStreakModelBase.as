package projects.tanks.client.battlefield.models.battle.jgr.killstreak
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class KillStreakModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:KillStreakModelServer;
      
      private var client:IKillStreakModelBase = IKillStreakModelBase(this);
      
      private var modelId:Long = Long.getLong(1192985770,445553764);
      
      private var _killStreakAchivedId:Long = Long.getLong(966829750,1086968099);
      
      private var _killStreakAchived_indexCodec:ICodec;
      
      public function KillStreakModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new KillStreakModelServer(IModel(this));
      }
      
      protected function getInitParam() : KillStreakCC
      {
         return KillStreakCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

