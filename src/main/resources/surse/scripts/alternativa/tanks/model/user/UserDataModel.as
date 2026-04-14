package alternativa.tanks.model.user
{
   import alternativa.model.IModel;
   import alternativa.model.IObjectLoadListener;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import flash.utils.Dictionary;
   import projects.tanks.client.panel.model.IUserDataModelBase;
   import projects.tanks.client.panel.model.UserDataModelBase;
   
   public class UserDataModel extends UserDataModelBase implements IUserDataModelBase, IObjectLoadListener, IUserData
   {
      
      private var clientObject:ClientObject;
      
      private var data:Dictionary;
      
      private var _userId:String;
      
      private var _userName:String;
      
      public function UserDataModel()
      {
         super();
         _interfaces.push(IModel);
         _interfaces.push(IUserData);
         _interfaces.push(IObjectLoadListener);
         _interfaces.push(IUserDataModelBase);
         this.data = new Dictionary(false);
      }
      
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         this.clientObject = _arg_1;
      }
      
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         this.clientObject = null;
      }
      
      public function initObject(_arg_1:ClientObject, _arg_2:String, _arg_3:String) : void
      {
         this._userId = _arg_3;
         this._userName = _arg_2;
      }
      
      public function setUserData(_arg_1:ClientObject, _arg_2:String, _arg_3:String, _arg_4:int) : void
      {
         var _local_7:int = 0;
         this.data[_arg_2] = new UserData(_arg_2,_arg_3,_arg_4);
         var _local_5:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _local_6:Vector.<IModel> = _local_5.getModelsByInterface(IUserDataListener);
         if(_local_6 != null)
         {
            _local_7 = 0;
            while(_local_7 < _local_6.length)
            {
               _local_7++;
            }
         }
      }
      
      public function getData(_arg_1:String) : UserData
      {
         var _local_2:UserData = null;
         if(this.data[_arg_1] != null)
         {
            _local_2 = this.data[_arg_1];
         }
         return _local_2;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
   }
}

