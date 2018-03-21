class CommentsController < ApplicationController

  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @blog = Blog.find(params[:blog_id])
    @blog.comments.create(comment_params)

    redirect_to blog_path(@blog.id)
  end

  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:author, :content, :rating, :avatar, :blog_id)
    end
end
