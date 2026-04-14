package obfuscation.gur
{
   import alternativa.engine3d.core.Object3D;
   import alternativa.math.Matrix3;
   import alternativa.math.Vector3;
   import alternativa.tanks.camera.GameCamera;
   import alternativa.tanks.camera.Zynomy;
   import alternativa.tanks.camera.Zyzy;
   
   public class Qudylin extends Zyzy implements Zynomy
   {
      
      private static const pydowivar:Matrix3 = new Matrix3();
      
      private static const loroninar:Matrix3 = new Matrix3();
      
      private static const vector:Vector3 = new Vector3();
      
      private var kovohagep:Object3D;
      
      private var huluwyqyc:Number = 0;
      
      private var zeteqysig:Vector3 = new Vector3();
      
      private var noc:Number;
      
      private var qaq:Number;
      
      private var cyqyt:int;
      
      private var vahotir:Number = 1;
      
      private var pegaz:Number = 1;
      
      private var qari:Number = 0;
      
      private var zynis:Number = 5;
      
      public function Qudylin(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number)
      {
         super();
         this.noc = _arg_1;
         this.qaq = _arg_2;
         this.vahotir = _arg_3;
         this.zynis = _arg_4;
      }
      
      public function set rywa(_arg_1:int) : void
      {
         if(this.cyqyt != _arg_1)
         {
            this.cyqyt = _arg_1;
            this.qari = 0;
         }
      }
      
      public function bogose() : Boolean
      {
         return this.huluwyqyc == this.noc || this.huluwyqyc == this.qaq;
      }
      
      public function qokyg(_arg_1:Vector3) : void
      {
         var _local_2:GameCamera = null;
         _local_2 = cewubu();
         _arg_1.x = _local_2.x;
         _arg_1.y = _local_2.y;
         _arg_1.z = _local_2.z;
      }
      
      public function jobojykyl(_arg_1:Vector3) : void
      {
         var _local_2:GameCamera = cewubu();
         var _local_3:Vector3 = _local_2.kifotabim;
         _arg_1.copy(_local_3);
      }
      
      public function get gimyba() : Number
      {
         return this.huluwyqyc;
      }
      
      public function set gimyba(_arg_1:Number) : void
      {
         if(_arg_1 > this.noc)
         {
            this.huluwyqyc = this.noc;
         }
         else if(_arg_1 < this.qaq)
         {
            this.huluwyqyc = this.qaq;
         }
         else
         {
            this.huluwyqyc = _arg_1;
         }
      }
      
      public function mytipab(_arg_1:Object3D) : void
      {
         this.kovohagep = _arg_1;
      }
      
      public function guvoh(_arg_1:Vector3) : void
      {
         this.zeteqysig.copy(_arg_1);
      }
      
      public function pewyre(_arg_1:Number) : void
      {
         this.pegaz = _arg_1;
      }
      
      override public function update(_arg_1:int, _arg_2:int) : void
      {
         var _local_3:Number = NaN;
         var _local_4:Number = _arg_2 / 1000;
         if(this.cyqyt != 0)
         {
            this.qari += this.zynis * _local_4;
            _local_3 = this.vahotir * this.pegaz;
            if(this.qari > _local_3)
            {
               this.qari = _local_3;
            }
            this.huluwyqyc += this.cyqyt * this.qari * _local_4;
            if(this.huluwyqyc > this.noc)
            {
               this.huluwyqyc = this.noc;
            }
            else if(this.huluwyqyc < this.qaq)
            {
               this.huluwyqyc = this.qaq;
            }
         }
         pydowivar.setRotationMatrix(this.kovohagep.rotationX,this.kovohagep.rotationY,this.kovohagep.rotationZ);
         loroninar.fromAxisAngle(Vector3.X_AXIS,this.huluwyqyc - Math.PI / 2);
         loroninar.append(pydowivar);
         loroninar.getEulerAngles(vector);
         var _local_5:GameCamera = cewubu();
         _local_5.rotationX = vector.x;
         _local_5.rotationY = vector.y;
         _local_5.rotationZ = vector.z;
         pydowivar.transformVector(this.zeteqysig,vector);
         _local_5.x = vector.x + this.kovohagep.x;
         _local_5.y = vector.y + this.kovohagep.y;
         _local_5.z = vector.z + this.kovohagep.z;
      }
      
      public function pisipiq(_arg_1:Number) : void
      {
         cewubu().fov = _arg_1;
      }
   }
}

