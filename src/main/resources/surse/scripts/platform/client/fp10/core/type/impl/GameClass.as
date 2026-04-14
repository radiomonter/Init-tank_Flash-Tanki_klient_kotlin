package platform.client.fp10.core.type.impl
{
   import alternativa.osgi.OSGi;
   import alternativa.types.Long;
   import flash.utils.getQualifiedClassName;
   import platform.client.fp10.core.registry.ModelRegistry;
   import platform.client.fp10.core.type.IGameClass;
   
   public class GameClass implements IGameClass
   {
      
      private var _id:Long;
      
      private var _models:Vector.<Long>;
      
      public function GameClass(_arg_1:Long, _arg_2:Vector.<Long> = null)
      {
         super();
         this._id = _arg_1;
         if(_arg_2 != null)
         {
            this._models = _arg_2;
         }
         else
         {
            this._models = new Vector.<Long>();
         }
      }
      
      public function get id() : Long
      {
         return this._id;
      }
      
      public function get models() : Vector.<Long>
      {
         return this._models;
      }
      
      public function toString() : String
      {
         var _local_1:int = 0;
         var _local_2:ModelRegistry = ModelRegistry(OSGi.getInstance().getService(ModelRegistry));
         var _local_3:* = "ClientClass\n";
         _local_3 += "  id: " + this._id + "\n";
         if(this._models.length > 0)
         {
            _local_3 += "  models:\n";
            _local_1 = 0;
            while(_local_1 < this._models.length)
            {
               _local_3 += "    id: " + this._models[_local_1] + ", class: " + getQualifiedClassName(_local_2.getModel(this._models[_local_1])) + "\n";
               _local_1++;
            }
         }
         return _local_3;
      }
   }
}

