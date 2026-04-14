package projects.tanks.client.clans.clan.clanflag
{
   import alternativa.types.Long;
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class ClanFlag
   {
      
      private var _flagImage:ImageResource;
      
      private var _id:Long;
      
      private var _name:String;
      
      public function ClanFlag(_arg_1:ImageResource = null, _arg_2:Long = null, _arg_3:String = null)
      {
         super();
         this._flagImage = _arg_1;
         this._id = _arg_2;
         this._name = _arg_3;
      }
      
      public function get flagImage() : ImageResource
      {
         return this._flagImage;
      }
      
      public function set flagImage(_arg_1:ImageResource) : void
      {
         this._flagImage = _arg_1;
      }
      
      public function get id() : Long
      {
         return this._id;
      }
      
      public function set id(_arg_1:Long) : void
      {
         this._id = _arg_1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(_arg_1:String) : void
      {
         this._name = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "ClanFlag [";
         _local_1 += "flagImage = " + this.flagImage + " ";
         _local_1 += "id = " + this.id + " ";
         _local_1 += "name = " + this.name + " ";
         return _local_1 + "]";
      }
   }
}

