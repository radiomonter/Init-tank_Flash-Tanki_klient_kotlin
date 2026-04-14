package obfuscation.vecuhamep
{
   import flash.filters.BitmapFilter;
   import platform.client.fp10.core.model.IModel;
   import platform.client.fp10.core.model.impl.Model;
   import platform.client.fp10.core.type.IGameObject;
   
   public class Futop implements Jijapib
   {
      
      private var object:IGameObject;
      
      private var impl:Vector.<Jijapib>;
      
      public function Futop(_arg_1:IGameObject, _arg_2:Vector.<IModel>)
      {
         var _local_3:int = 0;
         super();
         this.object = _arg_1;
         this.impl = new Vector.<Jijapib>();
         while(_local_3 < _arg_2.length)
         {
            this.impl.push(_arg_2[_local_3]);
            _local_3++;
         }
      }
      
      public function createFilter(param1:String) : BitmapFilter
      {
         var result:BitmapFilter = null;
         var i:int = 0;
         var m:Jijapib = null;
         var key:String = param1;
         try
         {
            Model.object = this.object;
            i = 0;
            while(i < this.impl.length)
            {
               m = this.impl[i];
               result = m.createFilter(key);
               i += 1;
            }
         }
         finally
         {
            Model.popObject();
         }
         return result;
      }
   }
}

