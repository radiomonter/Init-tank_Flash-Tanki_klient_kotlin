package platform.client.fp10.core.model
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IObjectLoadListenerAdapt implements IObjectLoadListener
   {
      
      private var object:IGameObject;
      
      private var impl:IObjectLoadListener;
      
      public function IObjectLoadListenerAdapt(_arg_1:IGameObject, _arg_2:IObjectLoadListener)
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

