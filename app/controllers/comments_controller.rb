class CommentsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @comment = @product.comments.new(comment_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @product, notice: 'Review was created successfully.' }
        format.json { render :show, status: :created, location: @product }
      else
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
    redirect_to product_url id: params[:product_id]
  end

private  
  def comment_params
    params.require(:comment).permit(:user_id, :body, :rating)
  end

end