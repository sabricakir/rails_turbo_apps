class AttachmentsController < ActionController::Base
  def destroy
    attachment = ActiveStorage::Attachment.find(params[:id])
    attachment.purge
    redirect_to params[:redirect_url], notice: 'Attachment was successfully destroyed.'
  end
end
