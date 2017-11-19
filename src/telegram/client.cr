require "json"
require "http/client"
require "./types/*"

module Telegram
  class Client
    @offset = UInt32.new(0)

    def initialize(@token : String)
      #
    end

    def run
      loop do
        url = "https://api.telegram.org/bot#{@token}/getUpdates?offset=#{@offset+1}"
        responce = HTTP::Client.get url
        updates = Updates.from_json(responce.body)
        if !updates.ok
          err = String.new
          if (updates.error_code == 404 || updates.error_code == 401)
            err = "Looks like your token doesn't exist."
          end
          raise("Error #{updates.error_code}: #{updates.description}. #{err}")
        end
        updates.result.not_nil!.each do |element|
          if @offset < element.update_id
            @offset = element.update_id
          end
          if element.message
            call_event message_create, element.message.not_nil!
          end
          if element.edited_message
            call_event message_edit, element.message.not_nil!
          end
        end
      end
    end

    macro event(name, payload_type)
      def on_{{name}}(&handler : {{payload_type}} ->)
        (@on_{{name}}_handlers ||= [] of {{payload_type}} ->) << handler
      end
    end

    macro call_event(name, payload)
      @on_{{name}}_handlers.try &.each do |handler|
        begin
          handler.call({{payload}})
        rescue ex
          puts "An exception occured! #{ex}"
          #LOGGER.error <<-LOG
          #  An exception occurred in a user-defined event handler!
          #  #{ex}
          #  LOG
        end
      end
    end

    event message_create, Message
    event message_edit, Message

    def sendMessage(chat_id : (UInt32 | String), text : String)
      HTTP::Client.post_form("https://api.telegram.org/bot#{@token}/sendMessage", form: {"chat_id" => chat_id.to_s, "text" => text})
    end
  end
end
