package obfuscation.gicuke
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.osgi.service.locale.ILocaleService;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.utils.removeDisplayObject;
   import controls.Label;
   import controls.RedButton;
   import controls.buttons.h30px.GreenMediumButton;
   import controls.resultassets.ResultWindowGray;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import obfuscation.bude.BattleTeam;
   import obfuscation.joni.Tozutuv;
   import obfuscation.kumopurut.Tahana;
   import obfuscation.rogekuh.Nadapy;
   import projects.tanks.clients.fp10.libraries.TanksLocale;
   
   public class Perez extends Sprite
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var localeService:ILocaleService;
      
      [Inject]
      public static var vekol:TargetingInputManager;
      
      private var kutyzi:Benonizo;
      
      private var fijagyn:Benonizo;
      
      private var vilyn:Benonizo;
      
      private var ruwote:Sprite;
      
      private var syq:RedButton;
      
      private var lesal:GreenMediumButton;
      
      private var sabupy:ResultWindowGray;
      
      private var namumoza:Boolean;
      
      private var qaku:Label;
      
      private var jokozys:Nadapy;
      
      private var bego:Pojywewy;
      
      public function Perez(_arg_1:String, _arg_2:Boolean)
      {
         super();
         this.namumoza = _arg_2;
         visible = false;
         this.bego = new Pojywewy(_arg_1);
      }
      
      public function veqo(_arg_1:Boolean, _arg_2:Boolean, _arg_3:String, _arg_4:Vector.<Tozutuv>, _arg_5:Boolean, _arg_6:int) : void
      {
         if(!visible)
         {
            this.vilyn = this.zos(Benonizo.GREEN,_arg_3,_arg_4,_arg_5,BattleTeam.NONE,_arg_2);
            addChild(this.vilyn);
            this.jowytitub(_arg_1,_arg_6);
         }
      }
      
      public function nofos(_arg_1:Boolean, _arg_2:String, _arg_3:Vector.<Tozutuv>, _arg_4:Vector.<Tozutuv>, _arg_5:Boolean, _arg_6:int, _arg_7:BattleTeam) : void
      {
         if(!visible)
         {
            this.kutyzi = this.zos(Benonizo.RED,_arg_2,_arg_3,_arg_5,_arg_7,true);
            addChild(this.kutyzi);
            this.fijagyn = this.zos(Benonizo.BLUE,_arg_2,_arg_4,_arg_5,_arg_7,true);
            addChild(this.fijagyn);
            this.jowytitub(_arg_1,_arg_6);
         }
      }
      
      private function zos(_arg_1:int, _arg_2:String, _arg_3:Vector.<Tozutuv>, _arg_4:Boolean, _arg_5:BattleTeam, _arg_6:Boolean) : Benonizo
      {
         var _local_7:Benonizo = new Benonizo(_arg_1,_arg_2,_arg_4,_arg_5,_arg_6);
         _local_7.zado(_arg_3);
         return _local_7;
      }
      
      private function jowytitub(_arg_1:Boolean, _arg_2:int) : void
      {
         vekol.nizojemak();
         visible = true;
         addChild(this.bego);
         this.hagepeqys(_arg_1,_arg_2);
         display.stage.addEventListener(Event.RESIZE,this.onResize);
         this.onResize();
      }
      
      public function hide() : void
      {
         if(!visible)
         {
            return;
         }
         visible = false;
         display.stage.removeEventListener(Event.RESIZE,this.onResize);
         removeChild(this.bego);
         removeDisplayObject(this.fijagyn);
         this.fijagyn = null;
         removeDisplayObject(this.kutyzi);
         this.kutyzi = null;
         removeDisplayObject(this.vilyn);
         this.vilyn = null;
         if(this.syq != null)
         {
            this.syq.removeEventListener(MouseEvent.CLICK,this.hozozycy);
            this.syq = null;
         }
         if(this.lesal != null)
         {
            this.lesal.removeEventListener(MouseEvent.CLICK,this.zepuv);
            this.lesal = null;
         }
         removeDisplayObject(this.ruwote);
         this.ruwote = null;
         vekol.volof();
      }
      
      private function onResize(_arg_1:Event = null) : void
      {
         var _local_2:int = 0;
         var _local_5:Benonizo = null;
         var _local_3:int = 0;
         var _local_4:Benonizo = null;
         _local_2 = 0;
         _local_2 = int(display.stage.stageWidth / 2);
         _local_3 = int(display.stage.stageHeight / 2);
         _local_5 = null;
         if(Boolean(this.vilyn))
         {
            this.nehuta();
            this.vilyn.y = -(this.vilyn.height >> 1);
            _local_4 = _local_5 = this.vilyn;
         }
         else if(Boolean(this.fijagyn) && Boolean(this.kutyzi))
         {
            this.qugitijo();
            this.kutyzi.y = -(this.fijagyn.height + this.kutyzi.height + 5 >> 1);
            this.fijagyn.y = this.kutyzi.y + this.kutyzi.height + 5;
            _local_4 = this.kutyzi;
            _local_5 = this.fijagyn;
         }
         this.bego.y = _local_4.y - this.bego.height - 5;
         this.bego.width = _local_4.width;
         this.ruwote.y = _local_5.y + _local_5.height + 10;
         this.sabupy.width = _local_4.width;
         this.syq.x = this.sabupy.width - this.syq.width - 7;
         x = _local_2 - (width >> 1);
         y = _local_3;
      }
      
      private function nehuta() : void
      {
         var _local_1:Number = display.stage.stageHeight - 200;
         this.vilyn.resize(_local_1);
      }
      
      private function qugitijo() : void
      {
         var _local_1:Number = NaN;
         var _local_2:Number = display.stage.stageHeight - 200;
         this.fijagyn.resize(_local_2);
         this.kutyzi.resize(_local_2);
         if(this.fijagyn.height + this.kutyzi.height > _local_2)
         {
            _local_1 = 0.5 * _local_2;
            if(this.fijagyn.height > _local_1 && this.kutyzi.height > _local_1)
            {
               this.fijagyn.resize(_local_1);
               this.kutyzi.resize(_local_1);
            }
            else if(this.fijagyn.height < _local_1)
            {
               this.kutyzi.resize(_local_2 - this.fijagyn.height);
            }
            else
            {
               this.fijagyn.resize(_local_2 - this.kutyzi.height);
            }
         }
      }
      
      private function hagepeqys(_arg_1:Boolean, _arg_2:int) : void
      {
         this.ruwote = new Sprite();
         this.sabupy = new ResultWindowGray();
         this.sabupy.width = width;
         this.ruwote.addChild(this.sabupy);
         this.syq = new RedButton();
         this.sabupy.height = this.syq.height + 8;
         this.syq.addEventListener(MouseEvent.CLICK,this.hozozycy);
         this.syq.width = 96;
         this.syq.label = localeService.getText(TanksLocale.TEXT_BATTLE_EXIT);
         this.syq.x = this.sabupy.width - this.syq.width - 7;
         this.syq.y = 4;
         this.ruwote.addChild(this.syq);
         if(_arg_2 > 0)
         {
            this.qaku = new Label();
            this.qaku.text = !_arg_1 ? localeService.getText(TanksLocale.TEXT_BATTLE_RESTART) + ": " : localeService.getText(TanksLocale.TEXT_BATTLE_FINISH_IN);
            this.ruwote.addChild(this.qaku);
            this.qaku.x = 4;
            this.qaku.y = 10;
            this.qaku.visible = true;
            this.jokozys = new Nadapy(-1,-1,null,true);
            this.jokozys.kir(_arg_2);
            this.ruwote.addChild(this.jokozys);
            this.jokozys.x = this.qaku.x + this.qaku.width;
            this.jokozys.y = 4;
            this.jokozys.size = 22;
            this.jokozys.visible = true;
         }
         addChild(this.ruwote);
      }
      
      public function vevonij(_arg_1:String, _arg_2:BattleTeam) : void
      {
         if(!visible)
         {
            return;
         }
         if(Boolean(this.namumoza) && Boolean(this.fijagyn) && Boolean(this.kutyzi))
         {
            if(_arg_2 == BattleTeam.BLUE)
            {
               this.fijagyn.vevonij(_arg_1);
            }
            else
            {
               this.kutyzi.vevonij(_arg_1);
            }
            this.qugitijo();
         }
         else if(Boolean(this.vilyn))
         {
            this.vilyn.vevonij(_arg_1);
            this.nehuta();
         }
      }
      
      public function zefypek(_arg_1:Vector.<Tozutuv>) : void
      {
         if(visible)
         {
            this.vilyn.zado(_arg_1);
            this.nehuta();
            this.onResize();
         }
      }
      
      public function jurefyham(_arg_1:Tozutuv) : void
      {
         if(visible)
         {
            this.vilyn.fuhafajyg(_arg_1);
         }
      }
      
      public function nibow(_arg_1:Vector.<Tozutuv>, _arg_2:BattleTeam) : void
      {
         if(visible)
         {
            if(_arg_2 == BattleTeam.BLUE)
            {
               this.fijagyn.zado(_arg_1);
            }
            else if(_arg_2 == BattleTeam.RED)
            {
               this.kutyzi.zado(_arg_1);
            }
            this.qugitijo();
            this.onResize();
         }
      }
      
      public function kiwe(_arg_1:Tozutuv) : void
      {
         if(visible)
         {
            if(_arg_1.teamType == BattleTeam.BLUE)
            {
               this.fijagyn.fuhafajyg(_arg_1);
            }
            else if(_arg_1.teamType == BattleTeam.RED)
            {
               this.kutyzi.fuhafajyg(_arg_1);
            }
         }
      }
      
      private function hozozycy(_arg_1:MouseEvent) : void
      {
         dispatchEvent(new Tahana(Tahana.EXIT));
      }
      
      private function zepuv(_arg_1:MouseEvent) : void
      {
         this.qaku.visible = true;
         this.jokozys.visible = true;
         this.lesal.visible = false;
         dispatchEvent(new Tahana(Tahana.CONTINUE));
      }
   }
}

