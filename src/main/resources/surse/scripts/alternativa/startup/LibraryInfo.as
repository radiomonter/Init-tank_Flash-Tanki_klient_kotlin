package alternativa.startup
{
   import alternativa.utils.Properties;
   import flash.display.Loader;
   
   public class LibraryInfo
   {
      
      public var name:String;
      
      public var resourceId:String;
      
      public var resourceVersion:String;
      
      public var manifestProperties:Properties;
      
      public var loader:Loader;
      
      public var size:int;
      
      public function LibraryInfo(_arg_1:String, _arg_2:String, _arg_3:String, _arg_4:Properties, _arg_5:int)
      {
         super();
         this.name = _arg_1;
         this.resourceId = _arg_2;
         this.resourceVersion = _arg_3;
         this.manifestProperties = _arg_4;
         this.size = _arg_5;
      }
      
      public function toString() : String
      {
         return "[BundleInfo name=" + this.name + ", id=" + this.resourceId + ", version=" + this.resourceVersion + ", manifestProperties=" + this.manifestProperties + ", size=" + this.size;
      }
   }
}

