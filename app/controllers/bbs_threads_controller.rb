class BbsThreadsController < ApplicationController

  def index
  end

  def show
    @bbs_thread = BbsThread.find params[:id]
    @new_bbs_response = BbsResponse.new

    respond_to {|format|
      format.html
    }
  end

  def create_response
    @bbs_thread = BbsThread.find params[:id]
    
    @bbs_thread.bbs_responses.create(
      :name => params[:bbs_response][:name],
      :mail => params[:bbs_response][:mail],
      :info => params[:bbs_response][:info],
      :body => params[:bbs_response][:body],
    )

    redirect_to params[:success_callback_url]
  end

  def delete
    @bbs_thread = BbsThread.find(params[:id])
    @bbs_thread.destroy
    redirect_to params[:return_url]
  end

  def update
    @bbs_thread = BbsThread.find(params[:id])
    @bbs_thread.update_attributes params[:bbs_thread]
    redirect_to params[:data][:success_callback_url]
  end

  def edit
    @bbs_thread = BbsThread.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

end
