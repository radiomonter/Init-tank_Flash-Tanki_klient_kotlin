package obfuscation.pipis
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.protocol.info.TypeCodecInfo;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   
   public class Tynozodin extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Lafa;
      
      private var client:Kefij = Kefij(this);
      
      private var modelId:Long = Long.getLong(0,300020016);
      
      private var kyjobebaf:Long = Long.getLong(0,300020047);
      
      private var vyhic:ICodec;
      
      private var nofikuh:Long = Long.getLong(0,300020048);
      
      private var fevy:Long = Long.getLong(0,300020049);
      
      public function Tynozodin()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Lafa(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         this.vyhic = this._protocol.getCodec(new TypeCodecInfo(String,false));
      }
      
      protected function getInitParam() : Siqu
      {
         return Siqu(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.kyjobebaf:
               this.client.inviteAlreadyActivated(String(this.vyhic.decode(_arg_2)));
               return;
            case this.nofikuh:
               this.client.inviteFree();
               return;
            case this.fevy:
               this.client.inviteNotFound();
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

