package alternativa.osgi.service.command.impl
{
   import alternativa.osgi.service.command.FormattedOutput;
   
   public class FormattedOutputToString implements FormattedOutput
   {
      
      public var content:Vector.<String> = new Vector.<String>();
      
      public function FormattedOutputToString()
      {
         super();
      }
      
      public function addText(_arg_1:String) : void
      {
         this.content.push(_arg_1);
      }
      
      public function addPrefixedText(_arg_1:String, _arg_2:String) : void
      {
         this.addText(_arg_1 + " " + _arg_2);
      }
      
      public function addLines(_arg_1:Vector.<String>) : void
      {
         var _local_2:int = 0;
         while(_local_2 < _arg_1.length)
         {
            this.addText(_arg_1[_local_2]);
            _local_2++;
         }
      }
      
      public function addPrefixedLines(_arg_1:String, _arg_2:Vector.<String>) : void
      {
         var _local_3:int = 0;
         while(_local_3 < _arg_2.length)
         {
            this.addPrefixedText(_arg_1,_arg_2[_local_3]);
            _local_3++;
         }
      }
   }
}

