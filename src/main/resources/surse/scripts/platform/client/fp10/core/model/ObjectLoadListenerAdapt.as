package platform.client.fp10.core.model
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ObjectLoadListenerAdapt implements ObjectLoadListener
   {
      
      private var object:IGameObject;
      
      private var impl:ObjectLoadListener;
      
      public function ObjectLoadListenerAdapt(_arg_1:IGameObject, _arg_2:ObjectLoadListener)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function objectLoaded() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.objectLoaded();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

