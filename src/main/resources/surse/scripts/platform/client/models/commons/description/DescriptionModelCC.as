package platform.client.models.commons.description
{
   public class DescriptionModelCC
   {
      
      private var _description:String;
      
      private var _name:String;
      
      public function DescriptionModelCC(_arg_1:String = null, _arg_2:String = null)
      {
         super();
         this._description = _arg_1;
         this._name = _arg_2;
      }
      
      public function get description() : String
      {
         return this._description;
      }
      
      public function set description(_arg_1:String) : void
      {
         this._description = _arg_1;
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
         var _local_1:* = "DescriptionModelCC [";
         _local_1 += "description = " + this.description + " ";
         _local_1 += "name = " + this.name + " ";
         return _local_1 + "]";
      }
   }
}

