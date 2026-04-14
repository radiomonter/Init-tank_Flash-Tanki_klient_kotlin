package projects.tanks.clients.flash.resources.resource.loaders
{
   public class TextureInfo
   {
      
      public var diffuseMapFileName:String;
      
      public var opacityMapFileName:String;
      
      public function TextureInfo(_arg_1:String = null, _arg_2:String = null)
      {
         super();
         this.diffuseMapFileName = _arg_1;
         this.opacityMapFileName = _arg_2;
      }
      
      public function toString() : String
      {
         return "[TextureInfo diffuseMapFileName=" + this.diffuseMapFileName + ", opacityMapFileName=" + this.opacityMapFileName + "]";
      }
   }
}

