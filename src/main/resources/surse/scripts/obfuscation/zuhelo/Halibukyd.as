package obfuscation.zuhelo
{
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.BattleUtils;
   
   public class Halibukyd
   {
      
      public const rumejehy:Vector3 = new Vector3();
      
      public var body:Body;
      
      public var racycac:Vector.<Tezy>;
      
      public var gavime:int;
      
      public var legugequp:int;
      
      public var keqadu:Karysud;
      
      public var mugylyvef:Number = 0;
      
      public var dufe:int;
      
      public function Halibukyd(_arg_1:Body, _arg_2:int, _arg_3:Vector3, _arg_4:Number, _arg_5:Karysud, _arg_6:int)
      {
         super();
         this.body = _arg_1;
         this.dufe = _arg_6;
         this.rusujo(_arg_2,_arg_3,_arg_4,_arg_5);
      }
      
      private function rusujo(_arg_1:int, _arg_2:Vector3, _arg_3:Number, _arg_4:Karysud) : void
      {
         var _local_5:Vector3 = null;
         var _local_7:int = 0;
         this.gavime = _arg_1;
         this.keqadu = _arg_4;
         this.racycac = new Vector.<Tezy>(_arg_1);
         var _local_6:Number = _arg_3 / (_arg_1 - 1);
         while(_local_7 < _arg_1)
         {
            _local_5 = new Vector3(_arg_2.x,_arg_2.y + 0.5 * _arg_3 - _local_7 * _local_6,_arg_2.z);
            this.racycac[_local_7] = new Tezy(this.body,_local_5,Vector3.DOWN,_arg_4);
            _local_7++;
         }
      }
      
      public function vusany(_arg_1:int) : void
      {
         var _local_2:int = 0;
         while(_local_2 < this.gavime)
         {
            Tezy(this.racycac[_local_2]).collisionGroup = _arg_1;
            _local_2++;
         }
      }
      
      public function coruziva() : Boolean
      {
         var _local_1:Tezy = null;
         for each(_local_1 in this.racycac)
         {
            if(_local_1.hydatiwu && !BattleUtils.pote(_local_1.fawevotoj.shape.body))
            {
               return true;
            }
         }
         return false;
      }
      
      public function lejokohyr(_arg_1:Number) : void
      {
         var _local_2:Tezy = null;
         var _local_7:int = 0;
         var _local_3:Number = NaN;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         this.legugequp = 0;
         this.rumejehy.x = 0;
         this.rumejehy.y = 0;
         this.rumejehy.z = 0;
         var _local_6:Vector3 = this.body.state.velocity;
         while(_local_7 < this.gavime)
         {
            _local_2 = this.racycac[_local_7];
            _local_2.update(_arg_1);
            if(_local_2.hydatiwu)
            {
               ++this.legugequp;
               this.body.addWorldForceScaled(_local_2.dopicow(),_local_2.luteq(),-_local_2.bonaqija);
               this.rumejehy.x += _local_2.suveju.x;
               this.rumejehy.y += _local_2.suveju.y;
               this.rumejehy.z += _local_2.suveju.z;
               _local_3 = _local_6.x - _local_2.suveju.x;
               _local_4 = _local_6.y - _local_2.suveju.y;
               _local_5 = _local_6.z - _local_2.suveju.z;
               _local_2.speed = Math.sqrt(_local_3 * _local_3 + _local_4 * _local_4 + _local_5 * _local_5);
            }
            else
            {
               _local_2.speed = 0;
            }
            _local_7++;
         }
         if(this.legugequp > 1)
         {
            this.rumejehy.x /= this.legugequp;
            this.rumejehy.y /= this.legugequp;
            this.rumejehy.z /= this.legugequp;
         }
      }
      
      public function juwolyzys(_arg_1:Number, _arg_2:Number) : void
      {
         var _local_3:Number = NaN;
         if(this.mugylyvef < _arg_1)
         {
            _local_3 = this.mugylyvef + _arg_2;
            this.mugylyvef = _local_3 > _arg_1 ? Number(_arg_1) : Number(_local_3);
         }
         else if(this.mugylyvef > _arg_1)
         {
            _local_3 = this.mugylyvef - _arg_2;
            this.mugylyvef = _local_3 < _arg_1 ? Number(_arg_1) : Number(_local_3);
         }
      }
   }
}

