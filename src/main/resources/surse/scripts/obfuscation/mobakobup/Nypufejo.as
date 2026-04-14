package obfuscation.mobakobup
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapons.targeting.Sib;
   
   public class Nypufejo
   {
      
      public var distance:Number;
      
      public var body:Body;
      
      public var position:Vector3 = new Vector3();
      
      public var direction:Vector3 = new Vector3();
      
      public var normal:Vector3 = new Vector3();
      
      public function Nypufejo()
      {
         super();
      }
      
      public function setResult(_arg_1:AllGlobalGunParams, _arg_2:Sib) : void
      {
         if(_arg_2.mosylejib())
         {
            this.hogu(_arg_1.hiwanu,_arg_2.jesenebo(),_arg_2.dopuneq());
         }
         else
         {
            this.haj(_arg_2.jesenebo());
         }
      }
      
      private function hogu(_arg_1:Vector3, _arg_2:Vector3, _arg_3:RayHit) : void
      {
         this.distance = _arg_3.t;
         this.body = _arg_3.shape.body;
         this.normal.copy(_arg_3.normal);
         this.direction.copy(_arg_2);
         this.position.copy(_arg_1).addScaled(_arg_3.t,_arg_2);
      }
      
      private function haj(_arg_1:Vector3) : void
      {
         this.direction.copy(_arg_1);
         this.body = null;
      }
   }
}

