package alternativa.tanks.utils.objectpool
{
   public class PooledObject
   {
      
      private var pool:Pool;
      
      public function PooledObject(_arg_1:Pool)
      {
         super();
         this.pool = _arg_1;
      }
      
      final public function recycle() : void
      {
         this.pool.tisotiky(this);
      }
   }
}

