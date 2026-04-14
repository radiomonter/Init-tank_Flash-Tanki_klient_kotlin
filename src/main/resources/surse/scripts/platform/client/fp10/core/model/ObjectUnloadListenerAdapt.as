package platform.client.fp10.core.model
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ObjectUnloadListenerAdapt implements ObjectUnloadListener
   {
      
      private var object:IGameObject;
      
      private var impl:ObjectUnloadListener;
      
      public function ObjectUnloadListenerAdapt(_arg_1:IGameObject, _arg_2:ObjectUnloadListener)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function objectUnloaded() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.objectUnloaded();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

