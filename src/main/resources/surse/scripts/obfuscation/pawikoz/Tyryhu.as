package obfuscation.pawikoz
{
   import flash.display.Sprite;
   
   public class Tyryhu extends Sprite
   {
      
      protected var bosevo:int = 3;
      
      protected var container:Sprite = new Sprite();
      
      protected var shift:Number;
      
      public function Tyryhu()
      {
         super();
         addChild(this.container);
      }
      
      public function rac(_arg_1:Boolean = false) : Fojuhe
      {
         var _local_4:int = 0;
         var _local_2:int = this.container.numChildren;
         if(_local_2 == 0)
         {
            return null;
         }
         var _local_3:Fojuhe = Fojuhe(this.container.getChildAt(0));
         this.shift = int(_local_3.height + _local_3.y + this.bosevo);
         this.container.removeChild(_local_3);
         _local_2--;
         while(_local_4 < _local_2)
         {
            this.container.getChildAt(_local_4).y = this.container.getChildAt(_local_4).y - this.shift;
            _local_4++;
         }
         return _local_3;
      }
      
      protected function kugydiwu(_arg_1:Fojuhe) : void
      {
         _arg_1.y = 0;
         _arg_1.alpha = 1;
         this.container.addChildAt(_arg_1,0);
         var _local_2:int = this.container.numChildren;
         var _local_3:int = 1;
         while(_local_3 < _local_2)
         {
            this.container.getChildAt(_local_3).y = this.container.getChildAt(_local_3).y + int(_arg_1.height + this.bosevo);
            _local_3++;
         }
      }
      
      protected function feramul(_arg_1:Fojuhe) : void
      {
         _arg_1.y = this.container.numChildren > 0 ? Number(int(this.container.height + this.bosevo)) : Number(0);
         this.container.addChild(_arg_1);
      }
   }
}

