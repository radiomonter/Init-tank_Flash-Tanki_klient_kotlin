package obfuscation.rofa
{
   import alternativa.engine3d.core.Sorting;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.objects.Mesh;
   import alternativa.tanks.engine3d.Bizotevuf;
   import alternativa.tanks.engine3d.TextureAnimation;
   
   public class AnimatedPlane extends Mesh
   {
      
      private var a:Vertex;
      
      private var b:Vertex;
      
      private var c:Vertex;
      
      private var d:Vertex;
      
      private var cogakegi:Vector.<Bizotevuf>;
      
      private var numFrames:int;
      
      private var vicyby:Number = 0;
      
      public function AnimatedPlane(_arg_1:Number, _arg_2:Number, _arg_3:Number = 0, _arg_4:Number = 0, _arg_5:Number = 10)
      {
         super();
         this.kecubuz(_arg_1,_arg_2,_arg_3,_arg_4,_arg_5);
         sorting = Sorting.DYNAMIC_BSP;
         calculateBounds();
         calculateFacesNormals();
         this.boze();
         this.softAttenuation = 130;
         this.shadowMapAlphaThreshold = 2;
         this.depthMapAlphaThreshold = 2;
      }
      
      private function kecubuz(_arg_1:Number, _arg_2:Number, _arg_3:Number, _arg_4:Number, _arg_5:Number) : void
      {
         var _local_6:Number = _arg_1 / 2;
         var _local_7:Number = _arg_2 / 2;
         var _local_8:Vector.<Number> = Vector.<Number>([_arg_3 - _local_6,_arg_4 + _local_7,_arg_5,_arg_3 - _local_6,_arg_4 - _local_7,_arg_5,_arg_3 + _local_6,_arg_4 - _local_7,_arg_5,_arg_3 + _local_6,_arg_4 + _local_7,_arg_5]);
         var _local_9:Vector.<Number> = Vector.<Number>([0,0,0,1,1,1,1,0]);
         var _local_10:Vector.<int> = Vector.<int>([4,0,1,2,3,4,0,3,2,1]);
         addVerticesAndFaces(_local_8,_local_9,_local_10,true);
      }
      
      private function boze() : void
      {
         var _local_1:Vector.<Vertex> = this.vertices;
         this.a = _local_1[0];
         this.b = _local_1[1];
         this.c = _local_1[2];
         this.d = _local_1[3];
      }
      
      public function init(_arg_1:TextureAnimation, _arg_2:Number) : void
      {
         setMaterialToAllFaces(_arg_1.material);
         this.cogakegi = _arg_1.sakito;
         this.numFrames = this.cogakegi.length;
         this.vicyby = _arg_2;
      }
      
      public function setTime(_arg_1:Number) : void
      {
         var _local_2:int = _arg_1 * this.vicyby;
         if(_local_2 >= this.numFrames)
         {
            _local_2 = this.numFrames - 1;
         }
         this.metobe(this.cogakegi[_local_2]);
      }
      
      public function clear() : void
      {
         setMaterialToAllFaces(null);
         this.cogakegi = null;
         this.numFrames = 0;
      }
      
      public function sykypypob() : Number
      {
         return this.numFrames / this.vicyby;
      }
      
      private function metobe(_arg_1:Bizotevuf) : void
      {
         this.a.u = _arg_1.topLeftU;
         this.a.v = _arg_1.topLeftV;
         this.b.u = _arg_1.topLeftU;
         this.b.v = _arg_1.bottomRightV;
         this.c.u = _arg_1.bottomRightU;
         this.c.v = _arg_1.bottomRightV;
         this.d.u = _arg_1.bottomRightU;
         this.d.v = _arg_1.topLeftV;
      }
   }
}

