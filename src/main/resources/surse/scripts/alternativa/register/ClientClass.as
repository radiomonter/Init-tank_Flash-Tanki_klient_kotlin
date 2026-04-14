package alternativa.register
{
   import flash.utils.Dictionary;
   
   public class ClientClass
   {
      
      private var _name:String;
      
      private var _id:String;
      
      private var _parent:ClientClass;
      
      private var _children:Vector.<ClientClass>;
      
      private var _models:Vector.<String>;
      
      private var _modelsParams:Dictionary;
      
      public function ClientClass(_arg_1:String, _arg_2:ClientClass, _arg_3:String, _arg_4:Vector.<String> = null)
      {
         super();
         this._id = _arg_1;
         this._parent = _arg_2;
         this._name = _arg_3;
         this._children = new Vector.<ClientClass>();
         this._modelsParams = new Dictionary();
         if(_arg_4 != null)
         {
            this._models = _arg_4;
         }
         else
         {
            this._models = new Vector.<String>();
         }
      }
      
      public function addChild(_arg_1:ClientClass) : void
      {
         this._children.push(_arg_1);
      }
      
      public function removeChild(_arg_1:ClientClass) : void
      {
         this._children.splice(this._children.indexOf(_arg_1),1);
      }
      
      public function get id() : String
      {
         return this._id;
      }
      
      public function get parent() : ClientClass
      {
         return this._parent;
      }
      
      public function get children() : Vector.<ClientClass>
      {
         return this._children;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get models() : Vector.<String>
      {
         return this._models;
      }
      
      public function get modelsParams() : Dictionary
      {
         return this._modelsParams;
      }
      
      public function setModelParams(_arg_1:String, _arg_2:Object) : void
      {
         this._modelsParams[_arg_1] = _arg_2;
      }
      
      public function toString() : String
      {
         var _local_2:int = 0;
         var _local_3:* = undefined;
         var _local_1:* = "\nClientClass";
         _local_1 += "\n   id: " + this._id;
         _local_1 += "\n   name: " + this._name;
         if(this._parent != null)
         {
            _local_1 += "\n   parent id: " + this._parent.id;
         }
         if(this._children.length > 0)
         {
            _local_1 += "\n   children id:";
            _local_2 = 0;
            while(_local_2 < this._children.length)
            {
               _local_1 += " " + ClientClass(this._children[_local_2]).id;
               _local_2++;
            }
         }
         if(this._models.length > 0)
         {
            _local_1 += "\n   models: " + this._models;
            _local_1 += "\n   modelParams: \n";
            for(_local_3 in this._modelsParams)
            {
               _local_1 += "\n   " + _local_3.toString() + ": " + this._modelsParams[_local_3];
            }
         }
         return _local_1 + "\n";
      }
   }
}

