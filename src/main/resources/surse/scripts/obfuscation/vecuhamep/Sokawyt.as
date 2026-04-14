package obfuscation.vecuhamep
{
   import flash.filters.BitmapFilter;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Sokawyt implements Jijapib
   {
      
      private var object:IGameObject;
      
      private var impl:Jijapib;
      
      public function Sokawyt(_arg_1:IGameObject, _arg_2:Jijapib)
      {
         super();
         this.object = _arg_1;
         this.impl = _arg_2;
      }
      
      public function createFilter(param1:String) : BitmapFilter
      {
         var result:BitmapFilter = null;
         var key:String = param1;
         try
         {
            Model.object = this.object;
            result = this.impl.createFilter(key);
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

