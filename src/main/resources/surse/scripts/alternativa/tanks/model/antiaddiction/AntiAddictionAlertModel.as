package alternativa.tanks.model.antiaddiction
{
   import alternativa.model.IModel;
   import alternativa.model.IObjectLoadListener;
   import alternativa.object.ClientObject;
   import alternativa.osgi.OSGi;
   import alternativa.service.IModelService;
   import alternativa.tanks.gui.AntiAddictionWindow;
   import alternativa.tanks.model.panel.IPanel;
   import flash.display.DisplayObjectContainer;
   import flash.events.Event;
   import projects.tanks.client.panel.model.antiaddictionalert.AntiAddictionAlertModelBase;
   import projects.tanks.client.panel.model.antiaddictionalert.IAntiAddictionAlertModelBase;
   import services.alertservice.Alert;
   
   public class AntiAddictionAlertModel extends AntiAddictionAlertModelBase implements IAntiAddictionAlert, IAntiAddictionAlertModelBase, IObjectLoadListener
   {
      
      private var dialogsLayer:DisplayObjectContainer;
      
      private var antiAddictionWindow:AntiAddictionWindow;
      
      private var clientObject:ClientObject;
      
      public function AntiAddictionAlertModel()
      {
         super();
         _interfaces.push(IModel);
         _interfaces.push(IAntiAddictionAlertModelBase);
         _interfaces.push(IAntiAddictionAlert);
         _interfaces.push(IObjectLoadListener);
      }
      
      public function showAntiAddictionAlert(_arg_1:ClientObject, _arg_2:int) : void
      {
         this.showAntiAddictionWindow(_arg_2);
      }
      
      public function setIdNumberCheckResult(_arg_1:ClientObject, _arg_2:Boolean) : void
      {
         var _local_3:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _local_4:IPanel = _local_3.getModelsByInterface(IPanel)[0] as IPanel;
         if(this.antiAddictionWindow != null && this.dialogsLayer.contains(this.antiAddictionWindow))
         {
            if(!_arg_2)
            {
               _local_4._showMessage("该身份证错误,请重新输入");
               this.antiAddictionWindow.enableButtons();
            }
            else
            {
               _local_4._showMessage("您的身份证信息已通过验证");
               this.dialogsLayer.removeChild(this.antiAddictionWindow);
            }
         }
      }
      
      public function setIdNumberAndRealName(_arg_1:String, _arg_2:String) : void
      {
      }
      
      private function showAntiAddictionWindow(_arg_1:int) : void
      {
         var _local_4:String = null;
         var _local_5:Alert = null;
         var _local_2:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _local_3:IPanel = _local_2.getModelsByInterface(IPanel)[0] as IPanel;
         if(_arg_1 >= 210)
         {
            if(this.antiAddictionWindow != null && this.dialogsLayer.contains(this.antiAddictionWindow))
            {
               this.dialogsLayer.removeChild(this.antiAddictionWindow);
            }
            this.antiAddictionWindow = new AntiAddictionWindow(_arg_1);
            this.antiAddictionWindow.addEventListener(Event.COMPLETE,this.onIDCardEntered);
            this.antiAddictionWindow.addEventListener(Event.CANCEL,this.onIDCardCanceled);
            this.dialogsLayer.addChild(this.antiAddictionWindow);
            this.alignAntiAddictionWindow();
         }
         else
         {
            _local_4 = "";
            if(_arg_1 >= 180)
            {
               _local_4 = "您累计在线时间已满3小时，请您下线休息，做适当身体活动。";
            }
            else if(_arg_1 >= 120)
            {
               _local_4 = "您累计在线时间已满2小时。";
            }
            else if(_arg_1 >= 60)
            {
               _local_4 = "您累计在线时间已满1小时。";
            }
            _local_5 = new Alert();
            this.dialogsLayer.addChild(_local_5);
         }
      }
      
      private function onIDCardEntered(_arg_1:Event) : void
      {
         this.setIdNumberAndRealName(this.antiAddictionWindow.realNameInput.value,this.antiAddictionWindow.idCardInput.value);
         this.antiAddictionWindow.disableButtons();
      }
      
      private function onIDCardCanceled(_arg_1:Event) : void
      {
         var _local_2:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _local_3:IPanel = _local_2.getModelsByInterface(IPanel)[0] as IPanel;
         this.dialogsLayer.removeChild(this.antiAddictionWindow);
      }
      
      private function alignAntiAddictionWindow(_arg_1:Event = null) : void
      {
      }
      
      public function objectLoaded(_arg_1:ClientObject) : void
      {
         this.clientObject = _arg_1;
      }
      
      public function objectUnloaded(_arg_1:ClientObject) : void
      {
         if(this.antiAddictionWindow != null && this.dialogsLayer.contains(this.antiAddictionWindow))
         {
            this.dialogsLayer.removeChild(this.antiAddictionWindow);
         }
      }
   }
}

