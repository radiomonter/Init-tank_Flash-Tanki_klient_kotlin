package com.alternativaplatform.projects.tanks.client.commons.types
{
   import obfuscation.kofen.Vector3d;
   
   public class TankState
   {
      
      public var health:int;
      
      public var position:Vector3d;
      
      public var orientation:Vector3d;
      
      public var turretAngle:int;
      
      public var control:int;
      
      public var turretControl:int;
      
      public function TankState()
      {
         super();
      }
   }
}

