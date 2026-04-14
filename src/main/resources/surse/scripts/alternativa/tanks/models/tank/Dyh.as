package alternativa.tanks.models.tank
{
   import alternativa.osgi.OSGi;
   import alternativa.tanks.battle.BattleRunnerProvider;
   import alternativa.tanks.battle.PostPhysicsController;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.utils.EncryptedInt;
   import alternativa.tanks.utils.EncryptedIntImpl;
   import alternativa.tanks.utils.MathUtils;
   
   public class Dyh extends BattleRunnerProvider implements PostPhysicsController
   {
      
      private static const vynezyref:EncryptedInt = new EncryptedIntImpl(2000);
      
      private static const semo:Number = Math.PI / 6;
      
      private var tank:Tank;
      
      private var cuhom:int;
      
      private var supyci:Number;
      
      public function Dyh(_arg_1:Tank)
      {
         super();
         this.tank = _arg_1;
      }
      
      public function reset() : void
      {
         this.cuhom = fahysemas().hulivyjam();
         this.supyci = this.tank.zoju();
      }
      
      public function jatil(_arg_1:Number) : void
      {
         if(this.wucycup())
         {
            this.dalydul(false);
         }
         else if(this.soqydyna())
         {
            this.dalydul(true);
         }
      }
      
      private function wucycup() : Boolean
      {
         return this.ryluba();
      }
      
      private function soqydyna() : Boolean
      {
         return this.kimef();
      }
      
      private function kimef() : Boolean
      {
         var _local_1:Number = Math.abs(MathUtils.clampAngle(this.tank.zoju() - this.supyci));
         return _local_1 > semo;
      }
      
      private function ryluba() : Boolean
      {
         return fahysemas().hulivyjam() - this.cuhom > vynezyref.getInt();
      }
      
      private function dalydul(_arg_1:Boolean) : void
      {
         this.reset();
         TankModel(OSGi.getInstance().getService(ITankModel)).onTurretDirectionCorrection(_arg_1);
      }
   }
}

