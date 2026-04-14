package projects.tanks.client.panel.model.news.showing
{
   import alternativa.osgi.OSGi;
   import alternativa.protocol.IProtocol;
   import alternativa.protocol.ProtocolBuffer;
   import alternativa.types.Long;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   
   public class NewsShowingModelBase extends Model
   {
      
      private var _protocol:IProtocol = IProtocol(OSGi.getInstance().getService(IProtocol));
      
      protected var server:NewsShowingModelServer;
      
      private var client:INewsShowingModelBase = INewsShowingModelBase(this);
      
      private var modelId:Long = Long.getLong(0,300050034);
      
      public function NewsShowingModelBase()
      {
         super();
         this.initCodecs();
      }
      
      protected function initCodecs() : void
      {
         this.server = new NewsShowingModelServer(IModel(this));
      }
      
      protected function getInitParam() : NewsShowingCC
      {
         return NewsShowingCC(initParams[Model.object]);
      }
      
      override public function invoke(_arg_1:Long, _arg_2:ProtocolBuffer) : void
      {
         var _local_3:* = _arg_1;
         var _loc4_:int = 0;
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

