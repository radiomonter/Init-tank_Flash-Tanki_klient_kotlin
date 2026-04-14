package projects.tanks.client.tanksservices.model.notifier.online
{
   import projects.tanks.client.tanksservices.model.notifier.AbstractNotifier;
   
   public class OnlineNotifierData extends AbstractNotifier
   {
      
      private var _online:Boolean;
      
      private var _serverNumber:int;
      
      public function OnlineNotifierData(_arg_1:Boolean = false, _arg_2:int = 0)
      {
         super();
         this._online = _arg_1;
         this._serverNumber = _arg_2;
      }
      
      public function get online() : Boolean
      {
         return this._online;
      }
      
      public function set online(_arg_1:Boolean) : void
      {
         this._online = _arg_1;
      }
      
      public function get serverNumber() : int
      {
         return this._serverNumber;
      }
      
      public function set serverNumber(_arg_1:int) : void
      {
         this._serverNumber = _arg_1;
      }
      
      override public function toString() : String
      {
         var _local_1:* = "OnlineNotifierData [";
         _local_1 += "online = " + this.online + " ";
         _local_1 += "serverNumber = " + this.serverNumber + " ";
         _local_1 += super.toString();
         return _local_1 + "]";
      }
   }
}

