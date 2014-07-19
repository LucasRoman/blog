class Comment < ActiveRecord::Base
	belongs_to :post

  scope :params, -> { find params[:id]  }

end
