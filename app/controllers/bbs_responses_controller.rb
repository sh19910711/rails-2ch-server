class BbsResponsesController < ApplicationController
  
  def delete
    @bbs_response = BbsResponse.find(params[:id])
    @bbs_response.destroy

    redirect_to params[:success_callback_url]
  end

end
