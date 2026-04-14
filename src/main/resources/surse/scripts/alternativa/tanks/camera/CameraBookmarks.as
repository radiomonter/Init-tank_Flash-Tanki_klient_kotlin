package alternativa.tanks.camera
{
   public class CameraBookmarks
   {
      
      private var tokuzoz:Vector.<CameraBookmark>;
      
      public function CameraBookmarks(_arg_1:int)
      {
         super();
         this.tokuzoz = new Vector.<CameraBookmark>(_arg_1);
      }
      
      public function getBookmark(_arg_1:uint) : CameraBookmark
      {
         if(_arg_1 < this.tokuzoz.length)
         {
            return this.tokuzoz[_arg_1];
         }
         return null;
      }
      
      public function saveCurrentPositionCameraToBookmark(_arg_1:uint) : void
      {
         if(_arg_1 < this.tokuzoz.length)
         {
            this.fifawi(_arg_1).kaqyp();
         }
      }
      
      private function fifawi(_arg_1:uint) : CameraBookmark
      {
         if(this.tokuzoz[_arg_1] == null)
         {
            this.tokuzoz[_arg_1] = new CameraBookmark();
         }
         return this.tokuzoz[_arg_1];
      }
   }
}

