package obfuscation.qir
{
   import alternativa.tanks.services.ping.PingService;
   import controls.Label;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.filters.GlowFilter;
   import flash.text.TextFieldAutoSize;
   import flash.utils.getTimer;
   
   public class Beg extends Sprite
   {
      
      [Inject]
      public static var rutiwofy:PingService;
      
      private static const halatan:int = 60;
      
      private static const repyrajyq:int = 0;
      
      private static const zepagugim:int = 999;
      
      private static const nymyjoj:int = 19;
      
      private static const jipadab:int = 50 + 8;
      
      private static const niqofezi:int = 74 + nymyjoj;
      
      private static const bacegip:int = 40 + 8;
      
      private static const qidozu:int = 10;
      
      private static const glowFilter:GlowFilter = new GlowFilter(0,0.8,4,4,3);
      
      private var jibif:Label;
      
      private var hazekoj:Label;
      
      private var wyqivilak:Label;
      
      private var harymifo:Label;
      
      private var counter:int;
      
      private var time:int;
      
      private var dezakapuj:Boolean = false;
      
      public function Beg()
      {
         super();
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function init() : void
      {
         if(!this.dezakapuj)
         {
            this.jibif = new Label();
            this.jibif.autoSize = TextFieldAutoSize.LEFT;
            this.jibif.color = 16777215;
            this.jibif.text = "FPS: ";
            this.jibif.selectable = false;
            addChild(this.jibif);
            this.hazekoj = new Label();
            this.hazekoj.autoSize = TextFieldAutoSize.LEFT;
            this.hazekoj.color = int("0x00FF00");
            this.hazekoj.text = halatan.toString();
            this.hazekoj.selectable = false;
            addChild(this.hazekoj);
            this.wyqivilak = new Label();
            this.wyqivilak.autoSize = TextFieldAutoSize.LEFT;
            this.wyqivilak.color = 16777215;
            this.wyqivilak.text = "PING: ";
            this.wyqivilak.selectable = false;
            this.wyqivilak.x = -7;
            this.wyqivilak.y = nymyjoj;
            addChild(this.wyqivilak);
            this.harymifo = new Label();
            this.harymifo.autoSize = TextFieldAutoSize.LEFT;
            this.harymifo.color = int("0x00FF00");
            this.harymifo.text = repyrajyq.toString();
            this.harymifo.selectable = false;
            this.harymifo.y = nymyjoj;
            addChild(this.harymifo);
            filters = [glowFilter];
            this.dezakapuj = true;
         }
      }
      
      private function onAddedToStage(_arg_1:Event) : void
      {
         this.init();
         this.onResize();
         this.counter = 0;
         this.time = getTimer();
         stage.addEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         stage.addEventListener(Event.RESIZE,this.onResize);
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         addEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
      }
      
      private function onRemovedFromStage(_arg_1:Event) : void
      {
         stage.removeEventListener(Event.ENTER_FRAME,this.onEnterFrame);
         stage.removeEventListener(Event.RESIZE,this.onResize);
         removeEventListener(Event.REMOVED_FROM_STAGE,this.onRemovedFromStage);
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      private function onEnterFrame(_arg_1:Event) : void
      {
         var _local_2:int = 0;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         if(++this.counter >= qidozu)
         {
            _local_2 = getTimer();
            _local_3 = 1000 * this.counter / (_local_2 - this.time);
            if(_local_3 > halatan)
            {
               _local_3 = halatan;
            }
            this.hazekoj.text = Math.round(_local_3).toString();
            this.hazekoj.x = bacegip - this.hazekoj.width;
            if(_local_3 > 30)
            {
               if(_local_3 < 60)
               {
                  this.hazekoj.color = this.bygid(int("0xFFFF00"),int("0x00FF00"),(_local_3 - 30) / (60 - 30));
               }
               else
               {
                  this.hazekoj.color = int("0x00FF00");
               }
            }
            else if(_local_3 > 15)
            {
               this.hazekoj.color = this.bygid(int("0XF03416"),int("0XFFFF00"),(_local_3 - 15) / (30 - 15));
            }
            else
            {
               this.hazekoj.color = int("0XF03416");
            }
            this.time = _local_2;
            this.counter = 0;
            _local_4 = rutiwofy.sategyny();
            if(_local_4 > zepagugim)
            {
               _local_4 = zepagugim;
            }
            this.harymifo.text = Math.round(_local_4).toString();
            this.harymifo.x = bacegip - this.harymifo.width;
            if(_local_4 < 200)
            {
               if(_local_4 > 100)
               {
                  this.harymifo.color = this.bygid(int("0x00FF00"),int("0xFFFF00"),(_local_4 - 100) / (200 - 100));
               }
               else
               {
                  this.harymifo.color = int("0x00FF00");
               }
            }
            else if(_local_4 < 500)
            {
               this.harymifo.color = this.bygid(int("0xFFFF00"),int("0XF03416"),(_local_4 - 200) / (500 - 200));
            }
            else
            {
               this.harymifo.color = int("0XF03416");
            }
         }
      }
      
      private function bygid(_arg_1:int, _arg_2:int, _arg_3:Number) : int
      {
         var _local_4:* = _arg_1 >> 16 & 0xFF;
         var _local_5:* = _arg_1 >> 8 & 0xFF;
         var _local_6:* = _arg_1 & 0xFF;
         var _local_7:* = _arg_2 >> 16 & 0xFF;
         var _local_8:* = _arg_2 >> 8 & 0xFF;
         var _local_9:* = _arg_2 & 0xFF;
         if(_arg_3 > 1)
         {
            _arg_3 = 1;
         }
         return _local_4 + (_local_7 - _local_4) * _arg_3 << 16 | _local_5 + (_local_8 - _local_5) * _arg_3 << 8 | int(_local_6 + (_local_9 - _local_6) * _arg_3);
      }
      
      private function onResize(_arg_1:Event = null) : void
      {
         x = stage.stageWidth - jipadab;
         y = stage.stageHeight - niqofezi;
         this.hazekoj.x = bacegip - this.hazekoj.width;
         this.harymifo.x = bacegip - this.harymifo.width;
      }
   }
}

