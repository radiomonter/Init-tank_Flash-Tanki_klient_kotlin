package obfuscation.fusirykes
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Redefeju implements Hyv
   {
      
      private var object:IGameObject;
      
      private var impl:Hyv;
      
      public function Redefeju(_arg_1:IGameObject, _arg_2:Hyv)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getUsersCount() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getUsersCount();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getFriendsCount() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getFriendsCount();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

