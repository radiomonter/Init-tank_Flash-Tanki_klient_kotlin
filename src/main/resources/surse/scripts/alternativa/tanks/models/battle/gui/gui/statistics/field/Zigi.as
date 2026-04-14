package alternativa.tanks.models.battle.gui.gui.statistics.field
{
   import assets.icons.BattleInfoIcons;
   import controls.Label;
   import flash.display.Sprite;
   
   public class Zigi extends Sprite
   {
      
      protected var icon:BattleInfoIcons;
      
      protected var vedahutef:int;
      
      protected var label:Label;
      
      public function Zigi(_arg_1:int = -1)
      {
         super();
         this.vedahutef = _arg_1;
         this.init();
      }
      
      protected function init() : void
      {
         if(this.vedahutef > -1)
         {
            this.icon = new BattleInfoIcons();
            this.icon.type = this.vedahutef;
            addChild(this.icon);
            this.icon.x = 0;
            this.icon.y = 0;
         }
         this.label = new Label();
         this.label.color = 16777215;
         if(Boolean(this.icon))
         {
            this.label.x = this.icon.width + 3;
         }
         addChild(this.label);
      }
      
      public function set text(_arg_1:String) : void
      {
         this.label.htmlText = _arg_1;
      }
      
      public function set size(_arg_1:Number) : void
      {
         this.label.size = _arg_1;
      }
   }
}

