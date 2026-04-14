package obfuscation.kolut
{
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Zigi;
   import assets.icons.BattleInfoIcons;
   import controls.Label;
   import controls.resultassets.WhiteFrame;
   
   public class Fagibo extends Zigi
   {
      
      private static const keropu:int = 9;
      
      private static const tuhevume:int = 10;
      
      private static const bori:int = 9;
      
      private static const dedojad:int = 6;
      
      private static const womyj:int = 18;
      
      private var kodyberep:WhiteFrame;
      
      public function Fagibo(_arg_1:int)
      {
         super(_arg_1);
      }
      
      override protected function init() : void
      {
         this.kodyberep = new WhiteFrame();
         addChild(this.kodyberep);
         if(vedahutef > -1)
         {
            icon = new BattleInfoIcons();
            icon.type = vedahutef;
            addChild(icon);
            icon.x = keropu;
            icon.y = tuhevume;
         }
         label = new Label();
         label.color = 16777215;
         addChild(label);
         if(Boolean(icon))
         {
            label.x = icon.x + icon.width + bori;
         }
         else
         {
            label.x = bori;
         }
         label.y = dedojad;
         label.size = womyj;
         label.bold = true;
         this.wygi(0);
      }
      
      public function wygi(_arg_1:int) : void
      {
         text = _arg_1.toString();
         this.kodyberep.width = label.x + label.width + 10;
      }
   }
}

