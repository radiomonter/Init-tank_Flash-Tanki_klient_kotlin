package obfuscation.lozewaby
{
   import obfuscation.rofa.ISound3DEffect;
   
   internal class Zaleco
   {
      
      private static var tuhy:int;
      
      private static var pool:Vector.<Zaleco> = new Vector.<Zaleco>();
      
      public var lurinoc:Number;
      
      public var pyjuj:ISound3DEffect;
      
      public function Zaleco(_arg_1:Number, _arg_2:ISound3DEffect)
      {
         super();
         this.lurinoc = _arg_1;
         this.pyjuj = _arg_2;
      }
      
      public static function create(_arg_1:Number, _arg_2:ISound3DEffect) : Zaleco
      {
         var _local_3:Zaleco = null;
         if(tuhy > 0)
         {
            _local_3 = pool[--tuhy];
            pool[tuhy] = null;
            _local_3.lurinoc = _arg_1;
            _local_3.pyjuj = _arg_2;
            return _local_3;
         }
         return new Zaleco(_arg_1,_arg_2);
      }
      
      public static function destroy(_arg_1:Zaleco) : void
      {
         _arg_1.pyjuj = null;
         var _local_2:* = tuhy++;
         pool[_local_2] = _arg_1;
      }
   }
}

