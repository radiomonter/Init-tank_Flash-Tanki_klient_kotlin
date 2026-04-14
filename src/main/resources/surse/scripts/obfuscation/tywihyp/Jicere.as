package obfuscation.tywihyp
{
   import alternativa.engine3d.primitives.Box;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarInt;
   import alternativa.tanks.battle.BattleService;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   
   public class Jicere
   {
      
      [Inject]
      public static var battleService:BattleService;
      
      private static var bubyj:ConsoleVarInt = new ConsoleVarInt("targeting_debug",0,0,1);
      
      private var miqolirim:Vector.<Box> = new Vector.<Box>();
      
      private var ziko:Vector3 = new Vector3();
      
      private var kifotabim:Vector3 = new Vector3();
      
      private var myzusedit:Matrix3 = new Matrix3();
      
      public function Jicere()
      {
         super();
      }
      
      public function reset() : void
      {
      }
      
      public function garugyp(_arg_1:AllGlobalGunParams, _arg_2:Vector3, _arg_3:Number, _arg_4:Vector3 = null) : void
      {
      }
      
      private function gazewa(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:uint = 65535) : Box
      {
         return null;
      }
   }
}

