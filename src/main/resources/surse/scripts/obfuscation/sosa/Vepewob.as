package obfuscation.sosa
{
   import obfuscation.vafy.Lomyger;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Vepewob implements Zaq
   {
      
      private var object:IGameObject;
      
      private var impl:Zaq;
      
      public function Vepewob(_arg_1:IGameObject, _arg_2:Zaq)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function cazasu() : Lomyger
      {
         var pify:Lomyger = null;
         try
         {
            Model.object = this.object;
            pify = this.impl.cazasu();
         }
         finally
         {
            Model.popObject();
         }
         return pify;
      }
   }
}

