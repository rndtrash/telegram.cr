require "json"

module Telegram
  struct User
    JSON.mapping(
      id: UInt32,
      is_bot: Bool,
      first_name: String,
      last_name: String?,
      username: String?,
      language_code: String?
    )
  end
end
