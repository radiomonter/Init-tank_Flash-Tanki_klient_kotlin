package obfuscation.lokofobiv
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.Trigger;
   import alternativa.tanks.battle.objects.tank.ClientTankState;
   import alternativa.tanks.battle.objects.tank.Tank;
   import obfuscation.kyre.Myw;
   import obfuscation.kyre.TanksCollisionDetector;
   
   public class Tenonykaj implements Trigger
   {
      
      private static const fawevotoj:RayHit = new RayHit();
      
      private var center:Vector3;
      
      private var veped:Feh;
      
      private var moguh:Number;
      
      private var givi:Boolean;
      
      private var nenif:Number;
      
      private var bileniwan:Boolean;
      
      private var kumi:int;
      
      private var pih:Number;
      
      private var collisionDetector:TanksCollisionDetector;
      
      public function Tenonykaj(_arg_1:Vector3, _arg_2:Number, _arg_3:Number, _arg_4:int, _arg_5:Feh, _arg_6:TanksCollisionDetector, _arg_7:Number)
      {
         super();
         this.center = _arg_1;
         this.moguh = _arg_2;
         this.kumi = _arg_4;
         this.veped = _arg_5;
         this.nenif = _arg_3;
         this.collisionDetector = _arg_6;
         this.pih = _arg_7;
      }
      
      public function reset() : void
      {
         this.givi = false;
         this.bileniwan = false;
      }
      
      public function checkTrigger(_arg_1:Body) : void
      {
         var _local_2:Vector3 = null;
         var _local_3:Tank = _arg_1.tank;
         if(_local_3.tankData.spawnState == ClientTankState.neqahi)
         {
            _local_2 = _arg_1.state.position;
            this.sos(_local_2);
            this.vuso(_local_2);
         }
         else
         {
            if(this.givi)
            {
               this.givi = false;
               this.veped.fyf(this.kumi);
            }
            if(this.bileniwan)
            {
               this.bileniwan = false;
               this.veped.vis(this.kumi);
            }
         }
      }
      
      private function sos(_arg_1:Vector3) : void
      {
         var _local_2:Number = Vector3.distanceBetween(_arg_1,this.center);
         if(this.givi)
         {
            if(_local_2 > this.moguh || !this.vatujofu(_arg_1))
            {
               this.givi = false;
               this.veped.fyf(this.kumi);
            }
         }
         else if(_local_2 <= this.moguh && this.vatujofu(_arg_1))
         {
            this.givi = true;
            this.veped.hikime(this.kumi);
         }
      }
      
      private function vuso(_arg_1:Vector3) : void
      {
         var _local_2:Number = _arg_1.distanceToXY(this.center);
         if(this.bileniwan)
         {
            if(_local_2 > this.nenif || !this.myqugu(_arg_1))
            {
               this.bileniwan = false;
               this.veped.vis(this.kumi);
            }
         }
         else if(_local_2 <= this.nenif && this.myqugu(_arg_1))
         {
            this.bileniwan = true;
            this.veped.riwasumod(this.kumi);
         }
      }
      
      private function vatujofu(_arg_1:Vector3) : Boolean
      {
         var _local_2:Vector3 = new Vector3(this.center.x,this.center.y,this.center.z + this.pih);
         var _local_3:Vector3 = _arg_1.clone().subtract(_local_2);
         return !this.collisionDetector.raycastStatic(_local_2,_local_3,Myw.dyhan,1,null,fawevotoj);
      }
      
      private function myqugu(_arg_1:Vector3) : Boolean
      {
         var _local_2:Vector3 = null;
         var _local_3:Vector3 = null;
         var _local_4:Vector3 = null;
         _local_2 = new Vector3(this.center.x,this.center.y,this.center.z + this.pih);
         if(this.collisionDetector.raycastStatic(_arg_1,Vector3.DOWN,Myw.dyhan,10000000000,null,fawevotoj))
         {
            _local_3 = fawevotoj.position;
            _local_3.z += 0.1;
            _local_4 = _local_3.subtract(_local_2);
            return !this.collisionDetector.raycastStatic(_local_2,_local_4,Myw.dyhan,1,null,fawevotoj);
         }
         return false;
      }
   }
}

