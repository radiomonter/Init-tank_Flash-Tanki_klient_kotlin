package alternativa.physics
{
   public class QuickUnionFind
   {
      
      private var items:Vector.<int>;
      
      private var size:Vector.<int>;
      
      public function QuickUnionFind()
      {
         super();
         this.items = new Vector.<int>(1);
         this.size = new Vector.<int>(1);
      }
      
      public function init(_arg_1:int) : void
      {
         var _local_2:int = 0;
         this.items.length = _arg_1;
         this.size.length = _arg_1;
         while(_local_2 < _arg_1)
         {
            this.items[_local_2] = _local_2;
            this.size[_local_2] = 1;
            _local_2++;
         }
      }
      
      public function union(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:int = 0;
         var _local_4:int = 0;
         var _local_5:int = 0;
         var _local_6:int = 0;
         if(!this.connected(_arg_1,_arg_2))
         {
            _local_3 = this.root(_arg_1);
            _local_4 = this.root(_arg_2);
            _local_5 = this.size[_local_3];
            _local_6 = this.size[_local_4];
            if(_local_5 > _local_6)
            {
               this.items[_local_4] = _local_3;
               this.size[_local_3] += _local_6;
            }
            else
            {
               this.items[_local_3] = _local_4;
               this.size[_local_4] += _local_5;
            }
         }
      }
      
      public function connected(_arg_1:int, _arg_2:int) : Boolean
      {
         return this.root(_arg_1) == this.root(_arg_2);
      }
      
      public function root(_arg_1:int) : int
      {
         var _local_2:int = _arg_1;
         while(this.items[_local_2] != _local_2)
         {
            _local_2 = this.items[_local_2];
         }
         return _local_2;
      }
   }
}

