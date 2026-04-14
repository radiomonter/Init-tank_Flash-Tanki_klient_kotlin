package obfuscation.joraky
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.models.battle.gui.chat.Suku;
   import alternativa.tanks.service.panel.IPanelView;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import alternativa.tanks.services.battleinput.BattleInputService;
   import alternativa.tanks.services.spectatorservice.SpectatorService;
   import alternativa.tanks.utils.BitMask;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import obfuscation.fymimywi.Codywo;
   import obfuscation.kolut.Tuzeqoj;
   import obfuscation.qir.Beg;
   import obfuscation.zupozikuh.Tah;
   
   public class Ruv
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var panelView:IPanelView;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var kybewu:SpectatorService;
      
      [Inject]
      public static var pojotahut:BattleInputService;
      
      [Inject]
      public static var ketit:BattleGUIService;
      
      private static const lak:uint = Keyboard.BACKSLASH;
      
      private static const muzyqy:int = 1;
      
      private static const tivuwewoj:int = 1 << 1;
      
      private static const CHAT:int = 1 << 2;
      
      private static const deci:int = 1 << 3;
      
      private static const defy:int = 1 << 4;
      
      private static const hared:int = 1 << 5;
      
      private static const lyjuqemi:int = 1 << 6;
      
      private static const jyhigoc:int = 1 << 7;
      
      private static const jozuvo:Array = [jyhigoc | deci | defy | hared | lyjuqemi | CHAT | muzyqy | tivuwewoj,jyhigoc | deci | defy | hared | lyjuqemi | CHAT,jyhigoc | deci | defy | hared | lyjuqemi,lyjuqemi,0];
      
      private var chat:Suku;
      
      private var myloraka:Codywo;
      
      private var reza:Tuzeqoj;
      
      private var sematile:Tah;
      
      private var genetyti:Beg;
      
      private var qakelosis:int;
      
      public function Ruv(_arg_1:Suku, _arg_2:Codywo, _arg_3:Tah, _arg_4:Tuzeqoj, _arg_5:Beg)
      {
         super();
         this.chat = _arg_1;
         this.myloraka = _arg_2;
         this.sematile = _arg_3;
         this.reza = _arg_4;
         this.genetyti = _arg_5;
         this.qakelosis = 0;
         this.jinogyz(this.qakelosis);
         display.stage.addEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
      }
      
      private function onKeyDown(_arg_1:KeyboardEvent) : void
      {
         if(!pojotahut.miwyraze() && _arg_1.keyCode == lak)
         {
            this.muvetymul();
         }
      }
      
      private function muvetymul() : void
      {
         this.qakelosis = (this.qakelosis + 1) % jozuvo.length;
         this.jinogyz(this.qakelosis);
      }
      
      private function jinogyz(_arg_1:int) : void
      {
         var _local_2:BitMask = null;
         _local_2 = new BitMask(jozuvo[_arg_1]);
         panelView.getPanel().visible = _local_2.hasAnyBit(muzyqy);
         this.genetyti.visible = _local_2.hasAnyBit(tivuwewoj) && settingsService.showFPS;
         this.chat.visible = _local_2.hasAnyBit(CHAT);
         this.myloraka.visible = _local_2.hasAnyBit(deci);
         this.sematile.visible = _local_2.hasAnyBit(defy);
         this.reza.visible = _local_2.hasAnyBit(hared);
         kybewu.ganiciq(_local_2.hasAnyBit(lyjuqemi));
         ketit.fez().visible = _local_2.hasAnyBit(jyhigoc);
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         display.stage.removeEventListener(KeyboardEvent.KEY_DOWN,this.onKeyDown);
         panelView.getPanel().visible = true;
         ketit.fez().visible = true;
         this.genetyti.visible = true;
         this.chat = null;
         this.myloraka = null;
         this.sematile = null;
         this.reza = null;
         this.genetyti = null;
      }
   }
}

