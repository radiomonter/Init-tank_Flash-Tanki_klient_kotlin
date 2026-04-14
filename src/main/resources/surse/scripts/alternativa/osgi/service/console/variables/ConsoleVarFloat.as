package alternativa.osgi.service.console.variables
{
   public class ConsoleVarFloat extends ConsoleVar
   {
      
      public var value:Number;
      
      private var minValue:Number;
      
      private var maxValue:Number;
      
      public function ConsoleVarFloat(_arg_1:String, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Function = null)
      {
         super(_arg_1,_arg_5);
         this.value = _arg_2;
         this.minValue = _arg_3;
         this.maxValue = _arg_4;
      }
      
      override public function acceptInput(_arg_1:String) : String
      {
         var _local_2:Number = Number(_arg_1);
         if(isNaN(_local_2))
         {
            return "Incorrect number";
         }
         if(_local_2 < this.minValue || _local_2 > this.maxValue)
         {
            return "Value is out of bounds [" + this.minValue + ", " + this.maxValue + "]";
         }
         this.value = _local_2;
         if(inputListener != null)
         {
            inputListener(this.value);
         }
         return null;
      }
      
      override public function toString() : String
      {
         return this.value.toString();
      }
   }
}

