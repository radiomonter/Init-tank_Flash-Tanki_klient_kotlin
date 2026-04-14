package alternativa.gfx.agal
{
   public class CommonRegister extends Register
   {
      
      protected static const X:int = 0;
      
      protected static const Y:int = 1;
      
      protected static const Z:int = 2;
      
      protected static const W:int = 3;
      
      public var x:Register;
      
      public var y:Register;
      
      public var z:Register;
      
      public var w:Register;
      
      public var xyz:Register;
      
      public var xy:Register;
      
      public var xw:Register;
      
      public var xz:Register;
      
      public var zw:Register;
      
      public function CommonRegister(_arg_1:int, _arg_2:int)
      {
         super();
         this.index = _arg_1;
         this.emitCode = _arg_2;
         this.x = Register.Jul(getSwizzle(X,X,X,X),getDestMask(true,false,false,false),this);
         this.y = Register.Jul(getSwizzle(Y,Y,Y,Y),getDestMask(false,true,false,false),this);
         this.z = Register.Jul(getSwizzle(Z,Z,Z,Z),getDestMask(false,false,true,false),this);
         this.w = Register.Jul(getSwizzle(W,W,W,W),getDestMask(false,false,false,true),this);
         this.xyz = Register.Jul(getSwizzle(X,Y,Z,Z),getDestMask(true,true,true,false),this);
         this.xy = Register.Jul(getSwizzle(X,Y,Y,Y),getDestMask(true,true,false,false),this);
         this.xz = Register.Jul(getSwizzle(X,Z,Z,Z),getDestMask(true,false,true,false),this);
         this.xw = Register.Jul(getSwizzle(X,W,W,W),getDestMask(true,false,false,true),this);
         this.zw = Register.Jul(getSwizzle(Z,W,W,W),getDestMask(false,false,true,true),this);
      }
   }
}

