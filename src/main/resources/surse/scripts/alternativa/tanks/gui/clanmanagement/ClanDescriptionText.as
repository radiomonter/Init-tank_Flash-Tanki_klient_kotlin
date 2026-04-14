package alternativa.tanks.gui.clanmanagement
{
   import alternativa.tanks.utils.LinksInterceptor;
   import controls.base.LabelBase;
   import flash.events.TextEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class ClanDescriptionText extends LabelBase
   {
      
      public function ClanDescriptionText()
      {
         super();
      }
      
      override public function set text(_arg_1:String) : void
      {
         var _local_2:LinksInterceptor = new LinksInterceptor(new Vector.<String>());
         var _local_3:String = _local_2.checkLinks(_arg_1);
         var _local_4:Boolean = _local_2.htmlFlag;
         if(_local_4)
         {
            super.htmlText = _local_3;
         }
         else
         {
            super.text = _local_3;
         }
         correctCursorBehaviour = false;
         selectable = true;
         addEventListener(TextEvent.LINK,this.onTextLink);
      }
      
      private function onTextLink(_arg_1:TextEvent) : void
      {
         var _local_2:String = _arg_1.text;
         navigateToURL(new URLRequest(_local_2),"_blank");
      }
   }
}

