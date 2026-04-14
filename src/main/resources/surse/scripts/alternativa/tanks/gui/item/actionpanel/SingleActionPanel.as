package alternativa.tanks.gui.item.actionpanel
{
   import alternativa.osgi.OSGi;
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.buttons.h50px.GreyBigButton;
   import flash.display.DisplayObjectContainer;
   import flash.events.MouseEvent;
   import platform.client.fp10.core.type.AutoClosable;
   
   public class SingleActionPanel implements AutoClosable
   {
      
      [Inject]
      public static var localeService:ILocaleService = ILocaleService(OSGi.getInstance().getService(ILocaleService));
      
      protected var actionButton:GreyBigButton = new GreyBigButton();
      
      private var action:Function;
      
      public function SingleActionPanel(_arg_1:String, _arg_2:Function)
      {
         super();
         this.action = _arg_2;
         this.actionButton.label = localeService.getText(_arg_1);
         this.actionButton.visible = _arg_2 != null;
         this.actionButton.addEventListener(MouseEvent.CLICK,this.onClick);
         this.actionButton.x = 11;
      }
      
      private function onClick(_arg_1:MouseEvent) : void
      {
         this.action();
      }
      
      public function set enabled(_arg_1:Boolean) : void
      {
         this.actionButton.enabled = _arg_1;
      }
      
      public function get enabled() : Boolean
      {
         return this.actionButton.enabled;
      }
      
      public function updateActionElements(_arg_1:DisplayObjectContainer) : void
      {
         _arg_1.addChild(this.actionButton);
      }
      
      public function close() : void
      {
         this.actionButton.removeEventListener(MouseEvent.CLICK,this.onClick);
      }
   }
}

