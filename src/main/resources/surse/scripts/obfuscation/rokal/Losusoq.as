package obfuscation.rokal
{
   import obfuscation.rofa.LightAnimation;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Losusoq implements Riwizy
   {
      
      private var object:IGameObject;
      
      private var impl:Riwizy;
      
      public function Losusoq(_arg_1:IGameObject, _arg_2:Riwizy)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function jaqirynu(sydi:String) : LightAnimation
      {
         var pify:LightAnimation = null;
         var rycavu:String = sydi;
         try
         {
            Model.object = this.object;
            pify = this.impl.jaqirynu(rycavu);
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
   }
}

