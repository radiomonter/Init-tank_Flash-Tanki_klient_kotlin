package platform.client.core.general.spaces.loading.dispatcher.types
{
   import platform.client.fp10.core.resource.Resource;
   
   public class ObjectsDependencies
   {
      
      private var _callbackId:int;
      
      private var _resources:Vector.<Resource>;
      
      public function ObjectsDependencies(_arg_1:int = 0, _arg_2:Vector.<Resource> = null)
      {
         super();
         this._callbackId = _arg_1;
         this._resources = _arg_2;
      }
      
      public function get callbackId() : int
      {
         return this._callbackId;
      }
      
      public function set callbackId(_arg_1:int) : void
      {
         this._callbackId = _arg_1;
      }
      
      public function get resources() : Vector.<Resource>
      {
         return this._resources;
      }
      
      public function set resources(_arg_1:Vector.<Resource>) : void
      {
         this._resources = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ObjectsDependencies [";
         _local_1 += "callbackId = " + this.callbackId + " ";
         _local_1 += "resources = " + this.resources + " ";
         return _local_1 + "]";
      }
   }
}

