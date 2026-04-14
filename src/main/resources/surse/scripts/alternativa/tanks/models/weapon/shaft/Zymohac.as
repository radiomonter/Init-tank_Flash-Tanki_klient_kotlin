package alternativa.tanks.models.weapon.shaft
{
   import alternativa.object.ClientObject;
   import obfuscation.kofen.Vector3d;
   
   internal class Zymohac
   {
      
      public var lozybom:Vector3d;
      
      public var hitPoint:Vector3d;
      
      public var tank:ClientObject;
      
      public var incarnation:int;
      
      public var zigi:Vector3d;
      
      public var targetPositionGlobal:Vector3d;
      
      public function Zymohac(_arg_1:Vector3d, _arg_2:Vector3d, _arg_3:ClientObject, _arg_4:int, _arg_5:Vector3d, _arg_6:Vector3d)
      {
         super();
         this.lozybom = _arg_1;
         this.hitPoint = _arg_2;
         this.tank = _arg_3;
         this.incarnation = _arg_4;
         this.zigi = _arg_5;
         this.targetPositionGlobal = _arg_6;
      }
   }
}

