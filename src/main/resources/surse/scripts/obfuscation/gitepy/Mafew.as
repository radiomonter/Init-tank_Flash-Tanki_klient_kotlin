package obfuscation.gitepy
{
   import alternativa.math.Vector3;
   import alternativa.osgi.service.display.IDisplay;
   import alternativa.tanks.models.weapon.shaft.Byjujoqum;
   import alternativa.tanks.models.weapon.shaft.Dodaly;
   import alternativa.tanks.models.weapon.shaft.Hefad;
   import alternativa.tanks.models.weapon.shaft.Qyj;
   import alternativa.tanks.models.weapon.shaft.Roguqine;
   import alternativa.tanks.services.targeting.TargetingModeService;
   import alternativa.tanks.utils.MathUtils;
   import com.alternativaplatform.projects.tanks.client.commons.types.TankSpecification;
   import flash.events.FullScreenEvent;
   import flash.utils.getTimer;
   import obfuscation.garud.Rib;
   import obfuscation.garud.Vaba;
   import obfuscation.gur.Qudylin;
   import obfuscation.zajun.Qiqa;
   
   public class Mafew implements Boc
   {
      
      [Inject]
      public static var pulat:TargetingModeService;
      
      [Inject]
      public static var display:IDisplay;
      
      private static const jacela:Number = 8;
      
      private static const fufycapi:Number = 1;
      
      private static const dasuw:Number = 5000;
      
      private static const wuh:Number = 50;
      
      private static const gusyqiw:Number = dasuw - wuh;
      
      private static const kow:Number = jacela - fufycapi;
      
      private static var winypojo:Vector3 = new Vector3();
      
      private static var targetPoint:Pyvu = new Pyvu();
      
      private static var sinesi:Vector3 = new Vector3();
      
      private var context:Pypoqa;
      
      private var weapon:Byjujoqum;
      
      private var up:Boolean;
      
      private var down:Boolean;
      
      private var ziqowa:Qudylin;
      
      private var jyce:Qiqa;
      
      private var rabumupo:Dodaly = new Dodaly();
      
      private var fulavulyg:Dodaly = new Dodaly();
      
      private var exitTime:int;
      
      private var nerol:Boolean;
      
      private var fug:Boolean;
      
      private var myhop:Vaba;
      
      private var effects:Roguqine;
      
      private var wijeju:Number;
      
      private var kivuqav:TankSpecification;
      
      public function Mafew(_arg_1:Pypoqa, _arg_2:Byjujoqum, _arg_3:Qudylin, _arg_4:Qiqa, _arg_5:Vaba, _arg_6:Roguqine, _arg_7:TankSpecification)
      {
         super();
         this.context = _arg_1;
         this.weapon = _arg_2;
         this.ziqowa = _arg_3;
         this.jyce = _arg_4;
         this.myhop = _arg_5;
         this.effects = _arg_6;
         this.kivuqav = _arg_7;
         this.rabumupo.setInterval(_arg_4.fysejydu,_arg_4.vuqet);
         this.fulavulyg.setInterval(_arg_4.tututi,_arg_4.wybokukic);
      }
      
      public function enter(_arg_1:int) : void
      {
         this.wijeju = Rib(this.myhop.sowiq()).getTurnAcceleration();
         Rib(this.myhop.sowiq()).setTurnAcceleration(this.jyce.targetingAcceleration);
         this.kuseky(1);
         this.weapon.cunaro(Hefad.DRAIN);
         this.weapon.govuz();
         this.up = MathUtils.getBitValue(Rib(this.myhop.sowiq()).getControl(),Rib.sagoh) != 0;
         this.down = MathUtils.getBitValue(Rib(this.myhop.sowiq()).getControl(),Rib.dazefozy) != 0;
         this.exitTime = -1;
         this.nerol = false;
         this.fug = true;
         this.myhop.bared();
         display.stage.addEventListener(FullScreenEvent.FULL_SCREEN,this.likobadyb);
      }
      
      private function kuseky(_arg_1:Number) : void
      {
         Rib(this.myhop.sowiq()).setMaxTurnSpeed(_arg_1 * this.jyce.roz * this.myhop.sowiq().getTurnAcceleration(),false);
         this.ziqowa.pewyre(_arg_1);
         this.myhop.sew(_arg_1);
      }
      
      public function update(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:int = 0;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         this.up = MathUtils.getBitValue(Rib(this.myhop.sowiq()).getControl(),Rib.sagoh) != 0;
         this.down = MathUtils.getBitValue(Rib(this.myhop.sowiq()).getControl(),Rib.dazefozy) != 0;
         if(this.exitTime > 0)
         {
            if(_arg_1 >= this.exitTime)
            {
               this.weapon.rawa(Qyj.EXIT);
            }
         }
         else if(this.weapon.mofufuqo())
         {
            this.weapon.rawa(Qyj.STOP,true);
         }
         else
         {
            _local_3 = int(this.up) - int(this.down);
            this.ziqowa.rywa = _local_3;
            this.effects.ninato(_local_3 != 0 && !this.ziqowa.bogose() || Rib(this.myhop.sowiq()).isRotating());
            _local_4 = this.weapon.nase(_arg_1);
            if(_local_4 == 0 && this.fug)
            {
               this.fug = false;
               this.weapon.cyd();
            }
            _local_5 = this.context.niba - _local_4;
            _local_6 = _local_5 / this.weapon.jymon();
            this.ziqowa.pisipiq(this.rabumupo.interpolate(_local_6));
            _local_7 = this.manojymy(_local_6);
            this.kuseky(_local_7);
            this.weapon.tevicyvy(this.fulavulyg.interpolate(_local_6));
         }
      }
      
      public function rawa(_arg_1:Qyj, _arg_2:*) : void
      {
         switch(_arg_1)
         {
            case Qyj.TRIGGER_RELEASE:
               if(!this.nerol)
               {
                  this.nerol = true;
                  this.weapon.gadotity(this.context.niba);
                  this.weapon.cunaro(Hefad.RECHARGE);
                  this.exitTime = getTimer() + this.jyce.afterShotPause;
               }
         }
      }
      
      public function exit() : void
      {
         this.effects.ninato(false);
         this.effects.hyhu();
         Rib(this.myhop.sowiq()).setMaxTurnSpeed(this.kivuqav.turretRotationSpeed,true);
         Rib(this.myhop.sowiq()).setTurnAcceleration(this.wijeju);
         this.weapon.legify();
         this.myhop.gudowel();
         display.stage.removeEventListener(FullScreenEvent.FULL_SCREEN,this.likobadyb);
      }
      
      private function likobadyb(_arg_1:FullScreenEvent) : void
      {
         this.weapon.rawa(Qyj.EXIT);
      }
      
      private function manojymy(_arg_1:Number) : Number
      {
         var _local_2:Number = this.jyce.rotationCoeffT1;
         if(_arg_1 < _local_2)
         {
            return 1;
         }
         var _local_3:Number = this.jyce.rotationCoeffT2;
         var _local_4:Number = this.jyce.rotationCoeffKmin;
         if(_arg_1 < _local_3)
         {
            return 1 - (1 - _local_4) * (_arg_1 - _local_2) / (_local_3 - _local_2);
         }
         return _local_4;
      }
   }
}

