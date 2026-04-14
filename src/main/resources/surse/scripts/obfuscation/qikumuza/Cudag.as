package obfuscation.qikumuza
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Cudag implements Dot
   {
      
      private var object:IGameObject;
      
      private var impl:Dot;
      
      public function Cudag(_arg_1:IGameObject, _arg_2:Dot)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function getClanName() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getClanName();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
      
      public function getClanLink() : String
      {
         var result:String = null;
         try
         {
            Model.object = this.object;
            result = this.impl.getClanLink();
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

