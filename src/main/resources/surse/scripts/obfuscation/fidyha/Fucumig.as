package obfuscation.fidyha
{
   public class Fucumig
   {
      
      private var _clanLink:String;
      
      private var _clanName:String;
      
      public function Fucumig(_arg_1:String = null, _arg_2:String = null)
      {
         super();
         this._clanLink = _arg_1;
         this._clanName = _arg_2;
      }
      
      public function get clanLink() : String
      {
         return this._clanLink;
      }
      
      public function set clanLink(_arg_1:String) : void
      {
         this._clanLink = _arg_1;
      }
      
      public function get clanName() : String
      {
         return this._clanName;
      }
      
      public function set clanName(_arg_1:String) : void
      {
         this._clanName = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ClanInfoCC [";
         _local_1 += "clanLink = " + this.clanLink + " ";
         _local_1 += "clanName = " + this.clanName + " ";
         return _local_1 + "]";
      }
   }
}

