package alternativa.tanks.models.tank
{
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.objects.tank.Tank;
   import flash.utils.getTimer;
   import obfuscation.kofen.Vector3d;
   
   public class Piqy implements LogicUnit
   {
      
      private var tank:Tank;
      
      private var faroveqot:Function;
      
      private var sidebuzon:uint;
      
      private var kejo:Vector3d;
      
      private var dusy:Vector3d;
      
      private var kare:int;
      
      private var hih:int;
      
      public function Piqy(_arg_1:Tank, _arg_2:Function, _arg_3:int, _arg_4:int)
      {
         super();
         this.sidebuzon = 0;
         this.tank = _arg_1;
         this.faroveqot = _arg_2;
         this.kare = _arg_3;
         this.hih = _arg_4 * _arg_4;
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         if(Boolean(this.nugameqi()) && (this.tulen() || this.riroze(_arg_1)))
         {
            this.sidebuzon = getTimer();
            this.faroveqot(this.tank.bebosaca(),this.kejo,this.dusy);
         }
      }
      
      private function nugameqi() : Vector3d
      {
         return this.kejo;
      }
      
      private function riroze(_arg_1:int) : Boolean
      {
         return _arg_1 - this.sidebuzon > this.kare;
      }
      
      private function tulen() : Boolean
      {
         if(Boolean(this.kejo))
         {
            return Vetezo.sinajeje(this.tank.qiniwu().state.position,this.kejo) > this.hih;
         }
         return false;
      }
      
      public function vun(_arg_1:Vector3d, _arg_2:Vector3d) : void
      {
         this.sidebuzon = getTimer();
         this.kejo = _arg_1;
         this.dusy = _arg_2;
      }
   }
}

