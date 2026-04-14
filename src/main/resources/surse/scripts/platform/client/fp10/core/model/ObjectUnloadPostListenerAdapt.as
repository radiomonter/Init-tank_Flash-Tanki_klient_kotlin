package platform.client.fp10.core.model
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ObjectUnloadPostListenerAdapt implements ObjectUnloadPostListener
   {
      
      private var object:IGameObject;
      
      private var impl:ObjectUnloadPostListener;
      
      public function ObjectUnloadPostListenerAdapt(_arg_1:IGameObject, _arg_2:ObjectUnloadPostListener)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function objectUnloadedPost() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.objectUnloadedPost();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

