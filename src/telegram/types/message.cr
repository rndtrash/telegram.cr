require "json"

module Telegram
  class Message
    JSON.mapping(
      message_id: UInt32,
      from: User?,
      date: UInt32,
      chat: Chat,
      forward_from: User?,
      forward_from_chat: Chat?,
      forward_from_message_id: UInt32?,
      forward_signature: String?,
      forward_date: UInt32?,
      reply_to_message: Message?,
      edit_date: UInt32?,
      author_signature: String?,
      text: String?,
      entities: Array(MessageEntity)?,
      caption_entities: Array(MessageEntity)?,
      #audio	Audio	Optional. Message is an audio file, information about the file
      #document	Document	Optional. Message is a general file, information about the file
      #game	Game	Optional. Message is a game, information about the game.
      #photo	Array of PhotoSize	Optional. Message is a photo, available sizes of the photo
      #sticker	Sticker	Optional. Message is a sticker, information about the sticker
      #video	Video	Optional. Message is a video, information about the video
      #voice	Voice	Optional. Message is a voice message, information about the file
      #video_note	VideoNote	Optional. Message is a video note, information about the video message
      caption: String?,
      #contact	Contact	Optional. Message is a shared contact, information about the contact
      #location	Location	Optional. Message is a shared location, information about the location
      #venue	Venue	Optional. Message is a venue, information about the venue
      #new_chat_members	Array of User	Optional. New members that were added to the group or supergroup and information about them (the bot itself may be one of these members)
      left_chat_member: User?,
      new_chat_title: String?,
      #new_chat_photo	Array of PhotoSize	Optional. A chat photo was change to this value
      #delete_chat_photo	True	Optional. Service message: the chat photo was deleted
      #group_chat_created	True	Optional. Service message: the group has been created
      #supergroup_chat_created	True	Optional. Service message: the supergroup has been created. This field can‘t be received in a message coming through updates, because bot can’t be a member of a supergroup when it is created. It can only be found in reply_to_message if someone replies to a very first message in a directly created supergroup.
      #channel_chat_created	True	Optional. Service message: the channel has been created. This field can‘t be received in a message coming through updates, because bot can’t be a member of a channel when it is created. It can only be found in reply_to_message if someone replies to a very first message in a channel.
      #migrate_to_chat_id	Integer	Optional. The group has been migrated to a supergroup with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
      #migrate_from_chat_id	Integer	Optional. The supergroup has been migrated from a group with the specified identifier. This number may be greater than 32 bits and some programming languages may have difficulty/silent defects in interpreting it. But it is smaller than 52 bits, so a signed 64 bit integer or double-precision float type are safe for storing this identifier.
      pinned_message: Message?
      #invoice	Invoice	Optional. Message is an invoice for a payment, information about the invoice.
      #successful_payment	SuccessfulPayment	Optional. Message is a service message about a successful payment, information about the payment.
    )
  end

  class MessageEntity
    JSON.mapping(
      type: String,
      offset: UInt32,
      length: UInt32,
      url: String?,
      user: User?
    )
  end
end
