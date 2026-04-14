package obfuscation.migyqis
{
   import alternativa.object.ClientObject;
   import obfuscation.kofen.Vector3d;
   
   public class Jaquz
   {
      
      private var _direction:Vector3d;
      
      private var loq:Vector3d;
      
      private var fihy:int;
      
      private var _target:ClientObject;
      
      public function Jaquz(_arg_1:Vector3d = null, _arg_2:Vector3d = null, _arg_3:int = 0, _arg_4:ClientObject = null)
      {
         super();
         this._direction = _arg_1;
         this.loq = _arg_2;
         this.fihy = _arg_3;
         this._target = _arg_4;
      }
      
      public function get direction() : Vector3d
      {
         return this._direction;
      }
      
      public function set direction(_arg_1:Vector3d) : void
      {
         this._direction = _arg_1;
      }
      
      public function get localHitPoint() : Vector3d
      {
         return this.loq;
      }
      
      public function set localHitPoint(_arg_1:Vector3d) : void
      {
         this.loq = _arg_1;
      }
      
      public function get guqo() : int
      {
         return this.fihy;
      }
      
      public function set guqo(_arg_1:int) : void
      {
         this.fihy = _arg_1;
      }
      
      public function get target() : ClientObject
      {
         return this._target;
      }
      
      public function set target(_arg_1:ClientObject) : void
      {
         this._target = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "TargetHit [";
         _local_1 += "direction = " + this.direction + " ";
         _local_1 += "localHitPoint = " + this.localHitPoint + " ";
         _local_1 += "numberHits = " + this.guqo + " ";
         _local_1 += "target = " + this.target + " ";
         return _local_1 + "]";
      }
   }
}

