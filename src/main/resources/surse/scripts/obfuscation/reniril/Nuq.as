package obfuscation.reniril
{
   import obfuscation.qejoqa.Lyd;
   
   public class Nuq
   {
      
      private var kapo:Vector.<Lyd> = new Vector.<Lyd>();
      
      private var zyqoq:Vector.<Lyd> = new Vector.<Lyd>();
      
      public function Nuq()
      {
         super();
      }
      
      public function clear() : void
      {
         this.kapo.length = 0;
         this.zyqoq.length = 0;
      }
      
      public function miw() : Vector.<Lyd>
      {
         return this.zyqoq;
      }
      
      public function dopewiqi() : Number
      {
         var _local_1:Lyd = this.kapo[0];
         return _local_1.dopewiqi();
      }
      
      public function isEmpty() : Boolean
      {
         return this.kapo.length == 0;
      }
      
      public function add(_arg_1:Lyd) : void
      {
         var _local_3:Lyd = null;
         var _local_4:Lyd = null;
         var _local_2:Number = NaN;
         _local_2 = 0;
         while(_local_2 < this.kapo.length)
         {
            _local_3 = this.kapo[_local_2];
            if(_arg_1.dopewiqi() < _local_3.dopewiqi())
            {
               break;
            }
            _local_2++;
         }
         this.kapo.splice(_local_2,0,_arg_1);
         _local_2 = 0;
         while(_local_2 < this.zyqoq.length)
         {
            _local_4 = this.zyqoq[_local_2];
            if(_arg_1.wyky() < _local_4.wyky())
            {
               break;
            }
            _local_2++;
         }
         this.zyqoq.splice(_local_2,0,_arg_1);
      }
      
      public function setosohuj(_arg_1:Number) : void
      {
         var _local_2:Lyd = null;
         while(this.kapo.length > 0)
         {
            _local_2 = Lyd(this.kapo[0]);
            if(_local_2.dopewiqi() > _arg_1)
            {
               break;
            }
            this.sepom(this.kapo[0]);
         }
      }
      
      private function sepom(_arg_1:Lyd) : void
      {
         this.bynu(this.kapo,_arg_1);
         this.bynu(this.zyqoq,_arg_1);
      }
      
      private function bynu(_arg_1:Vector.<Lyd>, _arg_2:Lyd) : void
      {
         _arg_1.splice(_arg_1.indexOf(_arg_2),1);
      }
   }
}

