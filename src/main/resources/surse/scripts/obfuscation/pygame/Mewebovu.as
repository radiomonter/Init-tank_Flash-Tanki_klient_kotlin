package obfuscation.pygame
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Mewebovu implements Meca
   {
      
      private var object:IGameObject;
      
      private var impl:Meca;
      
      public function Mewebovu(_arg_1:IGameObject, _arg_2:Meca)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function damik(sydi:String) : void
      {
         var vody:String = sydi;
         try
         {
            Model.object = this.object;
            this.impl.damik(vody);
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

