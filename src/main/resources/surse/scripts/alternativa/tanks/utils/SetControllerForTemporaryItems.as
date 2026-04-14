package alternativa.tanks.utils
{
   import flash.utils.Dictionary;
   
   public class SetControllerForTemporaryItems
   {
      
      private var temporaryItems:Vector.<Object> = new Vector.<Object>();
      
      private var sourceSet:Dictionary;
      
      public function SetControllerForTemporaryItems(_arg_1:Dictionary)
      {
         super();
         this.sourceSet = _arg_1;
      }
      
      public function addTemporaryItem(_arg_1:Object) : void
      {
         this.sourceSet[_arg_1] = true;
         this.temporaryItems.push(_arg_1);
      }
      
      public function deleteAllTemporaryItems() : void
      {
         var _local_1:int = 0;
         while(_local_1 < this.temporaryItems.length)
         {
            delete this.sourceSet[this.temporaryItems[_local_1]];
            _local_1++;
         }
         this.temporaryItems.length = 0;
      }
   }
}

