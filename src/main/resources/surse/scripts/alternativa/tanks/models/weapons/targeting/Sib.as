package alternativa.tanks.models.weapons.targeting
{
   import alternativa.math.Vector3;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.BattleUtils;
   
   public class Sib
   {
      
      private var direction:Vector3 = new Vector3();
      
      private var staticHit:RayHit;
      
      private var tegihyp:Vector.<RayHit>;
      
      public function Sib()
      {
         super();
      }
      
      public function hasStaticHit() : Boolean
      {
         return this.staticHit != null;
      }
      
      public function telyfen() : RayHit
      {
         return this.staticHit;
      }
      
      public function jesenebo() : Vector3
      {
         return this.direction;
      }
      
      public function pyn() : Vector.<RayHit>
      {
         return this.tegihyp;
      }
      
      public function zoma() : Boolean
      {
         return this.tegihyp.length > 0;
      }
      
      public function mosylejib() : Boolean
      {
         return this.staticHit != null || this.tegihyp.length > 0;
      }
      
      public function pibyli(_arg_1:Vector3, _arg_2:Vector.<RayHit>) : void
      {
         var _local_3:RayHit = null;
         this.direction.copy(_arg_1);
         this.tegihyp = _arg_2.concat();
         this.staticHit = null;
         if(this.tegihyp.length > 0)
         {
            _local_3 = this.tegihyp[this.tegihyp.length - 1];
            if(!BattleUtils.pote(_local_3.shape.body))
            {
               this.staticHit = this.tegihyp.pop();
            }
         }
      }
      
      public function dopuneq() : RayHit
      {
         if(this.staticHit != null)
         {
            return this.staticHit;
         }
         return this.tegihyp[0];
      }
   }
}

