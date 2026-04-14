package obfuscation.walytolo
{
   import alternativa.tanks.models.battle.battlefield.BattleType;
   import assets.icons.BattleInfoIcons;
   import controls.resultassets.WhiteFrame;
   import flash.display.Sprite;
   import obfuscation.qedajyt.Juva;
   import obfuscation.rogekuh.Lup;
   import obfuscation.rogekuh.Nadapy;
   import obfuscation.tihah.Bifywily;
   import obfuscation.tihah.Hyn;
   
   public class Valos extends Sprite
   {
      
      private static const mimuj:int = 1;
      
      private static const gor:int = 1;
      
      private static const tuja:int = 3;
      
      private static const kahi:int = 30;
      
      private var tyhegaha:BattleType;
      
      private var kodyberep:WhiteFrame;
      
      private var kezogizu:Wasygac;
      
      private var qiloc:Bifywily;
      
      private var govyjer:Nadapy;
      
      private var rata:Lup;
      
      private var timeLimit:int;
      
      private var scoreLimit:int;
      
      public function Valos(_arg_1:BattleType, _arg_2:int, _arg_3:Juva, _arg_4:int, _arg_5:Boolean)
      {
         super();
         this.tyhegaha = _arg_1;
         this.timeLimit = _arg_3.timeLimitInSec;
         this.scoreLimit = _arg_3.scoreLimit;
         this.kodyberep = new WhiteFrame();
         addChild(this.kodyberep);
         this.kezogizu = new Wasygac(BattleInfoIcons.MONEY);
         this.kezogizu.zone(_arg_2);
         addChild(this.kezogizu);
         this.gafeworu(_arg_5);
         if(this.timeLimit > 0)
         {
            this.govyjer = new Nadapy(kahi,BattleInfoIcons.TIME_LIMIT,Hyn.instance,false);
            this.govyjer.value = _arg_4;
            addChild(this.govyjer);
         }
      }
      
      private function sotefe() : int
      {
         switch(this.tyhegaha)
         {
            case BattleType.CTF:
               return BattleInfoIcons.CTF;
            case BattleType.rovicateto:
               return BattleInfoIcons.CTF;
            default:
               return BattleInfoIcons.KILL_LIMIT;
         }
      }
      
      public function sup(_arg_1:int) : void
      {
         if(this.qiloc != null)
         {
            if(_arg_1 >= this.scoreLimit - this.qahimeki())
            {
               this.qiloc.pozorij();
            }
         }
      }
      
      private function qahimeki() : int
      {
         switch(this.tyhegaha)
         {
            case BattleType.CTF:
               return mimuj;
            case BattleType.rovicateto:
               return gor;
            default:
               return tuja;
         }
      }
      
      public function vamal(_arg_1:int) : void
      {
         this.kezogizu.zone(_arg_1);
      }
      
      public function reset() : void
      {
         if(this.qiloc != null)
         {
            this.qiloc.value = this.scoreLimit;
         }
         if(this.govyjer != null)
         {
            this.govyjer.value = this.timeLimit;
         }
         if(this.rata != null)
         {
            this.wyr();
         }
      }
      
      public function gif() : void
      {
         if(this.qiloc != null)
         {
            this.qiloc.gif();
         }
         if(this.govyjer != null)
         {
            this.govyjer.value = 0;
            this.govyjer.gif();
         }
         if(this.rata != null)
         {
            this.rata.value = 0;
            this.rata.gif();
         }
      }
      
      public function fod() : void
      {
         this.kezogizu.x = 14;
         this.kezogizu.y = 11;
         var _local_1:Number = this.kezogizu.width + this.kezogizu.x;
         if(this.qiloc != null)
         {
            this.qiloc.x = _local_1 + 6;
            this.qiloc.y = 11;
            _local_1 = this.qiloc.width + this.qiloc.x;
         }
         if(this.govyjer != null)
         {
            this.govyjer.x = _local_1 + 10;
            this.govyjer.y = 11;
            _local_1 = this.govyjer.width + this.govyjer.x;
         }
         if(this.rata != null)
         {
            if(this.govyjer != null)
            {
               this.rata.x = this.govyjer.x;
               this.rata.y = this.govyjer.y;
            }
            else
            {
               this.rata.x = _local_1 + 10;
               this.rata.y = 11;
               _local_1 = this.rata.width + this.rata.x;
            }
         }
         this.kodyberep.width = 12 + _local_1;
      }
      
      public function zupa(_arg_1:int) : void
      {
         if(this.govyjer != null)
         {
            this.govyjer.visible = false;
         }
         this.rata = new Lup(kahi,BattleInfoIcons.TIME_LIMIT,Hyn.instance,false);
         this.rata.kir(_arg_1);
         addChild(this.rata);
      }
      
      public function wyr() : void
      {
         if(this.govyjer != null)
         {
            this.govyjer.visible = true;
         }
         removeChild(this.rata);
         this.rata = null;
      }
      
      public function gihudowyk(_arg_1:int) : void
      {
         this.govyjer.kir(_arg_1);
      }
      
      public function vyrojub() : void
      {
         this.govyjer.bysucawab();
      }
      
      public function gafeworu(_arg_1:Boolean) : void
      {
         if(this.qiloc == null && _arg_1 && this.scoreLimit > 0)
         {
            this.qiloc = new Bifywily(this.qahimeki(),this.sotefe(),Hyn.instance);
            this.qiloc.value = this.scoreLimit;
            addChild(this.qiloc);
         }
      }
   }
}

