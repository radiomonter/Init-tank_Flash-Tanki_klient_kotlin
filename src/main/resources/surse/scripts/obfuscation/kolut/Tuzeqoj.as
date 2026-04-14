package obfuscation.kolut
{
   import alternativa.tanks.models.battle.battlefield.BattleType;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Femegikad;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.Jatapyba;
   import alternativa.tanks.models.battle.gui.gui.statistics.field.score.ctf.Wagy;
   import assets.icons.BattleInfoIcons;
   import flash.display.DisplayObject;
   import flash.display.Sprite;
   import obfuscation.bude.BattleTeam;
   import obfuscation.qedajyt.Juva;
   import obfuscation.walytolo.Valos;
   
   public class Tuzeqoj extends Sprite implements Femegikad
   {
      
      private var tyhegaha:BattleType;
      
      private var lavej:Valos;
      
      private var sywapezoq:Fagibo;
      
      private var dycewyruf:Qohiqov;
      
      private var bomigiz:String;
      
      private var hoqelyb:Jatapyba;
      
      public function Tuzeqoj(_arg_1:String, _arg_2:int, _arg_3:Juva, _arg_4:int, _arg_5:BattleType, _arg_6:Boolean)
      {
         super();
         this.tyhegaha = _arg_5;
         this.bomigiz = _arg_1;
         this.natosob(_arg_2,_arg_3,_arg_4,_arg_6);
      }
      
      public function lilor(_arg_1:Jatapyba) : void
      {
         this.hoqelyb = _arg_1;
         this.fod();
      }
      
      public function kun(_arg_1:BattleTeam) : void
      {
         Wagy(this.dycewyruf).showFlagAtBase(_arg_1);
      }
      
      public function rim(_arg_1:BattleTeam) : void
      {
         Wagy(this.dycewyruf).showFlagCarried(_arg_1);
      }
      
      public function naly(_arg_1:BattleTeam) : void
      {
         Wagy(this.dycewyruf).showFlagDropped(_arg_1);
      }
      
      public function vosugon() : void
      {
      }
      
      public function dasup() : void
      {
      }
      
      public function foc() : void
      {
      }
      
      private function natosob(_arg_1:int, _arg_2:Juva, _arg_3:int, _arg_4:Boolean) : void
      {
         this.lur(_arg_1,_arg_2,_arg_3,_arg_4);
         this.qamot(0,0);
         this.fod();
      }
      
      private function lur(_arg_1:int, _arg_2:Juva, _arg_3:int, _arg_4:Boolean) : void
      {
         this.lavej = new Valos(this.tyhegaha,_arg_1,_arg_2,_arg_3,_arg_4);
         addChild(this.lavej);
      }
      
      private function qamot(_arg_1:int, _arg_2:int) : void
      {
         if(this.tyhegaha == BattleType.DM || this.tyhegaha == BattleType.JGR)
         {
            this.sywapezoq = new Fagibo(BattleInfoIcons.KILL_LIMIT);
            addChild(this.sywapezoq);
         }
         else
         {
            this.dycewyruf = this.bomesy();
            this.birud(BattleTeam.BLUE,_arg_1);
            this.birud(BattleTeam.RED,_arg_2);
            addChild(DisplayObject(this.dycewyruf));
         }
      }
      
      private function bomesy() : Qohiqov
      {
         switch(this.tyhegaha)
         {
            case BattleType.TDM:
               return new Fokor();
            case BattleType.CTF:
               return new Wagy();
            case BattleType.rovicateto:
               return new Dujatevan();
            default:
               throw new Error();
         }
      }
      
      public function updateUserKills(_arg_1:String, _arg_2:int) : void
      {
         if(this.tyhegaha == BattleType.DM || this.tyhegaha == BattleType.TDM || this.tyhegaha == BattleType.JGR)
         {
            this.lavej.sup(_arg_2);
            if(this.tyhegaha == BattleType.DM && _arg_1 == this.bomigiz || this.tyhegaha == BattleType.JGR)
            {
               this.sywapezoq.wygi(_arg_2);
            }
            this.fod();
         }
      }
      
      public function birud(_arg_1:BattleTeam, _arg_2:int) : void
      {
         this.dycewyruf.birud(_arg_1,_arg_2);
         this.lavej.sup(_arg_2);
         this.fod();
      }
      
      public function ciqatagu(_arg_1:int) : void
      {
         this.lavej.vamal(_arg_1);
         this.fod();
      }
      
      public function tyt() : void
      {
         this.lavej.reset();
         if(this.tyhegaha == BattleType.DM || this.tyhegaha == BattleType.JGR)
         {
            this.sywapezoq.wygi(0);
         }
         else
         {
            this.dycewyruf.wygi(0,0);
         }
         this.fod();
      }
      
      public function jyfuk(_arg_1:Boolean) : void
      {
         this.tyt();
         this.lavej.gafeworu(_arg_1);
         this.fod();
      }
      
      public function fogegugi() : void
      {
         this.lavej.gif();
         this.fod();
      }
      
      public function fod() : void
      {
         this.lavej.fod();
         var _local_1:DisplayObject = this.tyhegaha == BattleType.DM || this.tyhegaha == BattleType.JGR ? this.sywapezoq : DisplayObject(this.dycewyruf);
         _local_1.x = this.lavej.width + 10;
         if(this.hoqelyb != null)
         {
            this.hoqelyb.qityfypa(this);
         }
      }
      
      public function zupa(_arg_1:int) : void
      {
         this.lavej.zupa(_arg_1);
         this.fod();
      }
      
      public function wyr() : void
      {
         this.lavej.wyr();
         this.fod();
      }
      
      public function gihudowyk(_arg_1:int) : void
      {
         this.lavej.gihudowyk(_arg_1);
      }
      
      public function vyrojub() : void
      {
         this.lavej.vyrojub();
      }
   }
}

