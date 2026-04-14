package alternativa.tanks.gui.category
{
   import base.DiscreteSprite;
   import flash.events.MouseEvent;
   import flash.utils.Dictionary;
   import projects.tanks.client.commons.types.ItemViewCategoryEnum;
   
   public class CategoryButtonsList extends DiscreteSprite
   {
      
      private static const SPACE_BETWEEN_BUTTON:int = 5;
      
      private var selectedCategory:ItemViewCategoryEnum;
      
      private var buttons:Vector.<ItemCategoryButton> = new Vector.<ItemCategoryButton>();
      
      private var categoryToButton:Dictionary = new Dictionary();
      
      private var textMaxButtonWidth:int;
      
      private var iconAndTextMaxButtonWidth:int;
      
      private var maxWidth:int = 100;
      
      public function CategoryButtonsList()
      {
         super();
         this.addButton(ItemViewCategoryEnum.WEAPON);
         this.addButton(ItemViewCategoryEnum.ARMOR);
         this.addButton(ItemViewCategoryEnum.RESISTANCE);
         this.addButton(ItemViewCategoryEnum.PAINT);
         this.addButton(ItemViewCategoryEnum.INVENTORY);
         this.addButton(ItemViewCategoryEnum.KIT);
         this.addButton(ItemViewCategoryEnum.SPECIAL);
         this.addButton(ItemViewCategoryEnum.GIVEN_PRESENTS);
         this.buttons[0].enabled = false;
         this.selectedCategory = this.buttons[0].getCategory();
         this.calculateWidth();
      }
      
      public function select(_arg_1:ItemViewCategoryEnum) : void
      {
         this.categoryToButton[this.selectedCategory].enabled = true;
         this.categoryToButton[_arg_1].enabled = false;
         this.selectedCategory = _arg_1;
         dispatchEvent(new CategoryButtonsListEvent(CategoryButtonsListEvent.CATEGORY_SELECTED,this.selectedCategory));
      }
      
      public function getSelectedCategory() : ItemViewCategoryEnum
      {
         return this.selectedCategory;
      }
      
      public function setCategoryButtonVisibility(_arg_1:ItemViewCategoryEnum, _arg_2:Boolean) : void
      {
         this.categoryToButton[_arg_1].visible = _arg_2;
         this.calculateWidth();
      }
      
      public function getCategoryButtonVisibility(_arg_1:ItemViewCategoryEnum) : Boolean
      {
         return this.categoryToButton[_arg_1].visible;
      }
      
      public function showNewItemIndicator(_arg_1:ItemViewCategoryEnum) : void
      {
         this.categoryToButton[_arg_1].showNewItemIndicator();
      }
      
      public function hideNewItemIndicator(_arg_1:ItemViewCategoryEnum) : void
      {
         this.categoryToButton[_arg_1].hideNewItemIndicator();
      }
      
      public function showDiscountIndicator(_arg_1:ItemViewCategoryEnum) : void
      {
         this.categoryToButton[_arg_1].showDiscountIndicator();
      }
      
      public function hideDiscountIndicator(_arg_1:ItemViewCategoryEnum) : void
      {
         this.categoryToButton[_arg_1].hideDiscountIndicator();
      }
      
      private function addButton(_arg_1:ItemViewCategoryEnum) : void
      {
         var _local_2:ItemCategoryButton = new ItemCategoryButton(_arg_1);
         this.buttons.push(_local_2);
         this.categoryToButton[_arg_1] = _local_2;
         _local_2.addEventListener(MouseEvent.CLICK,this.onButtonClick);
         addChild(_local_2);
      }
      
      private function calculateWidth() : void
      {
         var _local_1:ItemCategoryButton = null;
         this.textMaxButtonWidth = this.iconAndTextMaxButtonWidth = 0;
         for each(_local_1 in this.buttons)
         {
            if(_local_1.visible)
            {
               _local_1.setTextState();
               this.textMaxButtonWidth = Math.max(this.textMaxButtonWidth,_local_1.width);
               _local_1.setIconTextState();
               this.iconAndTextMaxButtonWidth = Math.max(this.iconAndTextMaxButtonWidth,_local_1.width);
            }
         }
         this.selectLod();
      }
      
      override public function get width() : Number
      {
         return this.maxWidth;
      }
      
      override public function set width(_arg_1:Number) : void
      {
         this.maxWidth = _arg_1;
         this.selectLod();
      }
      
      private function selectLod() : void
      {
         var _local_1:ItemCategoryButton = null;
         var _local_2:int = 0;
         var _local_3:int = 0;
         var _local_4:int = 0;
         _local_1 = null;
         for each(_local_1 in this.buttons)
         {
            if(_local_1.visible)
            {
               _local_4++;
            }
         }
         _local_2 = int((this.maxWidth - (_local_4 - 1) * SPACE_BETWEEN_BUTTON) / _local_4);
         if(_local_2 >= this.iconAndTextMaxButtonWidth)
         {
            _local_2 = Math.min(_local_2,this.iconAndTextMaxButtonWidth + 7);
         }
         else if(_local_2 >= this.textMaxButtonWidth)
         {
            _local_2 = Math.min(_local_2,this.textMaxButtonWidth + 14);
         }
         for each(_local_1 in this.buttons)
         {
            if(_local_1.visible)
            {
               if(this.iconAndTextMaxButtonWidth <= _local_2)
               {
                  _local_1.setIconTextState();
                  _local_1.width = _local_2;
               }
               else if(this.textMaxButtonWidth <= _local_2)
               {
                  _local_1.setTextState();
                  _local_1.width = _local_2;
               }
               else
               {
                  _local_1.setIconState();
               }
               _local_1.x = _local_3;
               _local_3 += _local_1.width;
               _local_3 += SPACE_BETWEEN_BUTTON;
            }
         }
      }
      
      private function onButtonClick(_arg_1:MouseEvent) : void
      {
         if(_arg_1.target is ItemCategoryButton)
         {
            this.select(ItemCategoryButton(_arg_1.target).getCategory());
         }
      }
      
      public function destroy() : void
      {
         var _local_1:ItemCategoryButton = null;
         for each(_local_1 in this.buttons)
         {
            _local_1.removeEventListener(MouseEvent.CLICK,this.onButtonClick);
         }
         this.buttons = null;
         this.categoryToButton = null;
      }
      
      public function findVisibleCategory() : ItemViewCategoryEnum
      {
         var _local_1:ItemCategoryButton = null;
         for each(_local_1 in this.buttons)
         {
            if(_local_1.visible)
            {
               return _local_1.getCategory();
            }
         }
         throw new Error("No category to show");
      }
   }
}

