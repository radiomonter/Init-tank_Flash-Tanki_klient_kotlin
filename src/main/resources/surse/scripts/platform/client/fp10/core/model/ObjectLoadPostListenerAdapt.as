package platform.client.fp10.core.model
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class ObjectLoadPostListenerAdapt implements ObjectLoadPostListener
   {
      
      private var object:IGameObject;
      
      private var impl:ObjectLoadPostListener;
      
      public function ObjectLoadPostListenerAdapt(_arg_1:IGameObject, _arg_2:ObjectLoadPostListener)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function objectLoadedPost() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.objectLoadedPost();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

