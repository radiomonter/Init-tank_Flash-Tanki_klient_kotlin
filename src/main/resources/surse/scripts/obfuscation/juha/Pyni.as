package obfuscation.juha
{
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.battle.LogicUnit;
   import alternativa.tanks.battle.scene3d.Renderer;
   import alternativa.tanks.utils.MathUtils;
   import obfuscation.hato.Jybupe;
   import obfuscation.ligy.Zyjova;
   import obfuscation.lokofobiv.Feh;
   
   public class Pyni implements Renderer, LogicUnit
   {
      
      private static const pijehakut:ConsoleVarFloat = new ConsoleVarFloat("dom_smoothing_factor",0.95,0,1);
      
      private static const MAX_PROGRESS:Number = 100;
      
      private var id:int;
      
      private var name:String;
      
      private var buz:Zyjova;
      
      private var position:Vector3;
      
      private var view:Fafit;
      
      private var cewyqi:Number = 0;
      
      private var cozy:Number = 0;
      
      private var mamalidy:Number = 0;
      
      private var wiriguw:Feh;
      
      private var battleService:BattleService;
      
      private var jijyhu:Boolean;
      
      private var tygabe:Jybupe;
      
      public var jesydyq:int;
      
      public function Pyni(_arg_1:int, _arg_2:String, _arg_3:Vector3, _arg_4:BattleService, _arg_5:Feh, _arg_6:Jybupe, _arg_7:Fafit)
      {
         super();
         this.id = _arg_1;
         this.name = _arg_2;
         this.view = _arg_7;
         this.position = _arg_3;
         this.wiriguw = _arg_5;
         this.tygabe = _arg_6;
         this.battleService = _arg_4;
         this.jijyhu = false;
         _arg_4.getBattleScene3D().toqok(this,0);
         _arg_7.addToScene(_arg_4.getBattleScene3D(),_arg_3);
      }
      
      public function jojate(_arg_1:Zyjova) : void
      {
         this.buz = _arg_1;
         this.jijyhu = false;
         if(this.buz == Zyjova.NEUTRAL)
         {
            this.view.gubiw();
            if(this.jesydyq == 0)
            {
               this.cewyqi = 0;
               this.cozy = 0;
               this.mamalidy = 0;
            }
         }
         else
         {
            if(this.buz == Zyjova.BLUE)
            {
               this.view.tyluna();
               this.cewyqi = MAX_PROGRESS;
            }
            else
            {
               this.view.jahycov();
               this.cewyqi = -MAX_PROGRESS;
            }
            this.cozy = this.cewyqi;
            this.mamalidy = 0;
         }
      }
      
      public function poforiv() : Zyjova
      {
         return this.buz;
      }
      
      public function weg(_arg_1:Number, _arg_2:Number) : void
      {
         this.cewyqi = _arg_1;
         this.mamalidy = _arg_2;
      }
      
      public function readPosition(_arg_1:Vector3) : void
      {
         _arg_1.copy(this.position);
         _arg_1.z += Fafit.junyqanyc;
      }
      
      public function getPosition() : Vector3
      {
         return this.position;
      }
      
      public function getName() : String
      {
         return this.name;
      }
      
      public function neka() : Number
      {
         return this.cozy;
      }
      
      public function reset() : void
      {
         this.jesydyq = 0;
         this.cewyqi = 0;
         this.cozy = 0;
         this.mamalidy = 0;
         this.buz = Zyjova.NEUTRAL;
         this.view.gubiw();
         this.tygabe.luqire();
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         this.view.update(this.cozy,this.battleService.getBattleScene3D().cewubu());
      }
      
      public function fivuli(_arg_1:int, _arg_2:int) : void
      {
         this.qywajuzi(_arg_2);
         this.lucocyzo();
         this.gawohe();
      }
      
      private function qywajuzi(_arg_1:int) : void
      {
         if(this.mamalidy != 0)
         {
            this.cewyqi += this.mamalidy * _arg_1 / 1000;
            if(!this.jijyhu && this.lytuti())
            {
               this.wiriguw.ces(this.id);
               this.jijyhu = true;
            }
         }
      }
      
      private function lucocyzo() : void
      {
         var _local_1:Number = MathUtils.clamp(this.cozy + (this.cewyqi - this.cozy) * pijehakut.value,-MAX_PROGRESS,MAX_PROGRESS);
         if(this.jesydyq == 0 && this.cozy * _local_1 <= 0)
         {
            this.cewyqi = 0;
            this.cozy = 0;
            this.mamalidy = 0;
         }
         else
         {
            this.cozy = _local_1;
         }
      }
      
      private function lytuti() : Boolean
      {
         return Math.abs(this.cewyqi) >= MAX_PROGRESS;
      }
      
      private function gawohe() : void
      {
         var _local_1:Number = this.cozy * this.mamalidy;
         if(this.cozy >= 100 || this.cozy <= -100)
         {
            this.tygabe.luqire();
            return;
         }
         if(_local_1 > 0 || this.cozy == 0 && this.mamalidy != 0)
         {
            this.tygabe.wowahi(this.position);
         }
         else if(_local_1 < 0)
         {
            this.tygabe.jejipyqan(this.position);
         }
         else
         {
            this.tygabe.luqire();
         }
      }
   }
}

