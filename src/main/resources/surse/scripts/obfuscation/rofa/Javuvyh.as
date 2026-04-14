package obfuscation.rofa
{
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.objects.Mesh;
   
   public class Javuvyh extends Mesh
   {
      
      protected var a:Vertex;
      
      protected var b:Vertex;
      
      protected var c:Vertex;
      
      protected var d:Vertex;
      
      private var originX:Number;
      
      private var originY:Number;
      
      public function Javuvyh(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number)
      {
         super();
         this.originX = _arg_3;
         this.originY = _arg_4;
         boundMinX = -_arg_3 * _arg_1;
         boundMaxX = boundMinX + _arg_1;
         boundMinY = -_arg_4 * _arg_2;
         boundMaxY = boundMinY + _arg_2;
         boundMinZ = 0;
         boundMaxZ = 0;
         var _local_5:Vector.<Number> = Vector.<Number>([boundMinX,boundMinY,0,boundMaxX,boundMinY,0,boundMaxX,boundMaxY,0,boundMinX,boundMaxY,0]);
         var _local_6:Vector.<Number> = Vector.<Number>([0,1,1,1,1,0,0,0]);
         var _local_7:Vector.<int> = Vector.<int>([4,0,1,2,3]);
         addVerticesAndFaces(_local_5,_local_6,_local_7,true);
         calculateFacesNormals();
         this.boze();
      }
      
      private function boze() : void
      {
         var _local_1:Vector.<Vertex> = this.vertices;
         this.a = _local_1[0];
         this.b = _local_1[1];
         this.c = _local_1[2];
         this.d = _local_1[3];
      }
      
      public function dow(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number, _arg_6:Number, _arg_7:Number, _arg_8:Number) : void
      {
         this.a.u = _arg_1;
         this.a.v = _arg_2;
         this.b.u = _arg_3;
         this.b.v = _arg_4;
         this.c.u = _arg_5;
         this.c.v = _arg_6;
         this.d.u = _arg_7;
         this.d.v = _arg_8;
      }
      
      public function set width(_arg_1:Number) : void
      {
         boundMinX = this.a.x = this.d.x = -this.originX * _arg_1;
         boundMaxX = this.b.x = this.c.x = boundMinX + _arg_1;
      }
      
      public function get length() : Number
      {
         return boundMaxY - boundMinY;
      }
      
      public function set length(_arg_1:Number) : void
      {
         boundMinY = this.a.y = this.b.y = -this.originY * _arg_1;
         boundMaxY = this.d.y = this.c.y = boundMinY + _arg_1;
      }
      
      public function resize(_arg_1:Number, _arg_2:Number) : void
      {
         this.width = _arg_1;
         this.length = _arg_2;
      }
   }
}

