package alternativa.osgi.catalogs
{
   import alternativa.osgi.ServiceParamNames;
   import flash.utils.Dictionary;
   
   public class ServicesCatalog
   {
      
      protected var _namedServicesDictionary:Dictionary;
      
      protected var _nullParamsServiceDictionary:Dictionary;
      
      public function ServicesCatalog()
      {
         super();
         this._namedServicesDictionary = new Dictionary();
         this._nullParamsServiceDictionary = new Dictionary();
      }
      
      public function getService(_arg_1:Class, _arg_2:String) : Object
      {
         var _local_3:String = null;
         var _local_4:NamedServicesCatalog = null;
         if(Boolean(_arg_2))
         {
            _local_3 = this.getNameByFilter(_arg_2);
            if(_local_3 != null)
            {
               _local_4 = this._namedServicesDictionary[_arg_1];
               if(_local_4 != null)
               {
                  return _local_4.getService(_local_3);
               }
            }
            return null;
         }
         return this._nullParamsServiceDictionary[_arg_1];
      }
      
      public function getNameByFilter(_arg_1:String) : String
      {
         var _local_2:String = null;
         if(_arg_1 == null)
         {
            return null;
         }
         var _local_3:RegExp = / /gi;
         _arg_1 = _arg_1.replace(_local_3,"");
         var _local_4:int = _arg_1.indexOf("name=");
         if(_local_4 != -1)
         {
            _local_2 = _arg_1.substr(_local_4 + 5,_arg_1.length - _local_4 - 5);
            _local_4 = _local_2.indexOf(")");
            if(_local_4 != -1)
            {
               return _local_2.substr(0,_local_4);
            }
            return _local_2;
         }
         return null;
      }
      
      public function addService(_arg_1:Class, _arg_2:Object, _arg_3:Dictionary) : void
      {
         var _local_4:String = null;
         var _local_5:NamedServicesCatalog = null;
         if(_arg_3 == null)
         {
            if(this._nullParamsServiceDictionary[_arg_1] != null)
            {
               throw new ArgumentError("Service " + _arg_1 + " without parameters is already registered");
            }
            this._nullParamsServiceDictionary[_arg_1] = _arg_2;
         }
         else
         {
            _local_4 = _arg_3[ServiceParamNames.PARAM_NAME];
            if(_local_4 == null)
            {
               throw new ArgumentError("Invalid params. You can only use the parameter \'name\'");
            }
            _local_5 = this._namedServicesDictionary[_arg_1];
            if(_local_5 == null)
            {
               _local_5 = new NamedServicesCatalog(_arg_1);
               this._namedServicesDictionary[_arg_1] = _local_5;
            }
            _local_5.addService(_local_4,_arg_2);
         }
      }
      
      public function removeService(_arg_1:Class, _arg_2:Dictionary) : Object
      {
         var _local_3:String = null;
         var _local_4:NamedServicesCatalog = null;
         var _local_5:Object = null;
         if(_arg_2 != null)
         {
            _local_3 = _arg_2[ServiceParamNames.PARAM_NAME];
            if(_local_3 != null)
            {
               _local_4 = this._namedServicesDictionary[_arg_1];
               if(_local_4 != null)
               {
                  return _local_4.removeService(_local_3);
               }
            }
            return null;
         }
         _local_5 = this._nullParamsServiceDictionary[_arg_1];
         delete this._nullParamsServiceDictionary[_arg_1];
         return _local_5;
      }
      
      public function get serviceList() : Vector.<Object>
      {
         var _local_1:Object = null;
         var _local_2:NamedServicesCatalog = null;
         var _local_3:Vector.<Object> = null;
         var _local_4:int = 0;
         var _local_5:int = 0;
         var _local_6:Vector.<Object> = new Vector.<Object>();
         for each(_local_1 in this._nullParamsServiceDictionary)
         {
            _local_6.push(_local_1);
         }
         for each(_local_2 in this._namedServicesDictionary)
         {
            _local_3 = _local_2.serviceList;
            _local_4 = 0;
            _local_5 = int(_local_3.length);
            while(_local_4 < _local_5)
            {
               _local_1 = _local_3[_local_4];
               if(_local_6.indexOf(_local_1) == -1)
               {
                  _local_6.push(_local_1);
               }
               _local_4++;
            }
         }
         return _local_6;
      }
      
      public function getServicesInfo() : Vector.<ServiceInfo>
      {
         var _local_1:Object = null;
         var _local_2:NamedServicesCatalog = null;
         var _local_3:Vector.<ServiceInfo> = null;
         var _local_4:int = 0;
         var _local_5:int = 0;
         var _local_6:Vector.<ServiceInfo> = new Vector.<ServiceInfo>();
         for each(_local_1 in this._nullParamsServiceDictionary)
         {
            _local_6.push(new ServiceInfo(_local_1,null));
         }
         for each(_local_2 in this._namedServicesDictionary)
         {
            _local_3 = _local_2.getServicesInfo();
            _local_4 = 0;
            _local_5 = int(_local_3.length);
            while(_local_4 < _local_5)
            {
               _local_6.push(_local_3[_local_4]);
               _local_4++;
            }
         }
         return _local_6;
      }
   }
}

