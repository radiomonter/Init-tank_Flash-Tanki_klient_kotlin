package fominskiy.networking.commands
{
   public class Command
   {
      
      public var type:Type;
      
      public var args:Array;
      
      public var src:String;
      
      public function Command(_arg_1:Type, _arg_2:Array, _arg_3:String = null)
      {
         super();
         this.type = _arg_1;
         this.args = _arg_2;
         this.src = _arg_3;
      }
   }
}

