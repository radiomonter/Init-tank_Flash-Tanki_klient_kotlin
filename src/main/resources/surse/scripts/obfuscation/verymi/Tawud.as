package obfuscation.verymi
{
   public class Tawud
   {
      
      public var head:Mit;
      
      public var tail:Mit;
      
      public function Tawud()
      {
         super();
      }
      
      public function nyzyq(_arg_1:Mit) : void
      {
         if(this.head == null)
         {
            this.head = this.tail = _arg_1;
         }
         else
         {
            this.tail.next = _arg_1;
            _arg_1.prev = this.tail;
            this.tail = _arg_1;
         }
      }
      
      public function vyhabapa(_arg_1:Mit) : void
      {
         if(this.head == null)
         {
            return;
         }
         if(_arg_1 == this.head)
         {
            if(_arg_1 == this.tail)
            {
               this.head = this.tail = null;
            }
            else
            {
               this.head = this.head.next;
               this.head.prev = null;
            }
         }
         else if(_arg_1 == this.tail)
         {
            this.tail = this.tail.prev;
            this.tail.next = null;
         }
         else
         {
            _arg_1.prev.next = _arg_1.next;
            _arg_1.next.prev = _arg_1.prev;
         }
         _arg_1.dispose();
      }
      
      public function hamato() : void
      {
         while(this.head != null)
         {
            this.vyhabapa(this.head);
         }
      }
   }
}

