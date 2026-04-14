package obfuscation.myrudatof
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Lok implements Nebizo
   {
      
      private var object:IGameObject;
      
      private var impl:Nebizo;
      
      public function Lok(_arg_1:IGameObject, _arg_2:Nebizo)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function removePresent(param1:IGameObject) : void
      {
         var presentItem:IGameObject = param1;
         try
         {
            Model.object = this.object;
            this.impl.removePresent(presentItem);
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

