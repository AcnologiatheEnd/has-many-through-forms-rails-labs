class Post < ActiveRecord::Base
  has_many :post_categories
  has_many :categories, through: :post_categories
  has_many :comments
  has_many :users, through: :comments
  accepts_nested_attributes_for :categories,  reject_if: :blank_name        #proc { |attributes| attributes['name'].blank? }

  
  def blank_name(attributes)
    attributes['name'].blank?
  end
  
  
  
  #the method below works in the same way as "accepts_nested_attributes_for" method
  
  #def categories_attributes=(category_attributes)
  #  category_attributes.values.each do |category_attribute|
   #   category = Category.find_or_create_by(category_attribute)
   #   self.categories << category
   # end
  #end
end
