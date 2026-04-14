package obfuscation.kutyqypy
{
   import alternativa.tanks.bonuses.Bonus;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Busen implements Zekuzejob
   {
      
      private var object:IGameObject;
      
      private var impl:Zekuzejob;
      
      public function Busen(_arg_1:IGameObject, _arg_2:Zekuzejob)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function tohubyfoj(sydi:String) : Bonus
      {
         var pify:Bonus = null;
         var duq:String = sydi;
         try
         {
            Model.object = this.object;
            pify = this.impl.tohubyfoj(duq);
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
   }
}

