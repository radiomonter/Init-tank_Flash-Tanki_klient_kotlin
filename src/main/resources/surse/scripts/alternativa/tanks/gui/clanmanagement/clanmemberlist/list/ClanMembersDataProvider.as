package alternativa.tanks.gui.clanmanagement.clanmemberlist.list
{
   import fl.data.DataProvider;
   
   public class ClanMembersDataProvider extends DataProvider
   {
      
      private var _getItemAtHandler:Function;
      
      public function ClanMembersDataProvider()
      {
         super();
      }
      
      public function getItemIndexById(_arg_1:String) : int
      {
         var _local_2:Object = null;
         var _local_4:int = 0;
         var _local_3:int = int(length);
         while(_local_4 < _local_3)
         {
            _local_2 = this.getItemAt(_local_4);
            if(Boolean(_local_2) && Boolean(_local_2.hasOwnProperty("id")) && _local_2["id"] == _arg_1)
            {
               return _local_4;
            }
            _local_4++;
         }
         return -1;
      }
      
      public function get getItemAtHandler() : Function
      {
         return this._getItemAtHandler;
      }
      
      public function set getItemAtHandler(_arg_1:Function) : void
      {
         this._getItemAtHandler = _arg_1;
      }
      
      override public function getItemAt(_arg_1:uint) : Object
      {
         var _local_2:Object = super.getItemAt(_arg_1);
         if(this.getItemAtHandler != null)
         {
            this.getItemAtHandler(_local_2);
         }
         return _local_2;
      }
   }
}

