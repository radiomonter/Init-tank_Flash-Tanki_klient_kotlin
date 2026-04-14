package obfuscation.poluto
{
   import alternativa.tanks.service.settings.keybinding.GameActionEnum;
   import alternativa.tanks.service.settings.keybinding.KeysBindingService;
   import alternativa.tanks.services.targeting.Qizytyv;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import obfuscation.garud.Curah;
   import obfuscation.garud.Rib;
   import obfuscation.garud.Tesik;
   
   public class Rutyqy implements Curah, Qizytyv
   {
      
      [Inject]
      public static var pulat:TargetingModeService;
      
      [Inject]
      public static var vekol:TargetingInputManager;
      
      [Inject]
      public static var tytol:KeysBindingService;
      
      protected var myhop:Rib;
      
      protected var giluwa:Tesik;
      
      protected var hywihilur:Tesik;
      
      public function Rutyqy(_arg_1:Rib)
      {
         super();
         this.myhop = _arg_1;
         this.fugatatyr(Tesik.cusaj);
         pulat.fugatatyr(Tesik.cusaj);
      }
      
      public function keyboardButton(_arg_1:uint, _arg_2:Boolean) : Boolean
      {
         var _local_3:GameActionEnum = tytol.jikamybu(_arg_1);
         if(!_local_3)
         {
            return true;
         }
         this.myhop.topoki(_local_3.value,_arg_2);
         this.hivasucy(_local_3,_arg_2);
         return true;
      }
      
      protected function hivasucy(_arg_1:GameActionEnum, _arg_2:Boolean) : void
      {
         switch(_arg_1)
         {
            case this.giluwa.demezuvog:
               this.myhop.rotateLeft(_arg_2);
               return;
            case this.giluwa.mih:
               this.myhop.rotateRight(_arg_2);
               return;
            case this.giluwa.hacose:
               this.myhop.daz(_arg_2);
               return;
            case this.giluwa.tiqat:
               this.myhop.tisaseb(_arg_2);
               return;
            case this.giluwa.pezojywuc:
               this.myhop.center(_arg_2);
         }
      }
      
      public function enter() : void
      {
         vekol.addListener(this);
         if(this.hywihilur == null)
         {
            this.hywihilur = pulat.nihesavut();
            pulat.fugatatyr(this.giluwa);
         }
         this.sikizohif();
      }
      
      private function sikizohif() : void
      {
         this.hefim(this.giluwa.pezojywuc);
         this.hefim(this.giluwa.tiqat);
         this.hefim(this.giluwa.demezuvog);
         this.hefim(this.giluwa.mih);
         this.hefim(this.giluwa.hacose);
      }
      
      private function hefim(_arg_1:GameActionEnum) : void
      {
         if(!_arg_1)
         {
            return;
         }
         if(this.myhop.kevi(_arg_1.value))
         {
            this.hivasucy(_arg_1,true);
         }
      }
      
      public function exit() : void
      {
         vekol.removeListener(this);
         if(this.hywihilur != null)
         {
            pulat.fugatatyr(this.hywihilur);
            this.hywihilur = null;
         }
      }
      
      protected function fugatatyr(_arg_1:Tesik) : void
      {
         this.giluwa = _arg_1;
      }
      
      public function tick(_arg_1:Number) : void
      {
      }
      
      public function mouseAbsoluteMovement(_arg_1:Number, _arg_2:Number) : void
      {
      }
      
      public function mouseRelativeMovement(_arg_1:Number, _arg_2:Number) : void
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
         return true;
      }
      
      public function mouseLocked(_arg_1:Boolean) : void
      {
      }
   }
}

