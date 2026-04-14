package alternativa.tanks.battle.objects.tank.tankskin
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.physics.Body;
   import alternativa.tanks.battle.objects.tank.Cokunuf;
   import alternativa.tanks.utils.MathUtils;
   import obfuscation.zuhelo.Halibukyd;
   import obfuscation.zuhelo.Havyra;
   import obfuscation.zuhelo.Tezy;
   
   public class TracksAnimator
   {
      
      private static const wononos:Number = 100;
      
      private static const qoqasa:Vector3 = new Vector3();
      
      private var guritow:Havyra;
      
      private var skin:TankSkin;
      
      private var videdohy:Cokunuf;
      
      public function TracksAnimator(_arg_1:Havyra, _arg_2:TankSkin, _arg_3:Cokunuf)
      {
         super();
         this.guritow = _arg_1;
         this.skin = _arg_2;
         this.videdohy = _arg_3;
      }
      
      public function wos(_arg_1:Number) : void
      {
         this.kuhalu(_arg_1);
         this.skin.kogur(_arg_1 * this.guritow.nyleqez.mugylyvef,_arg_1 * this.guritow.wezyqiji.mugylyvef);
      }
      
      private function kuhalu(_arg_1:Number) : void
      {
         this.kifu(this.guritow.nyleqez,_arg_1);
         this.kifu(this.guritow.wezyqiji,_arg_1);
      }
      
      private function kifu(_arg_1:Halibukyd, _arg_2:Number) : void
      {
         if(this.puketu(_arg_1))
         {
            this.bocibyze(_arg_1,_arg_2);
         }
         else
         {
            this.rofekypyr(_arg_1,_arg_2);
         }
      }
      
      private function puketu(_arg_1:Halibukyd) : Boolean
      {
         return _arg_1.body.baseMatrix.m22 > 0 && _arg_1.legugequp > 0;
      }
      
      private function bocibyze(_arg_1:Halibukyd, _arg_2:Number) : void
      {
         var _local_3:Number = NaN;
         var _local_4:Number = this.pawum(_arg_1);
         if(this.nysodezo(_arg_1,_local_4))
         {
            _arg_1.mugylyvef = _local_4;
         }
         else
         {
            _local_3 = this.kol(_arg_1) * wononos;
            _arg_1.juwolyzys(_local_3,this.guritow.domu() * _arg_2);
         }
      }
      
      private function pawum(_arg_1:Halibukyd) : Number
      {
         var _local_2:Vector3 = _arg_1.rumejehy;
         var _local_3:Tezy = _arg_1.racycac[_arg_1.gavime >> 1];
         this.duzodav(_arg_1.body,_local_3.dopicow(),qoqasa);
         var _local_4:Number = qoqasa.x - _local_2.x;
         var _local_5:Number = qoqasa.y - _local_2.y;
         var _local_6:Number = qoqasa.z - _local_2.z;
         var _local_7:Matrix3 = _arg_1.body.baseMatrix;
         return _local_4 * _local_7.m01 + _local_5 * _local_7.m11 + _local_6 * _local_7.m21;
      }
      
      private function duzodav(_arg_1:Body, _arg_2:Vector3, _arg_3:Vector3) : void
      {
         var _local_5:Vector3 = null;
         var _local_4:Number = NaN;
         var _local_6:Vector3 = _arg_1.state.position;
         _local_4 = _arg_2.x - _local_6.x;
         var _local_7:Number = _arg_2.y - _local_6.y;
         var _local_8:Number = _arg_2.z - _local_6.z;
         _local_5 = _arg_1.state.angularVelocity;
         _arg_3.x = _local_5.y * _local_8 - _local_5.z * _local_7;
         _arg_3.y = _local_5.z * _local_4 - _local_5.x * _local_8;
         _arg_3.z = _local_5.x * _local_7 - _local_5.y * _local_4;
         var _local_9:Vector3 = _arg_1.state.velocity;
         _arg_3.x += _local_9.x;
         _arg_3.y += _local_9.y;
         _arg_3.z += _local_9.z;
      }
      
      private function nysodezo(_arg_1:Halibukyd, _arg_2:Number) : Boolean
      {
         var _local_3:Number = this.kol(_arg_1);
         return Math.abs(_arg_2) > 0.8 * wononos || _local_3 == 0 || MathUtils.numberSign(_arg_2,1) * MathUtils.sign(_local_3) == -1;
      }
      
      private function kol(_arg_1:Halibukyd) : Number
      {
         var _local_2:int = this.guritow.labujet();
         var _local_3:int = this.guritow.tynajiz();
         var _local_4:Number = 0;
         if(_local_2 == 0)
         {
            _local_4 = _arg_1.dufe * _local_3 * 0.5;
         }
         else if(_local_3 == 0)
         {
            _local_4 = _local_2;
         }
         else
         {
            _local_4 = _local_2 * (3 + _arg_1.dufe * _local_3) / 4;
         }
         return _local_4;
      }
      
      private function rofekypyr(_arg_1:Halibukyd, _arg_2:Number) : void
      {
         var _local_3:Number = this.kol(_arg_1);
         _arg_1.juwolyzys(_local_3 * this.videdohy.vur(),this.guritow.domu() * _arg_2);
      }
   }
}

