package projects.tanks.client.clans.panel.foreignclan
{
   import projects.tanks.client.clans.clan.clanflag.ClanFlag;
   
   public class ForeignClanCC
   {
      
      private var _flags:Vector.<ClanFlag>;
      
      public function ForeignClanCC(_arg_1:Vector.<ClanFlag> = null)
      {
         super();
         this._flags = _arg_1;
      }
      
      public function get flags() : Vector.<ClanFlag>
      {
         return this._flags;
      }
      
      public function set flags(_arg_1:Vector.<ClanFlag>) : void
      {
         this._flags = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "ForeignClanCC [";
         _local_1 += "flags = " + this.flags + " ";
         return _local_1 + "]";
      }
   }
}

