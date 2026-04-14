package obfuscation.ligy
{
   import obfuscation.kofen.Vector3d;
   
   public class Wynid
   {
      
      private var _id:int;
      
      private var _name:String;
      
      private var _position:Vector3d;
      
      private var _score:Number;
      
      private var hurugy:Number;
      
      private var _state:Zyjova;
      
      private var bocytaw:Vector.<String>;
      
      public function Wynid(_arg_1:int = 0, _arg_2:String = null, _arg_3:Vector3d = null, _arg_4:Number = 0, _arg_5:Number = 0, _arg_6:Zyjova = null, _arg_7:Vector.<String> = null)
      {
         super();
         this._id = _arg_1;
         this._name = _arg_2;
         this._position = _arg_3;
         this._score = _arg_4;
         this.hurugy = _arg_5;
         this._state = _arg_6;
         this.bocytaw = _arg_7;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set id(_arg_1:int) : void
      {
         this._id = _arg_1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(_arg_1:String) : void
      {
         this._name = _arg_1;
      }
      
      public function get position() : Vector3d
      {
         return this._position;
      }
      
      public function set position(_arg_1:Vector3d) : void
      {
         this._position = _arg_1;
      }
      
      public function get score() : Number
      {
         return this._score;
      }
      
      public function set score(_arg_1:Number) : void
      {
         this._score = _arg_1;
      }
      
      public function get vahe() : Number
      {
         return this.hurugy;
      }
      
      public function set vahe(_arg_1:Number) : void
      {
         this.hurugy = _arg_1;
      }
      
      public function get state() : Zyjova
      {
         return this._state;
      }
      
      public function set state(_arg_1:Zyjova) : void
      {
         this._state = _arg_1;
      }
      
      public function get myhybumo() : Vector.<String>
      {
         return this.bocytaw;
      }
      
      public function set myhybumo(_arg_1:Vector.<String>) : void
      {
         this.bocytaw = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "ClientPointData [";
         _local_1 += "id = " + this.id + " ";
         _local_1 += "name = " + this.name + " ";
         _local_1 += "position = " + this.position + " ";
         _local_1 += "score = " + this.score + " ";
         _local_1 += "scoreChangeRate = " + this.vahe + " ";
         _local_1 += "state = " + this.state + " ";
         _local_1 += "tankIds = " + this.myhybumo + " ";
         return _local_1 + "]";
      }
   }
}

