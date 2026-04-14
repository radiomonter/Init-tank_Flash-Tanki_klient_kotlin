package projects.tanks.client.panel.model.bonus.showing.items
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class BonusItemCC
   {
      
      private var _count:int;
      
      private var _resource:ImageResource;
      
      public function BonusItemCC(_arg_1:int = 0, _arg_2:ImageResource = null)
      {
         super();
         this._count = _arg_1;
         this._resource = _arg_2;
      }
      
      public function get count() : int
      {
         return this._count;
      }
      
      public function set count(_arg_1:int) : void
      {
         this._count = _arg_1;
      }
      
      public function get resource() : ImageResource
      {
         return this._resource;
      }
      
      public function set resource(_arg_1:ImageResource) : void
      {
         this._resource = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "BonusItemCC [";
         _local_1 += "count = " + this.count + " ";
         _local_1 += "resource = " + this.resource + " ";
         return _local_1 + "]";
      }
   }
}

