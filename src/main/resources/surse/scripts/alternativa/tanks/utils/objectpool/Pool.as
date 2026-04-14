package alternativa.tanks.utils.objectpool
{
   public class Pool
   {
      
      private var tuhy:int;
      
      private var fitypenad:Class;
      
      private var objects:Vector.<Object> = new Vector.<Object>();
      
      public function Pool(_arg_1:Class)
      {
         super();
         this.fitypenad = _arg_1;
      }
      
      final public function lihahody() : int
      {
         return this.tuhy;
      }
      
      final public function getObject() : Object
      {
         if(this.tuhy == 0)
         {
            return new this.fitypenad(this);
         }
         var _local_1:Object = this.objects[--this.tuhy];
         this.objects[this.tuhy] = null;
         return _local_1;
      }
      
      final public function tisotiky(_arg_1:Object) : void
      {
         if(this.fitypenad != _arg_1.constructor)
         {
            throw new ArgumentError();
         }
         var _local_2:* = this.tuhy++;
         this.objects[_local_2] = _arg_1;
      }
      
      final public function clear() : void
      {
         this.objects.length = 0;
         this.tuhy = 0;
      }
   }
}

