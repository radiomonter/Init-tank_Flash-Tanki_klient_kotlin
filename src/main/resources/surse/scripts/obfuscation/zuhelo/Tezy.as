package obfuscation.zuhelo
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.battle.objects.tank.Nun;
   
   public class Tezy
   {
      
      public const suveju:Vector3 = new Vector3();
      
      public var collisionGroup:int;
      
      public var hydatiwu:Boolean = false;
      
      public var fawevotoj:RayHit = new RayHit();
      
      public var bonaqija:Number = 0;
      
      public var speed:Number = 0;
      
      private var body:Body;
      
      private var origin:Vector3 = new Vector3();
      
      private var direction:Vector3 = new Vector3();
      
      private var keqadu:Karysud;
      
      private var kopyman:Vector3 = new Vector3();
      
      private var bikyza:Vector3 = new Vector3();
      
      private var nozomog:Number = 0;
      
      private var poz:Wuwama;
      
      public function Tezy(_arg_1:Body, _arg_2:Vector3, _arg_3:Vector3, _arg_4:Karysud)
      {
         super();
         this.body = _arg_1;
         this.origin.copy(_arg_2);
         this.direction.copy(_arg_3);
         this.keqadu = _arg_4;
         this.poz = new Wuwama(_arg_1);
      }
      
      public function update(_arg_1:Number) : void
      {
         this.raycast();
         if(this.hydatiwu)
         {
            this.wuvikizym(_arg_1);
            this.fefy();
         }
      }
      
      private function raycast() : void
      {
         var _local_1:Matrix3 = this.body.baseMatrix;
         this.bikyza.x = _local_1.m00 * this.direction.x + _local_1.m01 * this.direction.y + _local_1.m02 * this.direction.z;
         this.bikyza.y = _local_1.m10 * this.direction.x + _local_1.m11 * this.direction.y + _local_1.m12 * this.direction.z;
         this.bikyza.z = _local_1.m20 * this.direction.x + _local_1.m21 * this.direction.y + _local_1.m22 * this.direction.z;
         var _local_2:Vector3 = this.body.state.position;
         this.kopyman.x = _local_1.m00 * this.origin.x + _local_1.m01 * this.origin.y + _local_1.m02 * this.origin.z;
         this.kopyman.y = _local_1.m10 * this.origin.x + _local_1.m11 * this.origin.y + _local_1.m12 * this.origin.z;
         this.kopyman.z = _local_1.m20 * this.origin.x + _local_1.m21 * this.origin.y + _local_1.m22 * this.origin.z;
         this.kopyman.x += _local_2.x;
         this.kopyman.y += _local_2.y;
         this.kopyman.z += _local_2.z;
         if(this.hydatiwu)
         {
            this.nozomog = this.keqadu.qagipi - this.fawevotoj.t;
         }
         this.hydatiwu = this.body.scene.collisionDetector.raycast(this.kopyman,this.bikyza,this.collisionGroup,this.keqadu.qagipi,this.poz,this.fawevotoj);
         if(this.hydatiwu)
         {
            this.hydatiwu = this.fawevotoj.normal.z > Nun.ferecojih;
         }
      }
      
      public function wuvikizym(_arg_1:Number) : void
      {
         var _local_2:Number = this.keqadu.qagipi - this.fawevotoj.t;
         this.bonaqija = this.keqadu.zur * _local_2;
         var _local_3:Number = (_local_2 - this.nozomog) / _arg_1;
         this.bonaqija += _local_3 * this.keqadu.dampingCoeff;
         if(this.bonaqija < 0)
         {
            this.bonaqija = 0;
         }
      }
      
      private function fefy() : void
      {
         var _local_1:Vector3 = null;
         var _local_2:Vector3 = null;
         var _local_3:Vector3 = null;
         var _local_4:Vector3 = null;
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         var _local_7:Number = NaN;
         var _local_8:Body = this.fawevotoj.shape.body;
         if(_local_8.tank != null)
         {
            _local_1 = _local_8.state.position;
            _local_2 = _local_8.state.velocity;
            _local_3 = _local_8.state.angularVelocity;
            _local_4 = this.fawevotoj.position;
            _local_5 = _local_4.x - _local_1.x;
            _local_6 = _local_4.y - _local_1.y;
            _local_7 = _local_4.z - _local_1.z;
            this.suveju.x = _local_3.y * _local_7 - _local_3.z * _local_6;
            this.suveju.y = _local_3.z * _local_5 - _local_3.x * _local_7;
            this.suveju.z = _local_3.x * _local_6 - _local_3.y * _local_5;
            this.suveju.x += _local_2.x;
            this.suveju.y += _local_2.y;
            this.suveju.z += _local_2.z;
         }
         else
         {
            this.suveju.x = 0;
            this.suveju.y = 0;
            this.suveju.z = 0;
         }
      }
      
      public function dopicow() : Vector3
      {
         return this.kopyman;
      }
      
      public function luteq() : Vector3
      {
         return this.bikyza;
      }
      
      public function hep() : Vector3
      {
         return this.origin;
      }
   }
}

