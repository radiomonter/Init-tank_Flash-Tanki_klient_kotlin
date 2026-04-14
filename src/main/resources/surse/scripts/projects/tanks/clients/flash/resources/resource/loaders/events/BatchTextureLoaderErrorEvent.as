package projects.tanks.clients.flash.resources.resource.loaders.events
{
   import flash.events.ErrorEvent;
   import flash.events.Event;
   
   public class BatchTextureLoaderErrorEvent extends ErrorEvent
   {
      
      public static const LOADER_ERROR:String = "loaderError";
      
      private var _textureName:String;
      
      public function BatchTextureLoaderErrorEvent(_arg_1:String, _arg_2:String, _arg_3:String)
      {
         super(_arg_1);
         this.text = _arg_3;
         this._textureName = _arg_2;
      }
      
      public function get textureName() : String
      {
         return this._textureName;
      }
      
      override public function clone() : Event
      {
         return new BatchTextureLoaderErrorEvent(type,this._textureName,text);
      }
      
      override public function toString() : String
      {
         return "[BatchTextureLoaderErrorEvent textureName=" + this._textureName + ", text=" + text + "]";
      }
   }
}

