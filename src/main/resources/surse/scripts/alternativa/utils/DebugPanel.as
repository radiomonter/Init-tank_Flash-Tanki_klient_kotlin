package alternativa.utils
{
   import flash.display.Sprite;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormat;
   import flash.utils.Dictionary;
   
   public class DebugPanel extends Sprite
   {
      
      private var values:Dictionary;
      
      private var count:int;
      
      public function DebugPanel()
      {
         super();
         this.values = new Dictionary();
         mouseEnabled = false;
         tabEnabled = false;
         mouseChildren = false;
         tabChildren = false;
      }
      
      public function printValue(_arg_1:String, ... _args) : void
      {
         var _local_3:TextField = this.values[_arg_1];
         if(_local_3 == null)
         {
            _local_3 = this.createTextField();
            this.values[_arg_1] = _local_3;
         }
         _local_3.text = _arg_1 + ": " + _args.join(" ");
      }
      
      public function printText(_arg_1:String) : void
      {
         this.createTextField().text = _arg_1;
      }
      
      private function createTextField() : TextField
      {
         var _local_1:TextField = null;
         _local_1 = new TextField();
         _local_1.autoSize = TextFieldAutoSize.LEFT;
         addChild(_local_1);
         _local_1.defaultTextFormat = new TextFormat("Tahoma",11,16777215);
         _local_1.y = this.count * 20;
         ++this.count;
         return _local_1;
      }
   }
}

