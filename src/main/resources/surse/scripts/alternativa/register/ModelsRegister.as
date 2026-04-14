package alternativa.register
{
   import alternativa.model.IModel;
   import alternativa.object.ClientObject;
   import alternativa.service.IModelService;
   import flash.utils.Dictionary;
   
   public class ModelsRegister implements IModelService
   {
      
      private var modelInstances:Dictionary;
      
      private var modelInstancesByInterface:Dictionary;
      
      private var modelInterfaces:Dictionary;
      
      private var modelByMethod:Dictionary;
      
      private var modelsParamsStruct:Dictionary;
      
      private var _modelsList:Vector.<IModel>;
      
      public function ModelsRegister()
      {
         super();
         this.modelInterfaces = new Dictionary();
         this.modelInstances = new Dictionary();
         this.modelByMethod = new Dictionary();
         this.modelInstancesByInterface = new Dictionary();
         this.modelsParamsStruct = new Dictionary();
         this._modelsList = new Vector.<IModel>();
      }
      
      public function register(_arg_1:String, _arg_2:String) : void
      {
         this.modelByMethod[_arg_2] = _arg_1;
      }
      
      public function registerModelsParamsStruct(_arg_1:String, _arg_2:Class) : void
      {
         this.modelsParamsStruct[_arg_1] = _arg_2;
      }
      
      public function unregisterModelsParamsStruct(_arg_1:String) : void
      {
         this.modelsParamsStruct[_arg_1] = null;
      }
      
      public function getModelsParamsStruct(_arg_1:String) : Class
      {
         return this.modelsParamsStruct[_arg_1];
      }
      
      public function add(_arg_1:IModel) : void
      {
         var _local_5:Class = null;
         var _local_6:Vector.<IModel> = null;
         var _local_4:int = 0;
         this._modelsList.push(_arg_1);
         var _local_2:String = _arg_1.id;
         this.modelInstances[_local_2] = _arg_1;
         var _local_3:Vector.<Class> = _arg_1.interfaces;
         this.modelInterfaces[_local_2] = _local_3;
         while(_local_4 < _local_3.length)
         {
            _local_5 = _local_3[_local_4];
            _local_6 = this.modelInstancesByInterface[_local_5];
            if(_local_6 == null)
            {
               this.modelInstancesByInterface[_local_5] = _local_6 = new Vector.<IModel>();
            }
            _local_6.push(_arg_1);
            _local_4++;
         }
      }
      
      public function remove(_arg_1:String) : void
      {
         var _local_2:* = undefined;
         var _local_3:IModel = null;
         var _local_4:Vector.<Class> = null;
         var _local_5:int = 0;
         var _local_6:String = null;
         var _local_7:Class = null;
         var _local_8:Vector.<IModel> = null;
         var _local_9:int = 0;
         this._modelsList.splice(this._modelsList.indexOf(this.modelInstances[_arg_1]),1);
         for(_local_2 in this.modelByMethod)
         {
            _local_6 = this.modelByMethod[_local_2];
            if(_local_6 == _arg_1)
            {
               delete this.modelByMethod[_local_2];
            }
         }
         _local_3 = IModel(this.modelInstances[_arg_1]);
         _local_4 = this.modelInterfaces[_arg_1] as Vector.<Class>;
         _local_5 = 0;
         while(_local_5 < _local_4.length)
         {
            _local_7 = _local_4[_local_5];
            _local_8 = this.modelInstancesByInterface[_local_7] as Vector.<IModel>;
            _local_9 = _local_8.indexOf(_local_3);
            _local_8.splice(_local_9,1);
            _local_5++;
         }
         delete this.modelInterfaces[_arg_1];
         delete this.modelInstances[_arg_1];
      }
      
      public function getModel(_arg_1:String) : IModel
      {
         return this.modelInstances[_arg_1];
      }
      
      public function getModelsByInterface(_arg_1:Class) : Vector.<IModel>
      {
         return this.modelInstancesByInterface[_arg_1];
      }
      
      public function getModelForObject(_arg_1:ClientObject, _arg_2:Class) : IModel
      {
         var _local_3:String = null;
         var _local_4:IModel = null;
         var _local_7:Vector.<Class> = null;
         var _local_8:int = 0;
         if(_arg_1 == null)
         {
            _local_3 = "Object is null. Model interface = " + _arg_2;
         }
         if(_arg_2 == null)
         {
            _local_3 = "Model interface is null. Object id = " + _arg_1.id;
            throw new ArgumentError(_local_3);
         }
         var _local_5:Vector.<String> = _arg_1.getModels();
         var _local_6:int = _local_5.length - 1;
         while(_local_6 >= 0)
         {
            _local_7 = this.modelInterfaces[_local_5[_local_6]] as Vector.<Class>;
            if(_local_7 == null)
            {
               throw new Error("No interfaces found. Object id=" + _arg_1.id + ", model id=" + _local_5[_local_6]);
            }
            _local_8 = _local_7.length - 1;
            while(_local_8 >= 0)
            {
               if(_local_7[_local_8] == _arg_2)
               {
                  if(_local_4 == null)
                  {
                     _local_4 = this.getModel(_local_5[_local_6]);
                     break;
                  }
                  throw new Error("MODEL REGISTER getModelForObject: Найдено несколько моделей с указанным интерфейсом.");
               }
               _local_8--;
            }
            _local_6--;
         }
         return _local_4;
      }
      
      public function getModelsForObject(_arg_1:ClientObject, _arg_2:Class) : Vector.<IModel>
      {
         var _local_6:Vector.<Class> = null;
         var _local_7:int = 0;
         var _local_3:Vector.<IModel> = new Vector.<IModel>();
         var _local_4:Vector.<String> = _arg_1.getModels();
         var _local_5:int = _local_4.length - 1;
         while(_local_5 >= 0)
         {
            _local_6 = this.modelInterfaces[_local_4[_local_5]] as Vector.<Class>;
            if(_local_6 == null)
            {
               throw new Error("No interfaces found. Object id=" + _arg_1.id + ", model id=" + _local_4[_local_5]);
            }
            _local_7 = _local_6.length - 1;
            while(_local_7 >= 0)
            {
               if(_local_6[_local_7] == _arg_2)
               {
                  _local_3.push(this.getModel(_local_4[_local_5]));
                  break;
               }
               _local_7--;
            }
            _local_5--;
         }
         return _local_3;
      }
      
      public function getInterfacesForModel(_arg_1:String) : Vector.<Class>
      {
         return this.modelInterfaces[_arg_1];
      }
      
      public function get modelsList() : Vector.<IModel>
      {
         return this._modelsList;
      }
   }
}

