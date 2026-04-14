package projects.tanks.clients.fp10.libraries.tanksservices.model.notifier.online
{
   public class ClientOnlineNotifierData
   {
      
      private var _userId:String;
      
      private var _online:Boolean;
      
      private var _serverNumber:int;
      
      public function ClientOnlineNotifierData(_arg_1:String, _arg_2:Boolean, _arg_3:int)
      {
         super();
         this._userId = _arg_1;
         this._online = _arg_2;
         this._serverNumber = _arg_3;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function get online() : Boolean
      {
         return this._online;
      }
      
      public function get serverNumber() : int
      {
         return this._serverNumber;
      }
   }
}

