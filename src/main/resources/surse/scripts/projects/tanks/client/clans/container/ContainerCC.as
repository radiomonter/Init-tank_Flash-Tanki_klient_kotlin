package projects.tanks.client.clans.container
{
   public class ContainerCC
   {
      
      private var _objects:Vector.<String>;
      
      public function ContainerCC(_arg_1:Vector.<String> = null)
      {
         super();
         this._objects = _arg_1;
      }
      
      public function get objects() : Vector.<String>
      {
         return this._objects;
      }
      
      public function set objects(_arg_1:Vector.<String>) : void
      {
         this._objects = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:String = "ContainerCC [";
         _local_1 += "objects = " + this.objects + " ";
         return _local_1 + "]";
      }
   }
}

