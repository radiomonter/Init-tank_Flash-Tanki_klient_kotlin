package obfuscation.poluto
{
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.service.settings.ISettingsService;
   import alternativa.tanks.services.targeting.Qizytyv;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.utils.MathUtils;
   import flash.events.Event;
   import obfuscation.garud.Curah;
   import obfuscation.garud.Rib;
   
   public class Covize implements Curah, Qizytyv
   {
      
      [Inject]
      public static var hydycefa:TargetingInputManager;
      
      [Inject]
      public static var settingsService:ISettingsService;
      
      [Inject]
      public static var display:IDisplay;
      
      private static const hocuro:Number = 0.0001;
      
      private static var mouseSensitivity:int = 0;
      
      protected var myhop:Rib;
      
      private var numita:Number;
      
      private var qavol:Number;
      
      private var docudava:Boolean;
      
      public function Covize(_arg_1:Rib)
      {
         super();
         this.myhop = _arg_1;
         this.numita = 0;
         mouseSensitivity = settingsService.mouseSensitivity;
      }
      
      public function mouseRelativeMovement(_arg_1:Number, _arg_2:Number) : void
      {
         this.numita -= _arg_1 * mouseSensitivity * hocuro;
         this.numita = MathUtils.clampAngle(this.numita);
      }
      
      public function keyboardButton(_arg_1:uint, _arg_2:Boolean) : Boolean
      {
         return true;
      }
      
      public function tick(_arg_1:Number) : void
      {
         var _local_2:Tank = Num.cimise.tank;
         this.qavol = _local_2.heboqiq();
         if(!this.docudava)
         {
            this.nivecoqig();
         }
         this.myhop.mynadi(this.numita);
      }
      
      protected function nivecoqig() : void
      {
         this.myhop.nivecoqig(this.numita - this.qavol);
      }
      
      public function enter() : void
      {
         hydycefa.addListener(this);
         display.stage.addEventListener(Event.MOUSE_LEAVE,this.fyn);
         mouseSensitivity = settingsService.mouseSensitivity;
         var _local_1:Tank = Num.cimise.tank;
         this.qavol = _local_1.heboqiq();
         this.numita = MathUtils.clampAngle(this.qavol + this.mocohub());
         this.nivecoqig();
         this.myhop.mynadi(this.numita);
         this.docudava = false;
      }
      
      protected function mocohub() : Number
      {
         return this.myhop.jesenebo();
      }
      
      public function exit() : void
      {
         display.stage.removeEventListener(Event.MOUSE_LEAVE,this.fyn);
         hydycefa.removeListener(this);
         this.myhop.viwyd();
         this.myhop.jyfudelenu();
      }
      
      private function fyn(_arg_1:Event) : void
      {
         this.docudava = false;
      }
      
      public function mouseAbsoluteMovement(_arg_1:Number, _arg_2:Number) : void
      {
      }
      
      public function mouseLeftButton(_arg_1:Boolean, _arg_2:Boolean) : Boolean
      {
         return true;
      }
      
      public function mouseWheel(_arg_1:int) : void
      {
      }
      
      public function mouseRightButton(_arg_1:Boolean, _arg_2:Boolean) : Boolean
      {
         this.docudava = _arg_1;
         this.myhop.hyjyra();
         return true;
      }
      
      public function mouseLocked(_arg_1:Boolean) : void
      {
      }
   }
}

