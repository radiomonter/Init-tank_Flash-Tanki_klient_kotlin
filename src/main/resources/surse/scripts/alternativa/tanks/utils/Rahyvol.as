package alternativa.tanks.utils
{
   public class Rahyvol
   {
      
      private var japago:Vector.<uint> = new Vector.<uint>();
      
      public function Rahyvol()
      {
         super();
      }
      
      public function gumi(_arg_1:uint) : Boolean
      {
         return this.japago.indexOf(_arg_1) != -1;
      }
      
      public function welobiqe(_arg_1:uint) : void
      {
         if(this.japago.indexOf(_arg_1) == -1)
         {
            this.japago.push(_arg_1);
         }
      }
      
      public function coz(_arg_1:uint) : void
      {
         var _local_2:Number = this.japago.indexOf(_arg_1);
         if(_local_2 >= 0)
         {
            this.japago.splice(_local_2,1);
         }
      }
   }
}

