package alternativa.tanks.bonuses
{
   public class ObjectCache
   {
      
      private var size:int;
      
      private var objects:Vector.<Object> = new Vector.<Object>();
      
      public function ObjectCache()
      {
         super();
      }
      
      public function put(_arg_1:Object) : void
      {
         var _local_2:* = this.size++;
         this.objects[_local_2] = _arg_1;
      }
      
      public function Jul() : Object
      {
         if(this.isEmpty())
         {
            throw new Error();
         }
         --this.size;
         var _local_1:Object = this.objects[this.size];
         this.objects[this.size] = null;
         return _local_1;
      }
      
      public function isEmpty() : Boolean
      {
         return this.size == 0;
      }
      
      public function clear() : void
      {
         var _local_1:Object = null;
         this.objects.length = 0;
         this.size = 0;
      }
   }
}

