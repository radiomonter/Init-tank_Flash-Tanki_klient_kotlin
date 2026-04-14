package alternativa.tanks.models.user
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanUserModelAdapt implements IClanUserModel
   {
      
      private var object:IGameObject;
      
      private var impl:IClanUserModel;
      
      public function IClanUserModelAdapt(_arg_1:IGameObject, _arg_2:IClanUserModel)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function loadingInServiceSpace() : Boolean
      {
         var result:Boolean = false;
         try
         {
            Model.object = this.object;
            result = this.impl.loadingInServiceSpace();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function addInClan(clan:IGameObject) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.addInClan(clan);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function rejectAll() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.rejectAll();
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function revoke(clan:IGameObject) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.revoke(clan);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function reject(clan:IGameObject) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.reject(clan);
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function acceptRequest(clan:IGameObject) : void
      {
         try
         {
            Model.object = this.object;
            this.impl.acceptRequest(clan);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

