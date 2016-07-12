class TestWorld
  def initialize
    @users = {}
    @products = {}
  end

  def clean
    @users.clear
  end

  def add_user(user_alias, person)
    @users[user_alias] = person
  end

  def get_user(user_alias)
    @users[user_alias]
  end

  def add_product(product_alias, product)
    @products[product_alias] = product
  end

  def get_product(product_alias)
    @products[product_alias]
  end
end
