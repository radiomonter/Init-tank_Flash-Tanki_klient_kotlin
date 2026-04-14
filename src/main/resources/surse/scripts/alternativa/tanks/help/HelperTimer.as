package alternativa.tanks.help
{
   import flash.utils.Timer;
   
   public class HelperTimer extends Timer
   {
      
      private var _helper:Helper;
      
      public function HelperTimer(_arg_1:Number, _arg_2:int)
      {
         super(_arg_1,_arg_2);
      }
      
      public function get helper() : Helper
      {
         return this._helper;
      }
      
      public function set helper(_arg_1:Helper) : void
      {
         this._helper = _arg_1;
      }
   }
}

