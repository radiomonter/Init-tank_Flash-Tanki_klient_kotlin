package obfuscation.joni
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Femegikad;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Jatapyba;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import flash.display.DisplayObject;
   import flash.events.Event;
   
   public class Gegyjerur implements Jatapyba
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var tykih:BattleGUIService;
      
      private var wohaj:Vector.<Femegikad> = new Vector.<Femegikad>();
      
      private var susokov:Vector.<Femegikad> = new Vector.<Femegikad>();
      
      private var initialized:Boolean;
      
      public function Gegyjerur()
      {
         super();
         display.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(_arg_1:Event) : void
      {
         this.milofak();
      }
      
      public function qityfypa(_arg_1:Femegikad) : void
      {
         this.milofak();
      }
      
      public function milofak() : void
      {
         var _local_1:DisplayObject = null;
         var _local_3:int = 0;
         var _local_2:int = display.stage.stageWidth;
         while(_local_3 < this.susokov.length)
         {
            _local_1 = DisplayObject(this.susokov[_local_3]);
            _local_1.x = _local_2 - _local_1.width - 10;
            _local_1.y = display.stage.stageHeight - _local_1.height - 10;
            _local_2 = _local_1.x;
            _local_3++;
         }
         tykih.wamepaher(_local_2);
      }
      
      public function fujilo(_arg_1:Femegikad) : void
      {
         if(this.initialized)
         {
            this.susokov.push(_arg_1);
         }
         else
         {
            this.wohaj.push(_arg_1);
         }
         _arg_1.lilor(this);
         this.qityfypa(_arg_1);
      }
      
      public function wumeza(_arg_1:Femegikad) : void
      {
         this.susokov.push(_arg_1);
         _arg_1.lilor(this);
      }
      
      public function destroy() : void
      {
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         this.hazam();
      }
      
      private function hazam() : void
      {
         var _local_1:Femegikad = null;
         var _local_2:DisplayObject = null;
         for each(_local_1 in this.susokov)
         {
            _local_2 = DisplayObject(_local_1);
            if(_local_2.parent != null)
            {
               _local_2.parent.removeChild(_local_2);
            }
         }
      }
      
      public function init() : void
      {
         var _local_1:Femegikad = null;
         if(!this.initialized)
         {
            this.initialized = true;
            for each(_local_1 in this.wohaj)
            {
               this.susokov.push(_local_1);
            }
            this.wohaj = null;
         }
         this.milofak();
      }
   }
}

