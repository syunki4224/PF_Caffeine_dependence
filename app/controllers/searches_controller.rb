class SearchesController < ApplicationController
  def search
    @model = params["model"]
    @content = params["content"]
    @method = params["method"]
    @records = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    if model == 'user'
      if method == 'perfect'
        User.where(name: content)
      elsif method == 'for_ward'
        User.where('name LIKE ?', content+'%')
      elsif method == 'back_ward'
        User.where('name LIKE ?', '%'+content)
      elsif method == 'partial'
        User.where('name LIKE ?', '%'+content+'%')
      end
    elsif model == 'post'
      if method == 'perfect'
        Post.where(brand: content)
      elsif method == 'for_ward'
        Post.where('brand LIKE ?', content+'%')
      elsif method == 'back_ward'
        Post.where('brand LIKE ?', '%'+content)
      elsif method == 'partial'
        Post.where('brand LIKE ?', '%'+content+'%')
      end
    end
  end

end
