package alternativa.tanks.battle.objects.tank.tankskin
{
   import alternativa.engine3d.core.Face;
   import alternativa.engine3d.core.Vertex;
   import alternativa.engine3d.materials.Material;
   import alternativa.engine3d.materials.UVMatrixProvider;
   import alternativa.tanks.materials.TrackMaterial;
   import flash.geom.Matrix;
   import flash.utils.Dictionary;
   
   public class TrackSurfaceSkin
   {
      
      private var qecapa:UVMatrixProvider;
      
      private var faces:Vector.<Face> = new Vector.<Face>();
      
      private var vertices:Vector.<Vertex>;
      
      private var ratio:Number;
      
      private var distance:Number = 0;
      
      public function TrackSurfaceSkin()
      {
         super();
      }
      
      private static function quze(_arg_1:Face) : Number
      {
         var _local_2:Vector.<Vertex> = _arg_1.vertices;
         return tyfapy(_local_2[0],_local_2[1]);
      }
      
      private static function tyfapy(_arg_1:Vertex, _arg_2:Vertex) : Number
      {
         var _local_3:Number = _arg_1.x - _arg_2.x;
         var _local_4:Number = _arg_1.y - _arg_2.y;
         var _local_5:Number = _arg_1.z - _arg_2.z;
         var _local_6:Number = Math.sqrt(_local_3 * _local_3 + _local_4 * _local_4 + _local_5 * _local_5);
         var _local_7:Number = _arg_1.u - _arg_2.u;
         var _local_8:Number = _arg_1.v - _arg_2.v;
         var _local_9:Number = Math.sqrt(_local_7 * _local_7 + _local_8 * _local_8);
         return _local_9 / _local_6;
      }
      
      public function addFace(_arg_1:Face) : void
      {
         this.faces.push(_arg_1);
      }
      
      public function init() : void
      {
         var _local_1:Face = null;
         var _local_3:Vertex = null;
         var _local_2:* = undefined;
         var _local_4:Number = 0;
         var _local_5:Dictionary = new Dictionary();
         for each(_local_1 in this.faces)
         {
            for each(_local_3 in _local_1.vertices)
            {
               _local_5[_local_3] = true;
            }
            _local_4 += quze(_local_1);
         }
         this.ratio = _local_4 / this.faces.length;
         this.vertices = new Vector.<Vertex>();
         for(_local_2 in _local_5)
         {
            this.vertices.push(_local_2);
         }
      }
      
      public function move(_arg_1:Number) : void
      {
         var _local_2:Matrix = null;
         this.distance += _arg_1 * this.ratio;
         if(this.qecapa != null)
         {
            _local_2 = this.qecapa.getMatrix();
            _local_2.tx = this.distance;
         }
      }
      
      public function nobozin(_arg_1:Material) : void
      {
         var _local_2:Face = null;
         var _local_3:TrackMaterial = null;
         for each(_local_2 in this.faces)
         {
            _local_2.material = _arg_1;
         }
         if(_arg_1 is TrackMaterial)
         {
            _local_3 = _arg_1 as TrackMaterial;
            this.qecapa = _local_3.uvMatrixProvider;
         }
      }
   }
}

