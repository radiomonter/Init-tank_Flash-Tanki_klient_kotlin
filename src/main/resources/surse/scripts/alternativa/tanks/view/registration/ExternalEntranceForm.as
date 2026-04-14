package alternativa.tanks.view.registration
{
   import alternativa.tanks.service.impl.ExternalEntranceService;
   import controls.FBButton;
   import controls.GoogleButton;
   import controls.TankWindow;
   import controls.VKButton;
   import controls.base.LabelBase;
   import controls.containers.HorizontalStackPanel;
   import flash.utils.Dictionary;
   
   public class ExternalEntranceForm extends TankWindow
   {
      
      public var vkButton:VKButton;
      
      public var fbButton:FBButton;
      
      public var googleButton:GoogleButton;
      
      private var infoLabel:LabelBase;
      
      private var buttonsPanel:HorizontalStackPanel;
      
      private var buttons:Dictionary;
      
      public function ExternalEntranceForm(_arg_1:int, _arg_2:int, _arg_3:String)
      {
         var _local_4:String = null;
         this.vkButton = new VKButton();
         this.fbButton = new FBButton();
         this.googleButton = new GoogleButton();
         this.buttonsPanel = new HorizontalStackPanel();
         this.buttons = new Dictionary();
         super(_arg_1,_arg_2);
         this.infoLabel = new LabelBase();
         this.infoLabel.text = _arg_3;
         this.infoLabel.y = 15;
         this.infoLabel.x = _arg_1 / 2 - this.infoLabel.width / 2;
         addChild(this.infoLabel);
         this.buttons[ExternalEntranceService.VKONTAKTE] = this.vkButton;
         this.buttonsPanel.bujet(5);
         for(_local_4 in this.buttons)
         {
            this.buttonsPanel.addItem(this.buttons[_local_4]);
         }
         this.buttonsPanel.y = 35;
         this.buttonsPanel.x = _arg_1 / 2 - this.buttonsPanel.width / 2;
         addChild(this.buttonsPanel);
      }
   }
}

