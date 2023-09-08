module ApiTokensHelper
  def hide_token(token)
    token_length = token.length
    ('*' * (token_length - (token_length / 2))) + token[(token_length / 2)..]
  end
end
