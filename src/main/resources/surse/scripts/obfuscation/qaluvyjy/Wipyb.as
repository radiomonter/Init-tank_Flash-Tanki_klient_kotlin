package obfuscation.qaluvyjy
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.battleselect.model.info.BattleInfoUser;
   
   public class Wipyb extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Sad;
      
      private var client:Pewutagaz = Pewutagaz(this);
      
      private var modelId:Long = Long.getLong(0,300090003);
      
      private var govycy:Long = Long.getLong(0,300090008);
      
      private var qiwy:ICodec;
      
      private var musoq:Long = Long.getLong(0,300090009);
      
      private var dog:Long = Long.getLong(0,300090010);
      
      private var cypu:ICodec;
      
      private var qebyra:ICodec;
      
      public function Wipyb()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Sad(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Zoti
      {
         return Zoti(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.govycy:
               this.client.addUser(BattleInfoUser(this.qiwy.decode(_arg_2)));
               return;
            case this.musoq:
               this.client.pevuje();
               return;
            case this.dog:
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

