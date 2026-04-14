package obfuscation.rofa
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.models.weapon.shared.Zowyrazoq;
   import alternativa.tanks.utils.objectpool.Pool;
   import alternativa.tanks.utils.objectpool.PooledObject;
   import obfuscation.jete.Bawaz;
   
   public class Gesyqa extends PooledObject implements Toli
   {
      
      private var nodubahij:Bawaz;
      
      private var qonalawu:Jacit;
      
      private var sysu:Array = [0.1,0.3,0.5,0.8,0.9,1];
      
      private var teravotaw:Array = [0.5,0.8,1,0.5,0.3,0.05];
      
      public function Gesyqa(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      public function init(_arg_1:Bawaz, _arg_2:Jacit) : void
      {
         this.nodubahij = _arg_1;
         this.qonalawu = _arg_2;
      }
      
      public function zosow(_arg_1:Object3D) : void
      {
         var _local_2:Vector.<Zowyrazoq> = null;
         var _local_3:int = 0;
         var _local_4:Zowyrazoq = null;
         var _local_5:Number = NaN;
         var _local_6:Number = NaN;
         var _local_7:Number = 0;
         var _local_8:Number = 0;
         var _local_9:Number = 0;
         var _local_10:Number = 0;
         if(this.nodubahij.qat == 0)
         {
            this.qonalawu.zosow(_arg_1);
         }
         else
         {
            _local_2 = this.nodubahij.jeryw;
            _local_3 = 0;
            while(_local_3 < this.nodubahij.qat)
            {
               _local_4 = _local_2[_local_3];
               _local_5 = _local_4.mecuhyje / this.nodubahij.range;
               _local_6 = this.bazo(_local_5);
               _local_10 += _local_6;
               _local_7 += _local_4.x * _local_6;
               _local_8 += _local_4.y * _local_6;
               _local_9 += _local_4.z * _local_6;
               _local_3++;
            }
            _local_7 /= _local_10;
            _local_8 /= _local_10;
            _local_9 /= _local_10;
            _arg_1.x = _local_7;
            _arg_1.y = _local_8;
            _arg_1.z = _local_9;
         }
      }
      
      private function bazo(_arg_1:Number) : Number
      {
         var _local_3:int = 0;
         var _local_2:Number = NaN;
         while(_local_3 < this.sysu.length)
         {
            _local_2 = Number(this.sysu[_local_3]);
            if(_local_2 >= _arg_1)
            {
               return this.teravotaw[_local_3];
            }
            _local_3++;
         }
         return 0;
      }
      
      public function lulik(_arg_1:Object3D, _arg_2:GameCamera, _arg_3:int) : void
      {
         this.zosow(_arg_1);
      }
      
      public function destroy() : void
      {
         this.nodubahij = null;
         this.qonalawu = null;
      }
   }
}

