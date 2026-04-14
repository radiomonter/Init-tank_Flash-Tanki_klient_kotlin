package alternativa.tanks.battle
{
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.tanks.battle.events.BattleEventDispatcher;
   import alternativa.tanks.models.battle.battlefield.BattlefieldModel;
   import alternativa.tanks.models.tank.Num;
   import flash.media.Sound;
   import flash.utils.getTimer;
   import obfuscation.bicyhaq.Dyv;
   import obfuscation.dinas.Cec;
   import obfuscation.dinas.Cyw;
   import obfuscation.dinas.Damopykul;
   import obfuscation.dinas.Nulabil;
   import obfuscation.kyre.Gemehyfe;
   import obfuscation.kyre.TanksCollisionDetector;
   import obfuscation.kyre.Vuwuci;
   import obfuscation.kyre.Ziki;
   import obfuscation.lozewaby.Guh;
   import obfuscation.lozewaby.Kukokiboz;
   
   public class BattleRunner
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      public static const rasomil:int = 33;
      
      public static const lup:Number = 0.033;
      
      private var time:int;
      
      private var collisionDetector:TanksCollisionDetector;
      
      private var mikor:Body;
      
      private var vosezyg:Boolean;
      
      private var kyfyrid:Guh;
      
      private var wumologe:int;
      
      private var ziwe:Boolean;
      
      private var physicsScene:Ziki;
      
      private const ninop:Dyv = new Dyv();
      
      public var doriveg:PerformanceMonitor = new PerformanceMonitor(30);
      
      private var gila:Vector.<LogicUnit> = new Vector.<LogicUnit>();
      
      private var pijigiqa:Vector.<DeferredAction> = new Vector.<DeferredAction>();
      
      private var mofilok:Vector.<PhysicsController> = new Vector.<PhysicsController>();
      
      private var vinuwefeg:Vector.<PostPhysicsController> = new Vector.<PostPhysicsController>();
      
      private var vinepud:Vector.<PhysicsInterpolator> = new Vector.<PhysicsInterpolator>();
      
      public function BattleRunner(_arg_1:Number, _arg_2:Sound, _arg_3:BattleEventDispatcher)
      {
         super();
         this.time = getTimer();
         this.wumologe = this.time;
         this.physicsScene = new Ziki(this.time,_arg_1,_arg_3);
         this.kyfyrid = Kukokiboz.putev(_arg_2);
         Gemehyfe.qyhod();
      }
      
      public function lokezi() : Guh
      {
         return this.kyfyrid;
      }
      
      public function pyzujedos(_arg_1:Vector.<CollisionShape>) : void
      {
         this.physicsScene.pyzujedos(_arg_1);
      }
      
      public function soc() : TanksCollisionDetector
      {
         return this.physicsScene.soc();
      }
      
      public function zyqityget(_arg_1:Number) : void
      {
         this.physicsScene.zyqityget(_arg_1);
      }
      
      public function wapicyjim(_arg_1:Trigger) : void
      {
         this.ninop.add(_arg_1);
      }
      
      public function zegyrak(_arg_1:Trigger) : void
      {
         this.ninop.remove(_arg_1);
      }
      
      public function bati(_arg_1:Vuwuci) : void
      {
         this.physicsScene.addBody(_arg_1);
      }
      
      public function zuz(_arg_1:Vuwuci) : void
      {
         this.physicsScene.removeBody(_arg_1);
         if(this.mikor == _arg_1.body)
         {
            this.necuwu(null);
         }
      }
      
      public function necuwu(_arg_1:Body) : void
      {
         this.mikor = _arg_1;
      }
      
      public function shutdown() : void
      {
         this.kyfyrid.lofeqofeh();
         this.kyfyrid.sud();
         this.physicsScene.destroy();
      }
      
      public function wefoderu(_arg_1:PhysicsController) : void
      {
         if(this.vosezyg)
         {
            this.sonec(new Damopykul(_arg_1,true));
         }
         else if(this.mofilok.indexOf(_arg_1) < 0)
         {
            this.mofilok.push(_arg_1);
         }
      }
      
      public function tick() : void
      {
         var _local_1:int = getTimer();
         var _local_2:int = _local_1 - this.time;
         this.time = _local_1;
         this.liqohoson(rasomil);
         battleService.getBattleScene3D().render(this.time,_local_2);
         battleService.getBattleView().update();
         this.updateTanks(_local_2);
         this.kyfyrid.resuru(_local_2,battleService.getBattleScene3D().cewubu());
      }
      
      private function updateTanks(_arg_1:int) : void
      {
         var _local_2:Number = 1 - (this.hulivyjam() - this.time) / rasomil;
         BattlefieldModel(battleService).updateTanks(this.time,_arg_1,0.001 * _arg_1,_local_2);
      }
      
      public function wop(_arg_1:LogicUnit) : void
      {
         if(this.ziwe)
         {
            this.sonec(new Cyw(this,_arg_1,true));
         }
         else if(this.gila.indexOf(_arg_1) < 0)
         {
            this.gila.push(_arg_1);
         }
      }
      
      public function bapucic(_arg_1:LogicUnit) : void
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         if(this.ziwe)
         {
            this.sonec(new Cyw(this,_arg_1,false));
         }
         else
         {
            _local_2 = int(this.gila.length);
            if(_local_2 > 0)
            {
               _local_3 = this.gila.indexOf(_arg_1);
               if(_local_3 >= 0)
               {
                  this.gila[_local_3] = this.gila[--_local_2];
                  this.gila.length = _local_2;
               }
            }
         }
      }
      
      private function howoq(_arg_1:int) : void
      {
         var _local_2:LogicUnit = null;
         var _local_5:int = 0;
         var _local_3:int = _arg_1 - this.wumologe;
         this.wumologe = _arg_1;
         this.ziwe = true;
         var _local_4:int = int(this.gila.length);
         while(_local_5 < _local_4)
         {
            _local_2 = this.gila[_local_5];
            _local_2.fivuli(_arg_1,_local_3);
            _local_5++;
         }
         this.ziwe = false;
         this.kype();
      }
      
      private function liqohoson(_arg_1:int) : void
      {
         this.doriveg.decen();
         while(this.physicsScene.hulivyjam() < this.time)
         {
            this.cywyruqu();
            this.howoq(this.hulivyjam());
            this.vosezyg = true;
            this.foqihuvy(_arg_1 / 1000);
            this.physicsScene.update(_arg_1);
            this.like(_arg_1 / 1000);
            this.ninop.zaleby(this.mikor);
            this.vosezyg = false;
            this.kype();
         }
         this.doriveg.gukyz();
         this.ruteja();
      }
      
      private function cywyruqu() : void
      {
         var _local_1:Num = Num.cimise;
         if(_local_1 == null)
         {
            return;
         }
         if(_local_1.tank == null)
         {
            return;
         }
         _local_1.tank.kociryji();
      }
      
      private function kype() : void
      {
         var _local_1:DeferredAction = null;
         while(true)
         {
            _local_1 = this.pijigiqa.pop();
            if(_local_1 == null)
            {
               break;
            }
            _local_1.execute();
         }
      }
      
      private function foqihuvy(_arg_1:Number) : void
      {
         var _local_2:PhysicsController = null;
         var _local_4:int = 0;
         var _local_3:int = int(this.mofilok.length);
         while(_local_4 < _local_3)
         {
            _local_2 = this.mofilok[_local_4];
            _local_2.runBeforePhysicsUpdate(_arg_1);
            _local_4++;
         }
      }
      
      private function like(_arg_1:Number) : void
      {
         var _local_2:PostPhysicsController = null;
         var _local_4:int = 0;
         var _local_3:int = int(this.vinuwefeg.length);
         while(_local_4 < _local_3)
         {
            _local_2 = this.vinuwefeg[_local_4];
            _local_2.jatil(_arg_1);
            _local_4++;
         }
      }
      
      private function ruteja() : void
      {
         var _local_1:PhysicsInterpolator = null;
         var _local_4:int = 0;
         var _local_2:Number = 1 + (this.time - this.physicsScene.hulivyjam()) / rasomil;
         var _local_3:int = int(this.vinepud.length);
         while(_local_4 < _local_3)
         {
            _local_1 = this.vinepud[_local_4];
            _local_1.interpolatePhysicsState(_local_2);
            _local_4++;
         }
      }
      
      private function sonec(_arg_1:DeferredAction) : void
      {
         this.pijigiqa.push(_arg_1);
      }
      
      public function kigunig(_arg_1:PhysicsController) : void
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         if(this.vosezyg)
         {
            this.sonec(new Damopykul(_arg_1,false));
         }
         else
         {
            _local_2 = int(this.mofilok.length);
            if(_local_2 > 0)
            {
               _local_3 = this.mofilok.indexOf(_arg_1);
               if(_local_3 >= 0)
               {
                  this.mofilok.splice(_local_3,1);
               }
            }
         }
      }
      
      public function wyqem(_arg_1:PostPhysicsController) : void
      {
         if(this.vosezyg)
         {
            this.sonec(new Cec(_arg_1));
         }
         else if(this.vinuwefeg.indexOf(_arg_1) < 0)
         {
            this.vinuwefeg.push(_arg_1);
         }
      }
      
      public function wapiti(_arg_1:PostPhysicsController) : void
      {
         var _local_2:int = 0;
         var _local_3:int = 0;
         if(this.vosezyg)
         {
            this.sonec(new Nulabil(_arg_1));
         }
         else
         {
            _local_2 = int(this.vinuwefeg.length);
            if(_local_2 > 0)
            {
               _local_3 = this.vinuwefeg.indexOf(_arg_1);
               if(_local_3 >= 0)
               {
                  this.vinuwefeg.splice(_local_3,1);
               }
            }
         }
      }
      
      public function fugimok(_arg_1:PhysicsInterpolator) : void
      {
         if(this.vinepud.indexOf(_arg_1) < 0)
         {
            this.vinepud.push(_arg_1);
         }
      }
      
      public function kufoq(_arg_1:PhysicsInterpolator) : void
      {
         var _local_2:int = 0;
         var _local_3:int = int(this.vinepud.length);
         if(_local_3 > 0)
         {
            _local_2 = this.vinepud.indexOf(_arg_1);
            if(_local_2 >= 0)
            {
               this.vinepud[_local_2] = this.vinepud[--_local_3];
               this.vinepud.length = _local_3;
            }
         }
      }
      
      public function hulivyjam() : int
      {
         return this.physicsScene.hulivyjam();
      }
      
      public function tuhuvika(_arg_1:int) : void
      {
         return this.physicsScene.tuhuvika(_arg_1);
      }
      
      public function nifa() : Number
      {
         return this.physicsScene.nifa();
      }
   }
}

