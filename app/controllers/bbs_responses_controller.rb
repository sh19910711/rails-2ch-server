class BbsResponsesController < ApplicationController
  
  def show
    @bbs_response = BbsResponse.find(params[:id])
    respond_to do |format|
      format.html
    end
  end

  def delete
    @bbs_response = BbsResponse.find(params[:id])
    @bbs_response.destroy

    redirect_to params[:success_callback_url]
  end

  def edit
    @bbs_response = BbsResponse.find(params[:id])

    respond_to do |format|
      format.html
    end
  end

  def update
    @bbs_response = BbsResponse.find(params[:id])
    @bbs_response.update_attributes params[:bbs_response]
    redirect_to params[:data][:success_callback_url]
  end

end
