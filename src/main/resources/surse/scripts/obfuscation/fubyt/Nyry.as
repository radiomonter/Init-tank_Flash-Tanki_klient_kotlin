package obfuscation.fubyt
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Nyry implements Batopa
   {
      
      private var object:IGameObject;
      
      private var impl:Batopa;
      
      public function Nyry(_arg_1:IGameObject, _arg_2:Batopa)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getUsersCountBlue() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getUsersCountBlue();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getUsersCountRed() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getUsersCountRed();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getFriendsCountBlue() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getFriendsCountBlue();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getFriendsCountRed() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getFriendsCountRed();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

