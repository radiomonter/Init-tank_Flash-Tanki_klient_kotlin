package obfuscation.garud
{
   import alternativa.math.Vector3;
   import alternativa.osgi.OSGi;
   import alternativa.physics.Body;
   import alternativa.service.IModelService;
   import alternativa.tanks.battle.objects.tank.Cokunuf;
   import alternativa.tanks.battle.objects.tank.Dobyt;
   import alternativa.tanks.models.tank.Num;
   import alternativa.tanks.services.targeting.TargetingInputManager;
   import alternativa.tanks.utils.BitMask;
   import alternativa.tanks.utils.MathUtils;
   import obfuscation.mobakobup.Cymone;
   import obfuscation.mobakobup.Vodujyse;
   
   public final class Rib
   {
      
      [Inject]
      public static var vekol:TargetingInputManager;
      
      public static const lisihusah:int = 5;
      
      public static const tyn:int = 6;
      
      public static const koqywinut:int = 7;
      
      public static const sagoh:int = 8;
      
      public static const dazefozy:int = 9;
      
      private static const viva:Number = 5;
      
      private static const jede:Number = 20;
      
      private static const lyfezyv:Number = 0.05;
      
      private static const dem:Number = lyfezyv * Math.PI / 180;
      
      private static const EPSILON:Number = 0.000001;
      
      private static var zorebup:Vector3 = new Vector3();
      
      private static var hevajisig:Vector3 = new Vector3();
      
      private static var beca:Vector3 = new Vector3();
      
      private static var vemoleg:Vector3 = new Vector3();
      
      private var jezosut:Cokunuf = new Dobyt(0.3,10,0,0);
      
      private var maxTurnSpeed:Number = 0;
      
      private var turnAcceleration:Number = 0;
      
      private var turnSpeed:Number = 0;
      
      private var pyvef:Number = 0;
      
      private var memiwid:Number = 0;
      
      private var towikud:int;
      
      private var zymunufyr:int;
      
      private var guly:Boolean;
      
      private var kugyt:Number = 0;
      
      private var rituq:BitMask = new BitMask();
      
      private var rugynosi:Boolean;
      
      protected var kyzoje:int = 0;
      
      private var zeh:int = 0;
      
      private var wijyb:Number;
      
      protected var numita:Number = 0;
      
      private var jitybe:Number;
      
      private var bev:Boolean;
      
      private var listener:Zejotuwo;
      
      private var symaqoli:Boolean = false;
      
      private var lavify:Boolean = false;
      
      private var mumel:Boolean = false;
      
      private var hyvezudi:Vector.<Boolean> = new Vector.<Boolean>(256,true);
      
      private var bycuqobak:Number;
      
      private var leg:Number;
      
      private var tank:Num;
      
      public function Rib(_arg_1:Boolean, _arg_2:Zejotuwo, _arg_3:Num)
      {
         this.tank = _arg_3;
         super();
         var _local_4:IModelService = OSGi.getInstance().getService(IModelService) as IModelService;
         var _local_5:Cymone = Cymone(OSGi.getInstance().getService(Cymone));
         var _local_6:Vodujyse = _local_5.honyna(_arg_3.turret);
         this.rugynosi = _arg_1;
         this.setMaxTurnSpeed(_local_6.mikepal(),true);
         this.turnAcceleration = _local_6.fotulite();
         this.bycuqobak = Math.PI;
         this.leg = -Math.PI;
         this.rituq.clear();
      }
      
      public function pez(_arg_1:Number) : void
      {
         this.kugyt = _arg_1;
      }
      
      public function lock(_arg_1:int) : void
      {
         this.rituq.change(_arg_1,true);
         if(this.isLocked())
         {
            this.turnSpeed = 0;
            this.vunew(0);
         }
      }
      
      public function unlock(_arg_1:int) : void
      {
         var _local_2:Boolean = this.isLocked();
         this.rituq.change(_arg_1,false);
         if(!this.isLocked() && _local_2)
         {
            this.guly = false;
            this.vunew(this.kyzoje);
         }
      }
      
      public function rolo(_arg_1:int, _arg_2:Boolean = false) : void
      {
         this.kyzoje = _arg_1;
         if(this.isEnabled())
         {
            this.vunew(_arg_1,_arg_2);
         }
      }
      
      private function vunew(_arg_1:int, _arg_2:Boolean = false) : void
      {
         var _local_3:int = this.zeh;
         this.zeh = _arg_1;
         var _local_4:int = MathUtils.getBitValue(_arg_1,lisihusah);
         var _local_5:int = MathUtils.getBitValue(_arg_1,tyn);
         this.zymunufyr = _local_4 - _local_5;
         this.guly = _local_4 + _local_5 == 0 && (this.guly || MathUtils.getBitValue(_arg_1,koqywinut) == 1);
         if(this.zeh != _local_3 || _arg_2)
         {
            this.fotosaz(this.zeh);
         }
      }
      
      protected function fotosaz(_arg_1:int) : void
      {
         if(this.listener != null)
         {
            this.listener.zevizisy(_arg_1);
         }
      }
      
      public function kasasyta(_arg_1:Number) : void
      {
         this.memiwid = _arg_1;
      }
      
      public function nivecoqig(_arg_1:Number) : void
      {
         var _local_2:Number = this.pusekafo(_arg_1,this.jitybe);
         if(Math.abs(_local_2) > dem)
         {
            this.jitybe = _arg_1;
            this.bev = true;
            this.mumel = true;
         }
      }
      
      public function jesenebo() : Number
      {
         return this.memiwid;
      }
      
      public function getControl() : int
      {
         return !this.isEnabled() ? int(0) : int(this.kyzoje);
      }
      
      public function rotate(_arg_1:Number) : void
      {
         var _local_2:int = 0;
         var _local_3:Boolean = false;
         if(this.bev)
         {
            this.wyn(_arg_1);
         }
         this.rolo(this.kyzoje,this.lavify);
         this.lavify = false;
         this.pyvef = this.memiwid;
         this.maxTurnSpeed = this.jezosut.update(_arg_1);
         if(this.rituq.isEmpty())
         {
            if(this.guly)
            {
               if(this.memiwid == this.kugyt)
               {
                  this.faceba();
                  return;
               }
               _local_2 = this.memiwid < this.kugyt ? int(1) : int(-1);
            }
            else
            {
               _local_2 = this.zymunufyr;
            }
            if(this.towikud != _local_2)
            {
               this.turnSpeed = 0;
               this.towikud = _local_2;
            }
            if(_local_2 == 0)
            {
               this.turnSpeed = 0;
               return;
            }
            this.turnSpeed += _local_2 * this.turnAcceleration * _arg_1;
            this.turnSpeed = MathUtils.clamp(this.turnSpeed,-this.maxTurnSpeed,this.maxTurnSpeed);
            _local_3 = this.memiwid < this.kugyt;
            this.memiwid += this.turnSpeed * _arg_1;
            if(this.guly && _local_3 != this.memiwid < this.kugyt)
            {
               this.memiwid = this.kugyt;
               this.faceba();
               return;
            }
            this.memiwid = MathUtils.clampAngle(this.memiwid);
            this.memiwid = MathUtils.clamp(this.memiwid,this.leg,this.bycuqobak);
         }
      }
      
      private function wyn(_arg_1:Number) : void
      {
         var _local_2:Number = NaN;
         var _local_3:Number = NaN;
         this.kyzoje = 0;
         var _local_4:Number = this.pusekafo(this.jitybe,this.jesenebo());
         var _local_5:Number = Math.abs(_local_4);
         if(_local_5 >= EPSILON)
         {
            _local_2 = this.milatel() * _arg_1;
            if(_local_5 < _local_2 && !this.mumel)
            {
               _local_3 = _local_2 / viva;
               if(_local_5 <= _local_3)
               {
                  this.kasasyta(this.jitybe);
                  this.bev = false;
                  if(_local_5 >= _local_2 / jede)
                  {
                     this.lavify = true;
                  }
               }
               else
               {
                  this.kasasyta(this.jesenebo() + _local_4 / 2);
               }
            }
            else
            {
               if(_local_4 < 0)
               {
                  this.kyzoje = MathUtils.changeBitValue(this.kyzoje,tyn,true);
                  this.kyzoje = MathUtils.changeBitValue(this.kyzoje,lisihusah,false);
               }
               else if(_local_4 > 0)
               {
                  this.kyzoje = MathUtils.changeBitValue(this.kyzoje,lisihusah,true);
                  this.kyzoje = MathUtils.changeBitValue(this.kyzoje,tyn,false);
               }
               this.mumel = false;
            }
         }
      }
      
      private function pusekafo(_arg_1:Number, _arg_2:Number) : Number
      {
         return Math.atan2(Math.sin(_arg_1 - _arg_2),Math.cos(_arg_1 - _arg_2));
      }
      
      private function faceba() : void
      {
         this.guly = false;
         this.turnSpeed = 0;
      }
      
      public function rafyqako(_arg_1:Body) : void
      {
         this.vuz(_arg_1);
      }
      
      private function vuz(_arg_1:Body) : void
      {
         var _local_2:Number = NaN;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         if(this.wijyb > 0)
         {
            _arg_1.prevState.orientation.getYAxis(hevajisig);
            _arg_1.prevState.orientation.getZAxis(zorebup);
            _arg_1.state.orientation.getYAxis(beca);
            vemoleg.cross2(beca,hevajisig);
            _local_2 = vemoleg.dot(zorebup);
            _local_3 = hevajisig.dot(beca);
            _local_4 = Math.atan2(_local_2,_local_3);
            this.memiwid += _local_4 * this.wijyb;
         }
      }
      
      public function lijag(_arg_1:Number) : Number
      {
         var _local_2:Number = NaN;
         var _local_3:Number = this.memiwid - this.pyvef;
         if(_local_3 < -Math.PI)
         {
            _local_2 = this.pyvef + _arg_1 * (MathUtils.PI2 + _local_3);
            if(_local_2 > Math.PI)
            {
               _local_2 -= MathUtils.PI2;
            }
         }
         else if(_local_3 > Math.PI)
         {
            _local_2 = this.pyvef - _arg_1 * (MathUtils.PI2 - _local_3);
            if(_local_2 < -Math.PI)
            {
               _local_2 += MathUtils.PI2;
            }
         }
         else
         {
            _local_2 = this.pyvef + _arg_1 * _local_3;
         }
         return _local_2;
      }
      
      public function isRotating() : Boolean
      {
         return this.turnSpeed != 0;
      }
      
      public function reset() : void
      {
         this.turnSpeed = 0;
         this.pyvef = 0;
         this.memiwid = this.kugyt;
         this.jezosut.reset(this.jezosut.vur());
         this.guly = false;
         if(this.rugynosi)
         {
            this.zymunufyr = 0;
         }
      }
      
      public function setListener(_arg_1:Zejotuwo) : void
      {
         this.listener = _arg_1;
         this.rolo(0);
         this.jitybe = 0;
      }
      
      public function setMaxTurnSpeed(_arg_1:Number, _arg_2:Boolean) : void
      {
         if(_arg_2)
         {
            this.maxTurnSpeed = _arg_1;
            this.jezosut.reset(_arg_1);
         }
         else
         {
            this.jezosut.ravik(_arg_1);
         }
      }
      
      public function milatel() : Number
      {
         return this.jezosut.vur();
      }
      
      public function setTurnAcceleration(_arg_1:Number) : void
      {
         this.turnAcceleration = _arg_1;
      }
      
      public function getTurnAcceleration() : Number
      {
         return this.turnAcceleration;
      }
      
      protected function isLocked() : Boolean
      {
         return !this.rituq.isEmpty();
      }
      
      public function isEnabled() : Boolean
      {
         return this.rituq.isEmpty();
      }
      
      public function tebuqo(_arg_1:Number) : void
      {
         this.wijyb = _arg_1;
      }
      
      public function rotateLeft(_arg_1:Boolean) : void
      {
         this.setState(Rib.lisihusah,_arg_1);
         this.bev = false;
      }
      
      public function rotateRight(_arg_1:Boolean) : void
      {
         this.setState(Rib.tyn,_arg_1);
         this.bev = false;
      }
      
      public function daz(_arg_1:Boolean) : void
      {
         this.setState(Rib.sagoh,_arg_1);
         this.bev = false;
      }
      
      public function tisaseb(_arg_1:Boolean) : void
      {
         this.setState(Rib.dazefozy,_arg_1);
         this.bev = false;
      }
      
      public function center(_arg_1:Boolean) : void
      {
         this.setState(Rib.koqywinut,_arg_1);
         this.bev = false;
      }
      
      private function setState(_arg_1:int, _arg_2:Boolean) : void
      {
         this.kyzoje = MathUtils.changeBitValue(this.kyzoje,_arg_1,_arg_2);
      }
      
      public function mynadi(_arg_1:Number) : void
      {
         this.numita = _arg_1;
         this.symaqoli = true;
      }
      
      public function fewisip() : Number
      {
         return this.numita;
      }
      
      public function fujico() : Boolean
      {
         return this.symaqoli;
      }
      
      public function viwyd() : void
      {
         this.numita = 0;
         this.symaqoli = false;
      }
      
      public function hyjyra() : void
      {
         this.jitybe = this.jesenebo();
      }
      
      public function topoki(_arg_1:uint, _arg_2:Boolean) : void
      {
         if(_arg_1 < this.hyvezudi.length)
         {
            this.hyvezudi[_arg_1] = _arg_2;
         }
      }
      
      public function kevi(_arg_1:uint) : Boolean
      {
         return _arg_1 < this.hyvezudi.length ? Boolean(this.hyvezudi[_arg_1]) : Boolean(false);
      }
      
      public function jyfudelenu() : void
      {
         var _local_1:int = 0;
         while(_local_1 < this.hyvezudi.length)
         {
            this.hyvezudi[_local_1] = false;
            _local_1++;
         }
      }
   }
}

