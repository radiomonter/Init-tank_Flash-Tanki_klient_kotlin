package projects.tanks.client.garage.skins
{
   public class AvailableSkinsCC
   {
      
      private var _skins:Vector.<Object>;
      
      public function AvailableSkinsCC(_arg_1:Vector.<Object> = null)
      {
         super();
         this._skins = _arg_1;
      }
      
      public function get skins() : Vector.<Object>
      {
         return this._skins;
      }
      
      public function set skins(_arg_1:Vector.<Object>) : void
      {
         this._skins = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "AvailableSkinsCC [";
         _local_1 += "skins = " + this.skins + " ";
         return _local_1 + "]";
      }
   }
}

