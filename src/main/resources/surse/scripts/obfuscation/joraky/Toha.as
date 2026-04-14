package obfuscation.joraky
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.battle.events.BattleEventListener;
   import alternativa.tanks.battle.events.Firo;
   import alternativa.tanks.battle.events.Kitut;
   import alternativa.tanks.services.battlegui.BattleGUIService;
   import flash.events.Event;
   import flash.net.SharedObject;
   import obfuscation.nabi.Lotime;
   import platform.client.fp10.core.type.AutoClosable;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.storage.IStorageService;
   import projects.tanks.clients.fp10.libraries.tanksservices.service.userproperties.IUserPropertiesService;
   
   public class Toha implements AutoClosable, BattleEventListener
   {
      
      [Inject]
      public static var storageService:IStorageService;
      
      [Inject]
      public static var battleEventDispatcher:BattleEventDispatcher;
      
      [Inject]
      public static var userPropertiesService:IUserPropertiesService;
      
      [Inject]
      public static var display:IDisplay;
      
      [Inject]
      public static var kyb:BattleGUIService;
      
      private static const mifuzij:String = "disableControlsMiniHelp";
      
      private var mywe:Lotime;
      
      public function Toha()
      {
         super();
         var _local_1:SharedObject = storageService.getStorage();
         if(!_local_1.data[mifuzij])
         {
            if(userPropertiesService.rank == 1)
            {
               _local_1.data[mifuzij] = 1;
               this.savelifah();
            }
         }
      }
      
      private function savelifah() : void
      {
         this.mywe = new Lotime();
         kyb.fez().addChild(this.mywe);
         this.setPosition();
         battleEventDispatcher.pugu(Firo,this);
         battleEventDispatcher.pugu(Kitut,this);
         display.stage.addEventListener(Event.RESIZE,this.onResize);
      }
      
      private function onResize(_arg_1:Event) : void
      {
         this.setPosition();
      }
      
      private function setPosition() : void
      {
         this.mywe.x = display.stage.stageWidth - this.mywe.width >> 1;
         this.mywe.y = display.stage.stageHeight - this.mywe.height - 10;
      }
      
      public function handleBattleEvent(_arg_1:Object) : void
      {
         var _local_2:Kitut = null;
         if(_arg_1 is Firo)
         {
            this.close();
         }
         else if(_arg_1 is Kitut)
         {
            _local_2 = _arg_1 as Kitut;
            this.mywe.kyfiq(_local_2.targetingMode);
         }
      }
      
      [Obfuscation(rename="false")]
      public function close() : void
      {
         if(this.mywe != null)
         {
            display.stage.removeEventListener(Event.RESIZE,this.onResize);
            battleEventDispatcher.kujo(Firo,this);
            battleEventDispatcher.kujo(Kitut,this);
            this.mywe.parent.removeChild(this.mywe);
            this.mywe = null;
         }
      }
   }
}

