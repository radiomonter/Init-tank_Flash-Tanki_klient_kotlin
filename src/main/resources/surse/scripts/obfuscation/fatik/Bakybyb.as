package obfuscation.fatik
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.IRayCollisionFilter;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.models.weapon.shared.Zicoha;
   import obfuscation.kyre.Myw;
   import obfuscation.kyre.TanksCollisionDetector;
   
   public class Bakybyb implements IRayCollisionFilter
   {
      
      private static const fawevotoj:RayHit = new RayHit();
      
      private static const peta:Vector3 = new Vector3();
      
      private static const memiwid:Vector3 = new Vector3();
      
      private static const direction:Vector3 = new Vector3();
      
      private static const matrix:Matrix3 = new Matrix3();
      
      private var cotodima:Number;
      
      private var votyfyzo:int;
      
      private var linaze:Number;
      
      private var dyheh:int;
      
      private var fesuhum:Number;
      
      private var vypycira:Zer;
      
      private var wazuk:Number;
      
      private var lywufa:int;
      
      private var cupy:Body;
      
      private var collisionDetector:TanksCollisionDetector;
      
      private var maxRicochetCount:int;
      
      public function Bakybyb(_arg_1:Number, _arg_2:int, _arg_3:Number, _arg_4:int, _arg_5:Number, _arg_6:TanksCollisionDetector, _arg_7:Zer, _arg_8:int)
      {
         super();
         this.cotodima = _arg_1;
         this.votyfyzo = _arg_2;
         this.linaze = _arg_3;
         this.dyheh = _arg_4;
         this.fesuhum = _arg_5;
         this.vypycira = _arg_7;
         this.collisionDetector = _arg_6;
         this.maxRicochetCount = _arg_8;
      }
      
      public function considerBody(_arg_1:Body) : Boolean
      {
         return this.cupy != _arg_1 || this.lywufa > 0;
      }
      
      public function jyliry(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Body, _arg_5:Vector3) : void
      {
         this.wewekav(_arg_4);
         this.qoci(_arg_1,_arg_2,0,_arg_5);
         this.himomage(_arg_1,_arg_2,_arg_3,this.cotodima / this.votyfyzo,this.votyfyzo,_arg_5);
         this.himomage(_arg_1,_arg_2,_arg_3,-this.linaze / this.dyheh,this.dyheh,_arg_5);
         this.zufabyfiv(_arg_5,_arg_2);
      }
      
      private function wewekav(_arg_1:Body) : void
      {
         this.cupy = _arg_1;
         this.wazuk = 0;
      }
      
      private function qoci(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Number, _arg_4:Vector3) : void
      {
         var _local_5:Body = null;
         var _local_6:Boolean = false;
         this.lywufa = 0;
         peta.copy(_arg_1);
         memiwid.copy(_arg_2);
         var _local_7:Number = this.fesuhum;
         while(_local_7 > 0)
         {
            if(!this.collisionDetector.raycast(peta,memiwid,Myw.WEAPON,_local_7,this,fawevotoj))
            {
               return;
            }
            _local_7 -= fawevotoj.t;
            if(_local_7 < 0)
            {
               _local_7 = 0;
            }
            _local_5 = fawevotoj.shape.body;
            _local_6 = false;
            if(_local_5.tank != null)
            {
               if(this.lywufa > 0)
               {
                  _local_6 = true;
               }
               else
               {
                  _local_6 = !Zicoha.fyfujuwub(peta,fawevotoj.position);
               }
            }
            if(_local_5.tank != null && _local_5 != this.cupy && _local_6)
            {
               this.kaleticus(_local_5,_local_7,_arg_3,_arg_2,_arg_4);
               return;
            }
            if(_local_6)
            {
               return;
            }
            if(!this.rabegyvy())
            {
               return;
            }
         }
      }
      
      private function kaleticus(_arg_1:Body, _arg_2:Number, _arg_3:Number, _arg_4:Vector3, _arg_5:Vector3) : void
      {
         var _local_6:Number = this.fesuhum - _arg_2;
         var _local_7:Number = this.vypycira.roruqily(_arg_1,this.lywufa,_local_6,_arg_3,this.fesuhum,Math.max(this.cotodima,this.linaze));
         if(_local_7 > this.wazuk)
         {
            this.wazuk = _local_7;
            _arg_5.copy(_arg_4);
         }
      }
      
      private function rabegyvy() : Boolean
      {
         var _local_1:Vector3 = null;
         if(this.lywufa < this.maxRicochetCount)
         {
            ++this.lywufa;
            _local_1 = fawevotoj.normal;
            memiwid.addScaled(-2 * memiwid.dot(_local_1),_local_1);
            peta.copy(fawevotoj.position).addScaled(0.5,_local_1);
            return true;
         }
         return false;
      }
      
      private function himomage(_arg_1:Vector3, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Number, _arg_5:int, _arg_6:Vector3) : void
      {
         var _local_8:int = 0;
         direction.copy(_arg_2);
         matrix.fromAxisAngle(_arg_3,_arg_4);
         if(_arg_4 < 0)
         {
            _arg_4 = -_arg_4;
         }
         var _local_7:Number = _arg_4;
         while(_local_8 < _arg_5)
         {
            direction.transform3(matrix);
            this.qoci(_arg_1,direction,_local_7,_arg_6);
            _local_8++;
            _local_7 += _arg_4;
         }
      }
      
      private function zufabyfiv(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         this.cupy = null;
         if(this.wazuk == 0)
         {
            _arg_1.copy(_arg_2);
         }
      }
   }
}

