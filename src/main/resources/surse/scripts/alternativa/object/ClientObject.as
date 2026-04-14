package alternativa.object
{
   import alternativa.model.IModel;
   import alternativa.register.ClientClass;
   import alternativa.types.Long;
   import flash.utils.Dictionary;
   import projects.tanks.client.panel.model.User;
   
   public class ClientObject
   {
      
      private var _name:String;
      
      private var _id:String;
      
      private var _clientClass:ClientClass;
      
      private var models:Vector.<Long>;
      
      private var initParams:Dictionary;
      
      private var runtimeParams:Dictionary;
      
      private var user:User;
      
      public function ClientObject(_arg_1:String, _arg_2:ClientClass, _arg_3:String, _arg_4:String = null)
      {
         super();
         this._id = _arg_1;
         this._clientClass = _arg_2;
         this._name = _arg_3;
         if(this.models != null)
         {
            this.models = this.models;
         }
         else
         {
            this.models = new Vector.<Long>();
         }
         this.initParams = new Dictionary();
         this.runtimeParams = new Dictionary();
      }
      
      public function getParams(_arg_1:Class) : Object
      {
         return this.runtimeParams[_arg_1];
      }
      
      public function putParams(_arg_1:Class, _arg_2:Object) : void
      {
         this.runtimeParams[_arg_1] = _arg_2;
      }
      
      public function removeParams(_arg_1:Class) : Object
      {
         var _local_2:Object = this.runtimeParams[_arg_1];
         delete this.runtimeParams[_arg_1];
         return _local_2;
      }
      
      public function getInitParams(_arg_1:IModel) : Object
      {
         return this.initParams[_arg_1];
      }
      
      public function putInitParams(_arg_1:IModel, _arg_2:Object) : void
      {
         this.initParams[_arg_1] = _arg_2;
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get clientClass() : ClientClass
      {
         return this._clientClass;
      }
      
      public function getModels() : Vector.<String>
      {
         return this._clientClass.models;
      }
   }
}

