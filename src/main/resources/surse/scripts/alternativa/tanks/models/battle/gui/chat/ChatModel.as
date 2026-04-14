package alternativa.tanks.models.battle.gui.chat
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.model.ChatSettingsTracker;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   import obfuscation.bude.BattleTeam;
   import obfuscation.kelideci.ChatModelBase;
   import obfuscation.kelideci.IChatModelBase;
   import platform.client.fp10.core.model.ObjectLoadListener;
   import platform.client.fp10.core.model.ObjectUnloadListener;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.battle.IBattleInfoService;
   
   public class ChatModel extends ChatModelBase implements IChatModelBase, Wejej, ObjectLoadListener, ObjectUnloadListener
   {
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var battleInfoService:IBattleInfoService;
      
      [Inject]
      public static var kyb:BattleGUIService;
      
      private var ravy:Suku;
      
      private var helahypy:String;
      
      private var juqa:Tiwawi;
      
      private var jiqyjyki:ChatSettingsTracker;
      
      public function ChatModel()
      {
         super();
         this.ravy = new Suku();
      }
      
      [Obfuscation(rename="false")]
      public function objectLoaded() : void
      {
         this.ravy.clear();
         this.ravy.locked = false;
         this.ravy.addEventListener(Req.SEND_MESSAGE,this.bubezu);
         kyb.fez().addChild(this.ravy);
         display.stage.addEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
         this.helahypy = "";
         this.juqa = new Tiwawi(this.ravy);
         this.jiqyjyki = new ChatSettingsTracker(this.ravy);
      }
      
      [Obfuscation(rename="false")]
      public function objectUnloaded() : void
      {
         this.ravy.removeEventListener(Req.SEND_MESSAGE,this.bubezu);
         this.ravy.clear();
         if(this.ravy.parent != null)
         {
            this.ravy.parent.removeChild(this.ravy);
         }
         this.juqa.close();
         this.jiqyjyki.close();
         display.stage.removeEventListener(KeyboardEvent.KEY_UP,this.onKeyUp);
      }
      
      [Obfuscation(rename="false")]
      public function addMessage(_arg_1:String, _arg_2:String, _arg_3:BattleTeam) : void
      {
         this.zyj(_arg_1,_arg_2,_arg_3);
      }
      
      [Obfuscation(rename="false")]
      public function vepebuk(_arg_1:String, _arg_2:String, _arg_3:BattleTeam) : void
      {
         this.zyj(_arg_1,_arg_2,_arg_3,true);
      }
      
      private function zyj(_arg_1:String, _arg_2:String, _arg_3:BattleTeam, _arg_4:Boolean = false) : void
      {
         var _local_5:* = _arg_1 == null;
         this.ravy.qejep(_arg_1,_arg_3,_arg_2 + "\n",_arg_4,_local_5);
      }
      
      [Obfuscation(rename="false")]
      public function raki(_arg_1:String, _arg_2:String) : void
      {
         this.ravy.qejep(null,BattleTeam.NONE,_arg_2 + "\n",true,true);
      }
      
      [Obfuscation(rename="false")]
      public function fikaqu(_arg_1:String) : void
      {
         this.ravy.fikaqu(_arg_1);
      }
      
      private function onKeyUp(_arg_1:KeyboardEvent) : void
      {
         if(_arg_1.keyCode == Keyboard.ENTER)
         {
            if(battleInfoService.isSpectatorMode())
            {
               this.ravy.jysawuky(this.helahypy);
            }
            this.ravy.tohiri();
         }
      }
      
      private function bubezu(_arg_1:Req) : void
      {
         server.sendMessage(_arg_1.message,_arg_1.huvipunuk);
      }
      
      [Obfuscation(rename="false")]
      public function nyrabyt(_arg_1:String) : void
      {
         this.helahypy = _arg_1;
      }
      
      public function cohuhylu() : Suku
      {
         return this.ravy;
      }
   }
}

