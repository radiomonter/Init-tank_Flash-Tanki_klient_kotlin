package alternativa.tanks.services.battlegui
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.utils.removeDisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.Sprite;
   import flash.events.EventDispatcher;
   
   public class Bohago extends EventDispatcher implements BattleGUIService
   {
      
      [Inject]
      public static var display:IDisplay;
      
      private var zarogo:Sprite = new Sprite();
      
      private var mazobek:Sprite = new Sprite();
      
      private var fiwef:Sprite = new Sprite();
      
      private var vyjumure:int;
      
      private var zyg:int;
      
      public function Bohago()
      {
         super();
      }
      
      public function qocuwo() : DisplayObjectContainer
      {
         return this.zarogo;
      }
      
      public function fez() : DisplayObjectContainer
      {
         return this.mazobek;
      }
      
      public function sapareri() : DisplayObjectContainer
      {
         return this.fiwef;
      }
      
      public function hide() : void
      {
         removeDisplayObject(this.zarogo);
         removeDisplayObject(this.mazobek);
         removeDisplayObject(this.fiwef);
      }
      
      public function show() : void
      {
         display.contentLayer.addChild(this.zarogo);
         display.contentUILayer.addChild(this.mazobek);
         display.contentUILayer.addChild(this.fiwef);
      }
      
      public function wamepaher(_arg_1:int) : void
      {
         this.vyjumure = _arg_1;
         dispatchEvent(new BattleGUIServiceEvent(BattleGUIServiceEvent.ON_CHANGE_POSITION_DEFAULT_LAYOUT));
      }
      
      public function nudyfy() : int
      {
         return this.vyjumure;
      }
      
      public function nawy(_arg_1:int) : void
      {
         this.zyg = _arg_1;
         dispatchEvent(new Wed());
      }
      
      public function vuwudedi() : int
      {
         return this.zyg;
      }
      
      public function tadadoqa() : void
      {
         this.zyg = 0;
      }
   }
}

