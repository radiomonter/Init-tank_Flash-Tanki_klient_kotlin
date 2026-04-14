package obfuscation.gilapu
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Myko implements Vosu
   {
      
      private var object:IGameObject;
      
      private var impl:Vosu;
      
      public function Myko(_arg_1:IGameObject, _arg_2:Vosu)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getEnterPrice() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getEnterPrice();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getTimeLeftInSec() : int
      {
         var result:int = 0;
         try
         {
            Model.object = this.object;
            result = this.impl.getTimeLeftInSec();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

