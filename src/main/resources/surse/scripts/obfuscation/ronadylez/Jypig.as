package obfuscation.ronadylez
{
   import alternativa.math.Vector3;
   import alternativa.tanks.battle.scene3d.Renderer;
   
   public class Jypig implements Renderer
   {
      
      private static const tosilogo:Vector3 = new Vector3();
      
      private const center:Vector3 = new Vector3();
      
      private const objects:Vector.<Vyhesuz> = new Vector.<Vyhesuz>();
      
      private var jacumavi:Number;
      
      private var tuhy:int;
      
      public function Jypig()
      {
         super();
      }
      
      public function add(_arg_1:Vyhesuz) : void
      {
         var _local_2:* = undefined;
         if(this.objects.indexOf(_arg_1) < 0)
         {
            _local_2 = this.tuhy++;
            this.objects[_local_2] = _arg_1;
         }
      }
      
      public function remove(_arg_1:Vyhesuz) : void
      {
         var _local_2:int = this.objects.indexOf(_arg_1);
         if(_local_2 >= 0)
         {
            _arg_1.setAlphaMultiplier(1);
            --this.tuhy;
            this.objects[_local_2] = this.objects[this.tuhy];
            this.objects[this.tuhy] = null;
         }
      }
      
      public function wypitir(_arg_1:Vector3, _arg_2:Number) : void
      {
         this.center.copy(_arg_1);
         this.jacumavi = _arg_2 * _arg_2;
      }
      
      public function restore() : void
      {
         var _local_1:Vyhesuz = null;
         var _local_2:int = 0;
         while(_local_2 < this.tuhy)
         {
            _local_1 = this.objects[_local_2];
            _local_1.setAlphaMultiplier(1);
            _local_2++;
         }
      }
      
      public function render(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Vyhesuz = null;
         var _local_4:int = 0;
         while(_local_4 < this.tuhy)
         {
            _local_3 = this.objects[_local_4];
            _local_3.readPosition(tosilogo);
            _local_3.setAlphaMultiplier(this.sed(tosilogo));
            _local_4++;
         }
      }
      
      private function sed(_arg_1:Vector3) : Number
      {
         var _local_2:Number = _arg_1.x - this.center.x;
         var _local_3:Number = _arg_1.y - this.center.y;
         var _local_4:Number = _arg_1.z - this.center.z;
         var _local_5:Number = _local_2 * _local_2 + _local_3 * _local_3 + _local_4 * _local_4;
         if(_local_5 < this.jacumavi)
         {
            return Math.sqrt(_local_5 / this.jacumavi);
         }
         return 1;
      }
      
      public function clear() : void
      {
         this.objects.length = 0;
         this.tuhy = 0;
      }
   }
}

