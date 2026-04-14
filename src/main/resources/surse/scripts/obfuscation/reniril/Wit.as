package obfuscation.reniril
{
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.BattleUtils;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapons.targeting.priority.Fylem;
   import obfuscation.megogi.Jyzeqet;
   import obfuscation.qejoqa.Lyd;
   
   public class Wit
   {
      
      private const ragezywu:int = 16;
      
      private var hetygovuh:Fylem;
      
      private var matrix:Matrix3 = new Matrix3();
      
      private var direction:Vector3 = new Vector3();
      
      private var sydu:Vector.<Jyzeqet> = new Vector.<Jyzeqet>();
      
      private var nado:Nuq = new Nuq();
      
      public function Wit(_arg_1:Fylem)
      {
         super();
         this.hetygovuh = _arg_1;
      }
      
      public function vuvesyli(_arg_1:AllGlobalGunParams, _arg_2:Vector.<Lyd>) : Vector.<Jyzeqet>
      {
         var _local_3:Lyd = null;
         var _local_4:Number = NaN;
         var _local_5:Number = NaN;
         var _local_6:Number = Number.NEGATIVE_INFINITY;
         this.sydu.length = 0;
         this.nado.clear();
         for each(_local_3 in _arg_2)
         {
            _local_4 = _local_3.gah();
            while(!this.nado.isEmpty() && _local_6 < _local_4)
            {
               _local_5 = Math.min(this.nado.dopewiqi(),_local_4);
               this.piwoqyb(_arg_1,_local_6,_local_5);
               this.nado.setosohuj(_local_5);
               _local_6 = _local_5;
            }
            _local_6 = _local_4;
            this.nado.add(_local_3);
         }
         while(!this.nado.isEmpty())
         {
            _local_5 = this.nado.dopewiqi();
            this.piwoqyb(_arg_1,_local_6,_local_5);
            this.nado.setosohuj(_local_5);
            _local_6 = _local_5;
         }
         return this.sydu;
      }
      
      private function piwoqyb(_arg_1:AllGlobalGunParams, _arg_2:Number, _arg_3:Number) : void
      {
         var _local_4:Vector3 = null;
         var _local_9:int = 0;
         var _local_5:Number = _arg_3 - _arg_2;
         var _local_6:Number = _local_5 / this.ragezywu;
         var _local_7:Number = _arg_2 + _local_6 * 0.5;
         var _local_8:Vector.<Lyd> = this.nado.miw();
         this.matrix.fromAxisAngle(_arg_1.navi,_local_7);
         this.matrix.transformVector(_arg_1.direction,this.direction);
         this.matrix.fromAxisAngle(_arg_1.navi,_local_6);
         while(_local_9 < this.ragezywu)
         {
            this.sydu.push(new Jyzeqet(this.direction,_local_7,this.hetygovuh.weme(_local_7,_local_8)));
            _local_4 = BattleUtils.vemoleg;
            _local_4.copy(this.direction);
            this.matrix.transformVector(_local_4,this.direction);
            _local_7 += _local_6;
            _local_9++;
         }
         if(_arg_2 <= 0 && 0 <= _arg_3)
         {
            this.sydu.push(new Jyzeqet(_arg_1.direction,0,this.hetygovuh.weme(0,_local_8)));
         }
      }
   }
}

