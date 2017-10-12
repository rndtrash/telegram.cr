require "json"

module Telegram
  struct Update
    JSON.mapping(
      update_id: UInt32,
      message: Message?,
      edited_message: Message?,
      channel_post: Message?,
      edited_channel_post: Message?
      #inline_query: InlineQuery?,
      #chosen_inline_result: ChosenInlineResult?,
      #callback_query: CallbackQuery?,
      #shipping_query: ShippingQuery?,
      #pre_checkout_query: PreCheckoutQuery?
    )
  end

  struct Updates
    JSON.mapping(
      ok: Bool,
      result: Array(Update)
    )
  end
end
