package obfuscation.dinas
{
   public class QueueItem
   {
      
      private static var poolTop:QueueItem;
      
      public var next:QueueItem;
      
      public var data:*;
      
      public function QueueItem(_arg_1:*)
      {
         super();
         this.data = _arg_1;
      }
      
      public static function create(_arg_1:*) : QueueItem
      {
         if(poolTop == null)
         {
            return new QueueItem(_arg_1);
         }
         var _local_2:QueueItem = poolTop;
         poolTop = poolTop.next;
         _local_2.data = _arg_1;
         return _local_2;
      }
      
      public function destroy() : void
      {
         this.data = null;
         this.next = poolTop;
         poolTop = this;
      }
   }
}

