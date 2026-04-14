package obfuscation.lopivyl
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.ICodec;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.registry.ModelRegistry;
   import projects.tanks.client.battleservice.model.statistics.Bamapylaq;
   import projects.tanks.client.battleservice.model.statistics.Suc;
   
   public class Zevab extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:Sozyqad;
      
      private var client:Pasysuwo = Pasysuwo(this);
      
      private var modelId:Long = Long.getLong(575618390,177970779);
      
      private var wuba:Long = Long.getLong(965223943,535616065);
      
      private var meju:ICodec;
      
      private var bebop:Long = Long.getLong(2010192701,-2134483217);
      
      private var lez:ICodec;
      
      private var gywutowij:Long = Long.getLong(825794462,-1556026223);
      
      private var picihyd:ICodec;
      
      private var qukiwopegy:ICodec;
      
      private var fuludikor:Long = Long.getLong(329840042,1301345271);
      
      private var gofeberut:ICodec;
      
      public function Zevab()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new Sozyqad(IModel(this));
         var _local_1:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
      }
      
      protected function getInitParam() : Biru
      {
         return Biru(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         switch(_arg_1)
         {
            case this.wuba:
               this.client.donanuno(Suc(this.meju.decode(_arg_2)));
               return;
            case this.bebop:
               this.client.cesipuvav(this.lez.decode(_arg_2) as Vector.<Suc>);
               return;
            case this.gywutowij:
               this.client.userConnect(String(this.picihyd.decode(_arg_2)),this.qukiwopegy.decode(_arg_2) as Vector.<Bamapylaq>);
               return;
            case this.fuludikor:
               this.client.sywibo(String(this.gofeberut.decode(_arg_2)));
         }
      }
      
      override public function get id() : Long
      {
         return this.modelId;
      }
   }
}

