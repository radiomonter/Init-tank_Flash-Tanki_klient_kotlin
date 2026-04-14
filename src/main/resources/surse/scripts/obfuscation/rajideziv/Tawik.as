package obfuscation.rajideziv
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Tawik implements Rolipu
   {
      
      private var object:IGameObject;
      
      private var impl:Rolipu;
      
      public function Tawik(_arg_1:IGameObject, _arg_2:Rolipu)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function continueBattle() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.continueBattle();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

