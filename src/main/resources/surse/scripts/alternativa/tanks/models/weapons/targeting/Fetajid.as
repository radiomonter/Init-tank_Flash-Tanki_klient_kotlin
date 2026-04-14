package alternativa.tanks.models.weapons.targeting
{
   import alternativa.physics.collision.types.RayHit;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import alternativa.tanks.models.weapons.targeting.priority.Fylem;
   import obfuscation.kajiz.Locit;
   import obfuscation.megogi.Diz;
   import obfuscation.megogi.Jyzeqet;
   import obfuscation.tywihyp.Jicere;
   
   public class Fetajid
   {
      
      private static const wodelys:Jicere = new Jicere();
      
      private var jele:Diz;
      
      private var kisasi:Fylem;
      
      private var ryqamej:Locit;
      
      private var result:Sib = new Sib();
      
      public function Fetajid(_arg_1:Diz, _arg_2:Locit, _arg_3:Fylem)
      {
         super();
         this.jele = _arg_1;
         this.ryqamej = _arg_2;
         this.kisasi = _arg_3;
      }
      
      public function fojy() : Locit
      {
         return this.ryqamej;
      }
      
      public function target(_arg_1:AllGlobalGunParams) : Sib
      {
         var _local_2:Jyzeqet = null;
         var _local_3:Vector.<RayHit> = null;
         var _local_4:Number = NaN;
         var _local_5:Vector.<Jyzeqet> = this.jele.javacydel(_arg_1);
         _local_5.push(new Jyzeqet(_arg_1.direction,0,0));
         _local_5.sort(Jyzeqet.comparator);
         var _local_6:Number = Number.NEGATIVE_INFINITY;
         wodelys.reset();
         for each(_local_2 in _local_5)
         {
            if(_local_2.bid() < _local_6)
            {
               break;
            }
            _local_3 = this.ryqamej.quty(_arg_1,_local_2.jesenebo());
            _local_4 = this.kisasi.wacezu(_local_2.qytewesa(),_local_3);
            if(_local_4 > 0)
            {
               _local_4 += _local_2.cyjoseco();
            }
            if(_local_4 > _local_6 || _local_4 == _local_6 && _local_2.qytewesa() == 0)
            {
               _local_6 = _local_4;
               this.result.pibyli(_local_2.jesenebo(),_local_3);
            }
         }
         return this.result;
      }
   }
}

