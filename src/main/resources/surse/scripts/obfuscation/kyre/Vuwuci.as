package obfuscation.kyre
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.CollisionShape;
   import alternativa.physics.collision.primitives.CollisionBox;
   
   public class Vuwuci
   {
      
      public var id:int;
      
      public var body:Body;
      
      public var paqu:CollisionBox;
      
      public var dusiruv:Vector.<CollisionShape> = new Vector.<CollisionShape>();
      
      public var coruziva:Boolean;
      
      public var vopuruce:Vector.<Body> = new Vector.<Body>();
      
      public var lurivih:Boolean;
      
      public var gib:Vector3 = new Vector3();
      
      public var wevotus:Number = 0;
      
      private var corabes:Kysusufyk;
      
      public function Vuwuci(_arg_1:Body)
      {
         super();
         this.body = _arg_1;
      }
      
      public function bolifi() : void
      {
         this.corabes = new Kysusufyk(this);
      }
      
      public function qiw() : Boolean
      {
         return this.vopuruce.length > 0;
      }
      
      public function destroy() : void
      {
         this.corabes = null;
         this.body = null;
         this.dusiruv = null;
         this.vopuruce = null;
      }
      
      public function wuqevylov() : void
      {
         this.corabes.wuqevylov();
      }
      
      public function gikemad() : Boolean
      {
         return this.corabes.gikemad();
      }
      
      public function qycehy() : Boolean
      {
         return this.corabes.qycehy();
      }
      
      public function lidelej() : Boolean
      {
         return this.corabes.lidelej();
      }
      
      public function ruf() : Boolean
      {
         return this.corabes.ruf();
      }
   }
}

