package projects.tanks.client.battlefield.models.battle.jgr
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class JuggernautModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:JuggernautModelServer;
      
      private var client:IJuggernautModelBase = IJuggernautModelBase(this);
      
      private var modelId:Long = Long.getLong(1833384627,1931960874);
      
      private var _bossChangedId:Long = Long.getLong(954291601,249244676);
      
      private var _bossChanged_newBossCodec:ICodec;
      
      private var _bossKilledId:Long = Long.getLong(1631784385,-1855967691);
      
      public function JuggernautModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new JuggernautModelServer(IModel(this));
      }
      
      protected function getInitParam() : JuggernautCC
      {
         return JuggernautCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         var _loc3_:Long = _arg_1;
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

