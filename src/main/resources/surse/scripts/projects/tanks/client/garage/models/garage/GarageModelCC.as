package projects.tanks.client.garage.models.garage
{
   import projects.tanks.clients.flash.resources.resource.Tanks3DSResource;
   
   public class GarageModelCC
   {
      
      private var _garageBox:Tanks3DSResource;
      
      public function GarageModelCC(_arg_1:Tanks3DSResource = null)
      {
         super();
         this._garageBox = _arg_1;
      }
      
      public function get garageBox() : Tanks3DSResource
      {
         return this._garageBox;
      }
      
      public function set garageBox(_arg_1:Tanks3DSResource) : void
      {
         this._garageBox = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "GarageModelCC [";
         _local_1 += "garageBox = " + this.garageBox + " ";
         return _local_1 + "]";
      }
   }
}

