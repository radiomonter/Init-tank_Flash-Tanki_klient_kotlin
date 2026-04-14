package obfuscation.silulu
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Jozaz implements Zuludod
   {
      
      private var object:IGameObject;
      
      private var impl:Zuludod;
      
      public function Jozaz(_arg_1:IGameObject, _arg_2:Zuludod)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function fit() : void
      {
         try
         {
            Model.object = this.object;
            this.impl.fit();
            return;
         }
         finally
         {
            Model.popObject();
         }
      }
   }
}

