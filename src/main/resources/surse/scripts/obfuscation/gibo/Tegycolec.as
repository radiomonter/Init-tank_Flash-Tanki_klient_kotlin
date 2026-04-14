package obfuscation.gibo
{
   import alternativa.tanks.utils.objectpool.ObjectPool;
   import obfuscation.tuwys.Wopatal;
   
   public class Tegycolec implements Wopatal
   {
      
      private var ligujoro:ObjectPool = new ObjectPool();
      
      public function Tegycolec()
      {
         super();
      }
      
      public function get vopa() : ObjectPool
      {
         return this.ligujoro;
      }
      
      public function clear() : void
      {
         this.ligujoro.clear();
      }
   }
}

