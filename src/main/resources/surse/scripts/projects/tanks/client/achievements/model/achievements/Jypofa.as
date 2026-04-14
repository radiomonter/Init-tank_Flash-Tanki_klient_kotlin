package projects.tanks.client.achievements.model.achievements
{
   public class Jypofa
   {
      
      public static const FIRST_RANK_UP:Jypofa = new Jypofa(0,"FIRST_RANK_UP");
      
      public static const FIRST_PURCHASE:Jypofa = new Jypofa(1,"FIRST_PURCHASE");
      
      public static const FIGHT_FIRST_BATTLE:Jypofa = new Jypofa(2,"FIGHT_FIRST_BATTLE");
      
      public static const FIRST_DONATE:Jypofa = new Jypofa(3,"FIRST_DONATE");
      
      public static const FIRST_REFERRAL:Jypofa = new Jypofa(4,"FIRST_REFERRAL");
      
      public static const SET_EMAIL:Jypofa = new Jypofa(5,"SET_EMAIL");
      
      private var _value:int;
      
      private var _name:String;
      
      public function Jypofa(_arg_1:int, _arg_2:String)
      {
         super();
         this._value = _arg_1;
         this._name = _arg_2;
      }
      
      public static function get values() : Vector.<Jypofa>
      {
         var _local_1:Vector.<Jypofa> = new Vector.<Jypofa>();
         _local_1.push(FIRST_RANK_UP);
         _local_1.push(FIRST_PURCHASE);
         _local_1.push(FIGHT_FIRST_BATTLE);
         _local_1.push(FIRST_DONATE);
         _local_1.push(FIRST_REFERRAL);
         _local_1.push(SET_EMAIL);
         return _local_1;
      }
      
      public function toString() : String
      {
         return "Achievement [" + this._name + "]";
      }
      
      public function get value() : int
      {
         return this._value;
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}

