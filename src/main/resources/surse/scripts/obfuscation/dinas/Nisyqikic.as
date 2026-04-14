package obfuscation.dinas
{
   public class Nisyqikic
   {
      
      private var head:QueueItem;
      
      private var tail:QueueItem;
      
      private var size:int;
      
      public function Nisyqikic()
      {
         super();
      }
      
      public function put(_arg_1:*) : void
      {
         ++this.size;
         var _local_2:QueueItem = QueueItem.create(_arg_1);
         if(this.tail == null)
         {
            this.head = _local_2;
            this.tail = _local_2;
         }
         else
         {
            this.tail.next = _local_2;
            this.tail = _local_2;
         }
      }
      
      public function pop() : *
      {
         if(this.head == null)
         {
            return null;
         }
         --this.size;
         var _local_1:* = this.head.data;
         var _local_2:QueueItem = this.head;
         this.head = this.head.next;
         _local_2.destroy();
         return _local_1;
      }
      
      public function getSize() : int
      {
         return this.size;
      }
   }
}

