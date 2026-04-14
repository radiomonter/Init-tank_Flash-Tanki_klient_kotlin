package alternativa.tanks.gui.components.flag
{
   import alternativa.tanks.models.panel.create.ClanCreateService;
   import flash.display.Bitmap;
   import flash.display.Sprite;
   import projects.tanks.client.clans.clan.clanflag.ClanFlag;
   
   public class Flag extends Sprite
   {
      
      [Inject]
      public static var clanCreateService:ClanCreateService;
      
      public var country:ClanFlag;
      
      private var flag:Bitmap;
      
      public function Flag(_arg_1:ClanFlag = null)
      {
         super();
         if(_arg_1 == null)
         {
            _arg_1 = clanCreateService.defaultFlag;
         }
         this.setFlag(_arg_1);
      }
      
      public static function getFlag(_arg_1:ClanFlag) : Bitmap
      {
         return new Bitmap(_arg_1.flagImage.data);
      }
      
      public function setFlag(_arg_1:ClanFlag) : void
      {
         this.removeAllChildren();
         this.flag = getFlag(_arg_1);
         this.country = _arg_1;
         addChild(this.flag);
      }
      
      private function removeAllChildren() : void
      {
         while(numChildren > 0)
         {
            removeChildAt(0);
         }
      }
   }
}

