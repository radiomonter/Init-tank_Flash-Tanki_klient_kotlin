package alternativa.tanks.model.payment
{
   import alternativa.model.IModel;
   import alternativa.model.IObjectLoadListener;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import flash.net.SharedObject;
   import projects.tanks.client.panel.model.payment.IPaymentModelBase;
   import projects.tanks.client.panel.model.payment.PaymentModelBase;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   
   public class PaymentModel extends PaymentModelBase implements IPaymentModelBase, IObjectLoadListener, IPayment
   {
      
      private var clientObject:ClientObject;
      
      private var _accountId:String;
      
      private var _projectId:int;
      
      private var _formId:String;
      
      private var _currentLocaleCurrency:String;
      
      public function PaymentModel()
      {
         super();
         _interfaces.push(IModel);
         _interfaces.push(IPayment);
         _interfaces.push(IPaymentModelBase);
         _interfaces.push(IObjectLoadListener);
      }
      
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         this.clientObject = _arg_1;
      }
      
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         this.clientObject = null;
      }
      
      public function setInitData(_arg_1:ClientObject, _arg_2:Array, _arg_3:Array, _arg_4:String, _arg_5:int, _arg_6:String, _arg_7:String) : void
      {
         var _local_10:int = 0;
         this._accountId = _arg_4;
         this._projectId = _arg_5;
         this._formId = _arg_6;
         this._currentLocaleCurrency = _arg_7;
         var _local_8:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _local_9:Vector.<IModel> = _local_8.getModelsByInterface(IPaymentListener);
         if(_local_9 != null)
         {
            _local_10 = 0;
            while(_local_10 < _local_9.length)
            {
               (_local_9[_local_10] as IPaymentListener).setInitData(_arg_2,_arg_3,_arg_4,_arg_5,_arg_6);
               _local_10++;
            }
         }
      }
      
      public function setOperators(_arg_1:ClientObject, _arg_2:String, _arg_3:Array) : void
      {
         var _local_6:int = 0;
         var _local_4:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _local_5:Vector.<IModel> = _local_4.getModelsByInterface(IPaymentListener);
         if(_local_5 != null)
         {
            _local_6 = 0;
            while(_local_6 < _local_5.length)
            {
               (_local_5[_local_6] as IPaymentListener).setOperators(_arg_2,_arg_3);
               _local_6++;
            }
         }
      }
      
      public function setNumbers(_arg_1:ClientObject, _arg_2:int, _arg_3:Array) : void
      {
         var _local_6:int = 0;
         var _local_4:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _local_5:Vector.<IModel> = _local_4.getModelsByInterface(IPaymentListener);
         if(_local_5 != null)
         {
            _local_6 = 0;
            while(_local_6 < _local_5.length)
            {
               (_local_5[_local_6] as IPaymentListener).setNumbers(_arg_2,_arg_3);
               _local_6++;
            }
         }
      }
      
      public function getData() : void
      {
      }
      
      public function getOperatorsList(_arg_1:String) : void
      {
      }
      
      public function getNumbersList(_arg_1:int) : void
      {
         var _local_2:SharedObject = IStorageService(OSGi.getInstance().getService(IStorageService)).getStorage();
         _local_2.data.userOperator = _arg_1;
      }
      
      public function get currentLocaleCurrency() : String
      {
         return this._currentLocaleCurrency;
      }
      
      public function get accountId() : String
      {
         return this._accountId;
      }
      
      public function get projectId() : int
      {
         return this._projectId;
      }
      
      public function get formId() : String
      {
         return this._formId;
      }
   }
}

