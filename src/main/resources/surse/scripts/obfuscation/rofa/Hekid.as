package obfuscation.rofa
{
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.utils.objectpool.Pool;
   
   public class Hekid extends Jywaca
   {
      
      private static const sodasyjek:Number = 3000;
      
      private static const cegavipoh:Number = 1 / 5000;
      
      private static const v:Vector3 = new Vector3();
      
      public function Hekid(_arg_1:Pool)
      {
         super(_arg_1);
      }
      
      override public function play(_arg_1:int, _arg_2:GameCamera) : Boolean
      {
         var _local_3:Number = NaN;
         var _local_4:Boolean = super.play(_arg_1,_arg_2);
         if(_local_4)
         {
            v.reset(caru.x,caru.y,caru.z);
            _local_3 = _arg_2.position.distanceTo(v);
            if(_local_3 > sodasyjek)
            {
               scale += _local_3 * cegavipoh;
            }
            return true;
         }
         return false;
      }
   }
}

