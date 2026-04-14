package alternativa.tanks.gui
{
   import alternativa.osgi.service.locale.ILocaleService;
   import controls.base.LabelBase;
   import flash.display.Sprite;
   import forms.ColorConstants;
   import forms.userlabel.UserLabel;
   import obfuscation.wesifi.Tolisi;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Hovoja extends Sprite
   {
      
      [Inject]
      public static var localeService:ILocaleService;
      
      private var dyjihu:LabelBase;
      
      private var ryviqe:UserLabel;
      
      private var dateLabel:LabelBase;
      
      private var messageLabel:LabelBase;
      
      public function Hovoja(_arg_1:int)
      {
         var _local_2:LabelBase = null;
         super();
         this.dyjihu = new LabelBase();
         this.dyjihu.text = localeService.getText(TanksLocale.TEXT_PRESENT_INFO_FROM_LABEL);
         this.dyjihu.color = ColorConstants.GREEN_TEXT;
         addChild(this.dyjihu);
         this.dateLabel = new LabelBase();
         this.dateLabel.y = this.dyjihu.height;
         this.dateLabel.color = ColorConstants.GREEN_TEXT;
         addChild(this.dateLabel);
         _local_2 = new LabelBase();
         _local_2.y = this.dateLabel.y + this.dateLabel.height + 12;
         _local_2.text = localeService.getText(TanksLocale.TEXT_PRESENT_INFO_MESSAGE_LABEL);
         _local_2.color = ColorConstants.GREEN_TEXT;
         addChild(_local_2);
         this.messageLabel = new LabelBase();
         this.messageLabel.multiline = true;
         this.messageLabel.wordWrap = true;
         this.messageLabel.width = _arg_1;
         this.messageLabel.color = ColorConstants.GREEN_TEXT;
         this.messageLabel.y = _local_2.y + this.dateLabel.height + 12;
         addChild(this.messageLabel);
      }
      
      public function update(_arg_1:String, _arg_2:Date, _arg_3:String) : void
      {
         this.lem();
         this.ryviqe = new UserLabel(_arg_1);
         this.ryviqe.x = this.dyjihu.textWidth + 2;
         addChild(this.ryviqe);
         this.dateLabel.text = localeService.getText(TanksLocale.TEXT_PRESENT_INFO_DATE_LABEL) + " " + Tolisi.mahy(_arg_2) + " " + Tolisi.formatTime(_arg_2);
         this.messageLabel.text = _arg_3;
      }
      
      public function jovu(_arg_1:Number) : void
      {
         this.messageLabel.width = _arg_1;
      }
      
      public function lem() : void
      {
         if(this.ryviqe != null)
         {
            if(contains(this.ryviqe))
            {
               removeChild(this.ryviqe);
            }
            this.ryviqe = null;
         }
      }
      
      public function destroy() : void
      {
         this.lem();
      }
   }
}

