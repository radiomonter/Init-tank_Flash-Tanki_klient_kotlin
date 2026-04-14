package obfuscation.zoniseg
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   
   public class Zoliquju
   {
      
      public static const fonega:Number = -100;
      
      public var vydam:Number = -100;
      
      public var targets:Vector.<Body> = new Vector.<Body>();
      
      public var zedusyqaf:Vector.<Vector3> = new Vector.<Vector3>();
      
      public var lozybom:Vector3 = new Vector3();
      
      public var jej:Vector3 = new Vector3();
      
      public var hasStaticHit:Boolean;
      
      public var zal:int;
      
      public function Zoliquju()
      {
         super();
      }
      
      public function clear() : void
      {
         this.targets.length = 0;
         this.zedusyqaf.length = 0;
         this.vydam = fonega;
         this.hasStaticHit = false;
         this.zal = 0;
      }
      
      public function zor(_arg_1:Vector3, _arg_2:Vector3) : void
      {
         this.lozybom.copy(_arg_1);
         this.jej.copy(_arg_2);
         this.hasStaticHit = true;
      }
      
      public function qipulen(_arg_1:Body, _arg_2:Vector3) : void
      {
         this.targets.push(_arg_1);
         this.zedusyqaf.push(_arg_2);
      }
      
      public function nujilezy(_arg_1:Body, _arg_2:Vector3) : void
      {
         this.qipulen(_arg_1,_arg_2);
         ++this.zal;
      }
      
      public function juj() : Boolean
      {
         return this.targets.length > this.zal;
      }
   }
}

