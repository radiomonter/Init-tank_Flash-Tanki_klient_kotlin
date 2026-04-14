package obfuscation.zoniseg
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.models.weapons.targeting.Sib;
   
   public class Gezoriz
   {
      
      public var lozybom:Vector3 = new Vector3();
      
      public var jej:Vector3 = new Vector3();
      
      public var hasStaticHit:Boolean;
      
      public var targets:Vector.<Body> = new Vector.<Body>();
      
      public var zedusyqaf:Vector.<Vector3> = new Vector.<Vector3>();
      
      public var shotDirection:Vector3 = new Vector3();
      
      public function Gezoriz()
      {
         super();
      }
      
      public function dyri(_arg_1:Sib) : void
      {
         var _local_2:RayHit = null;
         var _local_3:RayHit = null;
         if(this.hasStaticHit = _arg_1.hasStaticHit())
         {
            _local_3 = _arg_1.telyfen();
            this.lozybom.copy(_local_3.position);
            this.jej.copy(_local_3.normal);
         }
         this.shotDirection.copy(_arg_1.jesenebo());
         this.targets.length = 0;
         this.zedusyqaf.length = 0;
         for each(_local_2 in _arg_1.pyn())
         {
            this.targets.push(_local_2.shape.body);
            this.zedusyqaf.push(_local_2.position);
         }
      }
      
      public function tozeqage(_arg_1:Zoliquju) : void
      {
         var _local_3:int = 0;
         var _local_2:int = int(_arg_1.targets.length);
         while(_local_3 < _local_2)
         {
            this.targets[_local_3] = _arg_1.targets[_local_3];
            this.zedusyqaf[_local_3] = _arg_1.zedusyqaf[_local_3];
            _local_3++;
         }
         this.targets.length = _local_2;
         this.zedusyqaf.length = _local_2;
         this.hasStaticHit = _arg_1.hasStaticHit;
         if(this.hasStaticHit)
         {
            this.lozybom.copy(_arg_1.lozybom);
            this.jej.copy(_arg_1.jej);
         }
      }
      
      public function zor(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         this.hasStaticHit = true;
         this.lozybom.copy(_arg_1);
         this.jej.copy(_arg_2);
      }
      
      public function revehaw() : Vector3
      {
         return !this.hasStaticHit ? null : this.lozybom;
      }
   }
}

