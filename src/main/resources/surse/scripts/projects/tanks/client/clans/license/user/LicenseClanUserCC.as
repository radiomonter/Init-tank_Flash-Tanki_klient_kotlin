package projects.tanks.client.clans.license.user
{
   import platform.client.fp10.core.type.IGameObject;
   
   public class LicenseClanUserCC
   {
      
      private var _clanLicense:Boolean;
      
      private var _licenseGarageObject:IGameObject;
      
      public function LicenseClanUserCC(_arg_1:Boolean = false, _arg_2:IGameObject = null)
      {
         super();
         this._clanLicense = _arg_1;
         this._licenseGarageObject = _arg_2;
      }
      
      public function get clanLicense() : Boolean
      {
         return this._clanLicense;
      }
      
      public function set clanLicense(_arg_1:Boolean) : void
      {
         this._clanLicense = _arg_1;
      }
      
      public function get licenseGarageObject() : IGameObject
      {
         return this._licenseGarageObject;
      }
      
      public function set licenseGarageObject(_arg_1:IGameObject) : void
      {
         this._licenseGarageObject = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "LicenseClanUserCC [";
         _local_1 += "clanLicense = " + this.clanLicense + " ";
         _local_1 += "licenseGarageObject = " + this.licenseGarageObject + " ";
         return _local_1 + "]";
      }
   }
}

