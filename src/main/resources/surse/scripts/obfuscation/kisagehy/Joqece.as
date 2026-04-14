package obfuscation.kisagehy
{
   import platform.client.fp10.core.resource.types.ImageResource;
   
   public class Joqece
   {
      
      private var lofap:ImageResource;
      
      private var kuzyqilos:ImageResource;
      
      private var tenuw:ImageResource;
      
      private var _left:ImageResource;
      
      private var _right:ImageResource;
      
      private var rirog:ImageResource;
      
      public function Joqece(_arg_1:ImageResource = null, _arg_2:ImageResource = null, _arg_3:ImageResource = null, _arg_4:ImageResource = null, _arg_5:ImageResource = null, _arg_6:ImageResource = null)
      {
         super();
         this.lofap = _arg_1;
         this.kuzyqilos = _arg_2;
         this.tenuw = _arg_3;
         this._left = _arg_4;
         this._right = _arg_5;
         this.rirog = _arg_6;
      }
      
      public function get back() : ImageResource
      {
         return this.lofap;
      }
      
      public function set back(_arg_1:ImageResource) : void
      {
         this.lofap = _arg_1;
      }
      
      public function get bottom() : ImageResource
      {
         return this.kuzyqilos;
      }
      
      public function set bottom(_arg_1:ImageResource) : void
      {
         this.kuzyqilos = _arg_1;
      }
      
      public function get front() : ImageResource
      {
         return this.tenuw;
      }
      
      public function set front(_arg_1:ImageResource) : void
      {
         this.tenuw = _arg_1;
      }
      
      public function get left() : ImageResource
      {
         return this._left;
      }
      
      public function set left(_arg_1:ImageResource) : void
      {
         this._left = _arg_1;
      }
      
      public function get right() : ImageResource
      {
         return this._right;
      }
      
      public function set right(_arg_1:ImageResource) : void
      {
         this._right = _arg_1;
      }
      
      public function get top() : ImageResource
      {
         return this.rirog;
      }
      
      public function set top(_arg_1:ImageResource) : void
      {
         this.rirog = _arg_1;
      }
      
      public function toString() : String
      {
         var _local_1:* = "SkyboxSides [";
         _local_1 += "back = " + this.back + " ";
         _local_1 += "bottom = " + this.bottom + " ";
         _local_1 += "front = " + this.front + " ";
         _local_1 += "left = " + this.left + " ";
         _local_1 += "right = " + this.right + " ";
         _local_1 += "top = " + this.top + " ";
         return _local_1 + "]";
      }
   }
}

