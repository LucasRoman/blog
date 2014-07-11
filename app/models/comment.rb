class Comment < ActiveRecord::Base
	belongs_to :post

=begin
  def post
  	Post.find(post_id)
  end 

  def comments
  	Comment.where({post_id: id})
  end

  def ultimo
  	Comment.last
  end
=end

end
