package alternativa.osgi.catalogs
{
   import alternativa.osgi.ServiceParamNames;
   import flash.utils.Dictionary;
   
   public class NamedServicesCatalog
   {
      
      protected var namesDictionary:Dictionary;
      
      private var serviceInterface:Class;
      
      public function NamedServicesCatalog(_arg_1:Class)
      {
         super();
         this.serviceInterface = _arg_1;
         this.namesDictionary = new Dictionary();
      }
      
      public function getService(_arg_1:String) : Object
      {
         if(_arg_1 == null)
         {
            throw new ArgumentError("name can\'t be null");
         }
         return this.namesDictionary[_arg_1];
      }
      
      public function addService(_arg_1:String, _arg_2:Object) : void
      {
         var _local_3:Object = null;
         if(_arg_1 == null)
         {
            throw new ArgumentError("name can\'t be null");
         }
         _local_3 = this.namesDictionary[_arg_1];
         if(_local_3 != null && _local_3 != _arg_2)
         {
            throw new ArgumentError("Service " + this.serviceInterface + "with name \'" + _arg_1 + "\' is already registered");
         }
         this.namesDictionary[_arg_1] = _arg_2;
      }
      
      public function removeService(_arg_1:String) : Object
      {
         var _local_2:Object = null;
         if(_arg_1 == null)
         {
            throw new ArgumentError("name can\'t be null");
         }
         _local_2 = this.namesDictionary[_arg_1];
         delete this.namesDictionary[_arg_1];
         return _local_2;
      }
      
      public function get serviceList() : Vector.<Object>
      {
         var _local_1:Object = null;
         var _local_2:Vector.<Object> = new Vector.<Object>();
         for each(_local_1 in this.namesDictionary)
         {
            _local_2.push(_local_1);
         }
         return _local_2;
      }
      
      public function getServicesInfo() : Vector.<ServiceInfo>
      {
         var _local_1:* = undefined;
         var _local_2:Vector.<ServiceInfo> = new Vector.<ServiceInfo>();
         for(_local_1 in this.namesDictionary)
         {
            _local_2.push(new ServiceInfo(this.namesDictionary[_local_1],Vector.<ServiceParam>([new ServiceParam(ServiceParamNames.PARAM_NAME,_local_1)])));
         }
         return _local_2;
      }
   }
}

