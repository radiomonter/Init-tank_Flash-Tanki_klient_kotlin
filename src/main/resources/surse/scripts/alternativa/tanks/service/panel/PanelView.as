package alternativa.tanks.service.panel
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.display.IDisplay;
   import flash.events.EventDispatcher;
   import forms.MainPanel;
   import services.alertservice.Alert;
   import services.alertservice.AlertAnswer;
   
   public class PanelView extends EventDispatcher implements IPanelView
   {
      
      [Inject]
      public static var display:IDisplay = IDisplay(OSGi.getInstance().getService(IDisplay));
      
      private var panel:MainPanel;
      
      public function PanelView()
      {
         super();
      }
      
      public function qaboqu(_arg_1:Boolean, _arg_2:Boolean, _arg_3:Boolean = false, _arg_4:Boolean = false, _arg_5:Boolean = false) : void
      {
         this.panel = new MainPanel();
      }
      
      public function getPanel() : MainPanel
      {
         return this.panel;
      }
      
      public function lock() : void
      {
         this.panel.mouseEnabled = false;
         this.panel.mouseChildren = false;
      }
      
      public function unlock() : void
      {
         this.panel.mouseEnabled = true;
         this.panel.mouseChildren = true;
      }
      
      public function showAlert(_arg_1:String) : void
      {
         var _local_2:Alert = new Alert();
         _local_2.showAlert(_arg_1,Vector.<String>([AlertAnswer.OK]));
         display.dialogsLayer.addChild(_local_2);
      }
   }
}

