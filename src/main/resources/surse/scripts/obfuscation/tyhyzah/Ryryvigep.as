package obfuscation.tyhyzah
{
   import alternativa.math.Vector3;
   import alternativa.tanks.models.weapon.AllGlobalGunParams;
   import obfuscation.megogi.Diz;
   import obfuscation.megogi.Jyzeqet;
   
   public class Ryryvigep implements Diz
   {
      
      private const vyzebeqep:int = 11;
      
      private var suvomyr:Vector3 = new Vector3();
      
      private var hijubuto:Vector3 = new Vector3();
      
      private var angle:Number;
      
      private var screenSize:Number;
      
      private var mefumy:Vector3;
      
      public function Ryryvigep(_arg_1:Number)
      {
         super();
         this.angle = _arg_1 / 2;
         this.screenSize = Math.tan(this.angle) * 2;
      }
      
      public function ryzyvu(_arg_1:Vector3) : void
      {
         this.mefumy = _arg_1;
      }
      
      public function joqenet() : void
      {
         this.mefumy = null;
      }
      
      public function javacydel(_arg_1:AllGlobalGunParams) : Vector.<Jyzeqet>
      {
         var _local_3:int = 0;
         var _local_8:int = 0;
         var _local_2:Number = NaN;
         var _local_4:Number = NaN;
         this.suvomyr.cross2(_arg_1.navi,_arg_1.direction);
         var _local_5:Vector.<Jyzeqet> = new Vector.<Jyzeqet>();
         var _local_6:Number = this.screenSize / (this.vyzebeqep - 1);
         var _local_7:Number = -this.screenSize * 0.5;
         while(_local_8 < this.vyzebeqep)
         {
            _local_2 = -this.screenSize * 0.5;
            _local_3 = 0;
            while(_local_3 < this.vyzebeqep)
            {
               this.hijubuto.copy(_arg_1.direction);
               this.hijubuto.addScaled(_local_7,this.suvomyr);
               this.hijubuto.addScaled(_local_2,_arg_1.navi);
               this.hijubuto.normalize();
               _local_4 = Math.acos(this.hijubuto.dot(_arg_1.direction));
               if(_local_4 <= this.angle)
               {
                  _local_5.push(new Jyzeqet(this.hijubuto,_local_4,Number.MAX_VALUE));
               }
               _local_2 += _local_6;
               _local_3++;
            }
            _local_7 += _local_6;
            _local_8++;
         }
         if(this.mefumy != null)
         {
            _local_5.push(new Jyzeqet(this.mefumy,Math.acos(this.mefumy.dot(_arg_1.direction)),Number.MAX_VALUE,10));
         }
         return _local_5;
      }
   }
}

