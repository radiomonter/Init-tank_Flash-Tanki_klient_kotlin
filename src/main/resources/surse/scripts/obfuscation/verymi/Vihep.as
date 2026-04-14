package obfuscation.verymi
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.osgi.service.console.variables.ConsoleVarFloat;
   import alternativa.osgi.service.console.variables.ConsoleVarInt;
   import alternativa.tanks.battle.objects.tank.Tank;
   import alternativa.tanks.camera.Kaweras;
   import alternativa.tanks.camera.Rabysame;
   
   public class Vihep implements Kaweras
   {
      
      private static var pabygifit:ConsoleVarFloat;
      
      private static var mumulyc:ConsoleVarFloat;
      
      private static var tihu:ConsoleVarFloat;
      
      private static var duration:ConsoleVarInt;
      
      private static var m1:Matrix3 = new Matrix3();
      
      private static var wyvavez:Matrix3 = new Matrix3();
      
      private static var axis:Vector3 = new Vector3();
      
      private var sign:int;
      
      private var time:int;
      
      private var tank:Tank;
      
      public function Vihep()
      {
         super();
      }
      
      public static function murybyliw() : void
      {
         pabygifit = new ConsoleVarFloat("minecam_ampl",0,-10000,10000);
         mumulyc = new ConsoleVarFloat("minecam_yaw",-0.02,-10,10);
         tihu = new ConsoleVarFloat("minecam_roll",0.03,-10,10);
         duration = new ConsoleVarInt("minecam_time",800,0,10000);
      }
      
      public function update(_arg_1:int, _arg_2:int, _arg_3:Vector3, _arg_4:Vector3) : Boolean
      {
         if(_arg_1 - this.time > duration.value)
         {
            return false;
         }
         return true;
      }
      
      public function kafi(_arg_1:Rabysame) : void
      {
      }
      
      public function destroy() : void
      {
      }
   }
}

