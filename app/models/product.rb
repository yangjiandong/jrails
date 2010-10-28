class Product < ActiveRecord::Base
  default_scope :order => 'title'

  has_many :orders, :through => :line_items
  has_many :line_items

  validates_presence_of :title, :description, :image_url
  validates_uniqueness_of :title

  validates :image_url, :format =>{
    :with => %r{\.(gif|jpg|png)$}i,
    :message => 'must be a url for gif,jpg,png image.'
  }

  # rails 3 的写法
  validates :title, :length=>{:minimum => 10}

  validates_numericality_of :price
  validate :price_must_be_at_least_a_cent

  def self.find_products_for_sale
    find(:all, :order => "title")
  end

  protected
  def price_must_be_at_least_a_cent
    errors.add(:price, 'should be at least 0.01') if price.nil? || price < 0.01
  end
end
