package obfuscation.peve
{
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Gic implements Kanutu
   {
      
      private var object:IGameObject;
      
      private var impl:Kanutu;
      
      public function Gic(_arg_1:IGameObject, _arg_2:Kanutu)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function sik() : Labamedo
      {
         var pify:Labamedo = null;
         try
         {
            Model.object = this.object;
            pify = this.impl.sik();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
   }
}

