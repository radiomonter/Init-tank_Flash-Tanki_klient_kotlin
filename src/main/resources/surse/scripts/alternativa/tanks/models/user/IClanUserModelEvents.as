package alternativa.tanks.models.user
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class IClanUserModelEvents implements IClanUserModel
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Object>;
      
      public function IClanUserModelEvents(_arg_1:IGameObject, _arg_2:Vector.<Object>)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function loadingInServiceSpace() : Boolean
      {
         var result:Boolean = false;
         var i:int = 0;
         var m:IClanUserModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanUserModel(this.impl[i]);
               result = m.loadingInServiceSpace();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function addInClan(clan:IGameObject) : void
      {
         var i:int = 0;
         var m:IClanUserModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanUserModel(this.impl[i]);
               m.addInClan(clan);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function rejectAll() : void
      {
         var i:int = 0;
         var m:IClanUserModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanUserModel(this.impl[i]);
               m.rejectAll();
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function revoke(clan:IGameObject) : void
      {
         var i:int = 0;
         var m:IClanUserModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanUserModel(this.impl[i]);
               m.revoke(clan);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function reject(clan:IGameObject) : void
      {
         var i:int = 0;
         var m:IClanUserModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanUserModel(this.impl[i]);
               m.reject(clan);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
      
      public function acceptRequest(clan:IGameObject) : void
      {
         var i:int = 0;
         var m:IClanUserModel = null;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = IClanUserModel(this.impl[i]);
               m.acceptRequest(clan);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

