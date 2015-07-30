class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
      else
        Rails.logger.debug "Comment valid? #{@comment.valid?}"
        Rails.logger.debug "Comment errors: #{@comment.errors.inspect}"
        format.html { redirect_to @product, alert: 'Review was not saved successfully.' }
        format.json { render json: @comment.errrors, stauts: unprocessable_eternity }
      end
  end
end

  def destroy
    @comment = Comment.find(params[:id])
    authorize! :destroy, @comment
    product = @comment.product
    @comment.destroy
    head :ok # returns an empty response with HTTP STATUS code 200 which is for :ok
  end

private  
  def comment_params
    params.require(:comment).permit(:body, :rating).merge({user_id: current_user.id})
  end

end