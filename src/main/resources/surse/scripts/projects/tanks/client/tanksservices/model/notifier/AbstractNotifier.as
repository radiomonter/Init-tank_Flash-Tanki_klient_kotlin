package projects.tanks.client.tanksservices.model.notifier
{
   public class AbstractNotifier
   {
      
      private var _userId:String;
      
      public function AbstractNotifier(_arg_1:String = null)
      {
         super();
         this._userId = _arg_1;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function set userId(_arg_1:String) : void
      {
         this._userId = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "AbstractNotifier [";
         _local_1 += "userId = " + this.userId + " ";
         return _local_1 + "]";
      }
   }
}

