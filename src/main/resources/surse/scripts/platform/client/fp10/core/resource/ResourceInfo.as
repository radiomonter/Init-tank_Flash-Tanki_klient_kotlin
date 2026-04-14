package platform.client.fp10.core.resource
{
   import alternativa.types.Long;
   
   public class ResourceInfo
   {
      
      public var type:int;
      
      public var id:Long;
      
      public var version:Long;
      
      public var isLazy:Boolean;
      
      public var resourceParams:Object;
      
      public function ResourceInfo(_arg_1:int, _arg_2:Long, _arg_3:Long, _arg_4:Boolean, _arg_5:Object = null)
      {
         super();
         this.type = _arg_1;
         this.id = _arg_2;
         this.version = _arg_3;
         this.isLazy = _arg_4;
         this.resourceParams = _arg_5;
      }
      
      public function toString() : String
      {
         return "[ResourceInfo type=" + this.type + ", id=" + this.id + ", version=" + this.version + ", isLazy=" + this.isLazy + "]";
      }
   }
}

