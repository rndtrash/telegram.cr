require "json"

module Telegram
  class Chat
    JSON.mapping(
      id:	UInt32,
      type: String,
      title: String?,
      username: String?,
      first_name: String?,
      last_name: String?,
      all_members_are_administrators: Bool?,
      #photo	ChatPhoto	Optional. Chat photo. Returned only in getChat.
      description: String?,
      invite_link: String?,
      pinned_message: Message?,
      sticker_set_name: String?,
      can_set_sticker_set: Bool?
    )
  end
end
