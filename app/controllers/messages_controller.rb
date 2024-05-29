class MessagesController < ApplicationController
  before_action :set_message, only: %i[ show update destroy ]
  before_action :set_messages

  # GET /messages
  def index
    render json: @messages
  end

  # GET /messages/1
  def show
    render json: @message
  end

  # POST /messages
  def create
    last_message = @messages.order(:message_number).lock(true).last
    @max_message_number = last_message ? last_message.message_number + 1 : 1

    message = CreateMessageJob.perform_later(body: params[:body], chat_id: @chat_id, application_token: @application_token, message_number: @max_message_number)
    message.index!
    if @message.save
      render json: @message, only: [:message_number], status: :accepted
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # GET :chat_id/messages/search
  def search
    chat_id=params[':chat_id']
    query=params[':query']

    results=Message.search(
      query: {
        bool: {
          must: [
            { match: { chat_id: chat_id} },
            { match: { body: query}}
          ]
        }
      }
    )

    render json: results.as_json
  end 

  # PATCH/PUT /messages/1
  def update
    if @message.update(message_params)
      render json: @message
    else
      render json: @message.errors, status: :unprocessable_entity
    end
  end

  # DELETE /messages/1
  def destroy
    @message.destroy!
  end

  private
    def set_messages
      @application_token=params['application_id']
      @chat_id=params['chat_id']
      @messages=Message.where(application_token: @application_token, chat_id: @chat_id)
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_message
      @message = Message.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:body, :message_number, :chat_id)
    end
end
