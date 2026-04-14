package obfuscation.facod
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionDetector;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.models.weapon.shared.Zicoha;
   import alternativa.tanks.utils.objectpool.Pool;
   import flash.errors.IllegalOperationError;
   import obfuscation.kyre.Myw;
   
   public class Fiwugowyr extends Jybawabaz
   {
      
      private static const danilice:Vector3 = new Vector3();
      
      public function Fiwugowyr(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      override protected function update(_arg_1:Number) : void
      {
         var _local_2:Boolean = false;
         var _local_3:Body = null;
         var _local_4:Vector3 = null;
         var _local_7:int = 0;
         this.nibovif(_arg_1);
         danilice.diff(lunyde,loned);
         var _local_5:Number = danilice.length();
         danilice.normalize();
         var _local_6:CollisionDetector = battleService.getBattleRunner().soc();
         if(_local_6.raycast(loned,danilice,Myw.WEAPON,_local_5,this,verumonuv))
         {
            _local_2 = BattleUtils.pote(verumonuv.shape.body) && !Zicoha.fyfujuwub(loned,verumonuv.position);
            cotosane.copy(verumonuv.position);
            if(_local_2)
            {
               _local_3 = verumonuv.shape.body;
            }
            else
            {
               _local_3 = null;
               cotosane.subtract(danilice);
            }
            pawa(_local_3,cotosane,danilice,_local_5);
            return;
         }
         while(_local_7 < mujid())
         {
            _local_4 = nisebi[_local_7];
            if(_local_6.raycast(_local_4,danilice,Myw.WEAPON,_local_5,this,verumonuv))
            {
               if(BattleUtils.pote(verumonuv.shape.body))
               {
                  if(!Zicoha.fyfujuwub(loned,verumonuv.position))
                  {
                     cotosane.copy(loned).addScaled(verumonuv.t,danilice);
                     pawa(verumonuv.shape.body,cotosane,danilice,_local_5);
                     return;
                  }
               }
            }
            _local_4.addScaled(_local_5,danilice);
            _local_7++;
         }
         dynihe.updateState(lunyde,gowoziru);
         this.dudytu(_arg_1);
         if(this.lefy())
         {
            this.qocudup();
         }
      }
      
      override protected function zasesono(_arg_1:Body, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Number, _arg_5:int) : void
      {
         dynihe.updateState(_arg_2,_arg_3,_arg_5);
      }
      
      protected function dudytu(_arg_1:Number) : void
      {
         segelehe += _arg_1 * this.vuq();
      }
      
      protected function qocudup() : void
      {
         destroy();
      }
      
      protected function lefy() : Boolean
      {
         return segelehe > this.rywycahe();
      }
      
      protected function rywycahe() : Number
      {
         return Number.MAX_VALUE;
      }
      
      protected function vuq() : Number
      {
         throw new IllegalOperationError();
      }
      
      protected function nibovif(_arg_1:Number) : void
      {
         loned.copy(lunyde);
         lunyde.addScaled(this.vuq() * _arg_1,gowoziru);
      }
   }
}

